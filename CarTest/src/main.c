#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpiops.h"
#include "sleep.h"
#include "xil_exception.h"
#include "xttcps.h"
#include "xscugic.h"
#include "xil_io.h"
#include "xparameters.h"
#include "Utrasonic_IP.h"


#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_0_DEVICE_ID
#define	TICK_TIMER_FREQ_HZ	100
#define TTC_TICK_DEVICE_ID	XPAR_XTTCPS_0_DEVICE_ID
#define TTC_TICK_INTR_ID	XPAR_XTTCPS_0_INTR

static void TickHandler(void *CallBackRef);
int SetupTicker(XTtcPs *TtcPsInst,u16 DeviceID,u16 TtcTickIntrID,XScuGic *InterruptController);
static int SetupInterruptSystem(u16 IntcDeviceID,XScuGic *IntcInstancePtr);
int SetupTimer(u16 DeviceID,XTtcPs *TtcPsInst);
void set_pwm(u32 cycle);
void display_menu();

typedef struct {
    u32 OutputHz;	/* Output frequency */
    XInterval Interval;	/* Interval value */
    u8 Prescaler;	/* Prescaler value */
    u16 Options;	/* Option settings */
} TmrCntrSetup;

XGpioPs Gpio;
XGpioPs_Config *ConfigPtr;
XTtcPs_Config *TtcConfig;
XTtcPs ttcTimer;
TmrCntrSetup *TimerSetup;
XScuGic InterruptController;  	/* Interrupt controller instance */
XTtcPs TtcPsInst;
u32 MatchValue;

static TmrCntrSetup SettingsTable={TICK_TIMER_FREQ_HZ, 0, 0, 0};

int main()
{
    u8 DutyCycle;
    u8 PrevDutyCycle;
    u32 distance;

    init_platform();

    TmrCntrSetup SettingsTable = {TICK_TIMER_FREQ_HZ, 0, 0, 0};
    ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
    XGpioPs_CfgInitialize(&Gpio, ConfigPtr,ConfigPtr->BaseAddr);
        XGpioPs_SetDirectionPin(&Gpio, 54, 1);
    XGpioPs_SetOutputEnablePin(&Gpio, 54, 1);
    XGpioPs_WritePin(&Gpio, 54, 0x1);
    printf("DC Motor Control With HC_SR04\n\r");
    SetupInterruptSystem(INTC_DEVICE_ID, &InterruptController);
    SetupTicker(&ttcTimer,TTC_TICK_DEVICE_ID,TTC_TICK_INTR_ID,&InterruptController);
    while(1) {
        distance = UTRASONIC_IP_mReadReg(XPAR_UTRASONIC_IP_0_S00_AXI_BASEADDR, UTRASONIC_IP_S00_AXI_SLV_REG0_OFFSET);

        if (distance > 0 && distance < 3) {
            DutyCycle = 0;
        } else if (distance < 6) {
            DutyCycle = 25;
        } else if (distance < 9) {
            DutyCycle = 33;
        } else if (distance < 12) {
            DutyCycle = 50;
        } else if (distance < 15) {
            DutyCycle = 66;
        } else if (distance < 18) {
            DutyCycle = 75;
        } else if (distance < 21) {
            DutyCycle = 100;
        } else {
            DutyCycle = 0;
        }

       if (DutyCycle != PrevDutyCycle) {
            set_pwm(DutyCycle);
       }

        PrevDutyCycle = DutyCycle;
        sleep(0.5);

        printf("Distance: %u cm\n\r", distance);
        printf("DutyCycle: %u\n\r\n\r", DutyCycle);
    }

    cleanup_platform();
    return 0;
}

void set_pwm(u32 cycle)
{
    u32 MatchValue;
    MatchValue = (TimerSetup->Interval * cycle) / 100;
    XTtcPs_SetMatchValue(&ttcTimer, 0, MatchValue);
}

int SetupTicker(XTtcPs *TtcPsInst,u16 DeviceID,u16 TtcTickIntrID,XScuGic *InterruptController)
{
    int Status;
    TmrCntrSetup *TimerSetup;
    XTtcPs *TtcPsTick;

    TimerSetup = &SettingsTable;
    TimerSetup->Options |= (XTTCPS_OPTION_INTERVAL_MODE |
        XTTCPS_OPTION_MATCH_MODE | XTTCPS_OPTION_WAVE_POLARITY);
    Status = SetupTimer(DeviceID,TtcPsInst);

    if(Status != XST_SUCCESS) {
        return Status;
    }

    TtcPsTick = TtcPsInst;
    Status = XScuGic_Connect(InterruptController, TtcTickIntrID,
        (Xil_InterruptHandler)TickHandler, (void *)TtcPsTick);

    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XScuGic_Enable(InterruptController, TtcTickIntrID);
    XTtcPs_EnableInterrupts(TtcPsTick, XTTCPS_IXR_INTERVAL_MASK);
    XTtcPs_Start(TtcPsTick);

    return Status;
}

static int SetupInterruptSystem(u16 IntcDeviceID,XScuGic *IntcInstancePtr)
{
    int Status;
    XScuGic_Config *IntcConfig;
    IntcConfig = XScuGic_LookupConfig(IntcDeviceID);

    if (NULL == IntcConfig) {
        return XST_FAILURE;
    }

    Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
        IntcConfig->CpuBaseAddress);

    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
        (Xil_ExceptionHandler) XScuGic_InterruptHandler,
        IntcInstancePtr);
    Xil_ExceptionEnable();

    return XST_SUCCESS;
}

int SetupTimer(u16 DeviceID,XTtcPs *TtcPsInst)
{
    int Status;
    XTtcPs_Config *Config;
    XTtcPs *Timer;
    TmrCntrSetup *TimerSetup;

    TimerSetup = &SettingsTable;
    Timer = TtcPsInst;
    Config = XTtcPs_LookupConfig(DeviceID);

    if (NULL == Config) {
        return XST_FAILURE;
    }

    Status = XTtcPs_CfgInitialize(Timer, Config, Config->BaseAddress);

    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XTtcPs_SetOptions(Timer, TimerSetup->Options);
    XTtcPs_CalcIntervalFromFreq(Timer, TimerSetup->OutputHz,
        &(TimerSetup->Interval), &(TimerSetup->Prescaler));
    XTtcPs_SetInterval(Timer, TimerSetup->Interval);
    XTtcPs_SetPrescaler(Timer, TimerSetup->Prescaler);

return XST_SUCCESS;
}

static void TickHandler(void *CallBackRef)
{
    u32 StatusEvent;
    //Read the interrupt status, then write it back to clear the interrupt.
    StatusEvent = XTtcPs_GetInterruptStatus((XTtcPs *)CallBackRef);
    XTtcPs_ClearInterruptStatus((XTtcPs *)CallBackRef, StatusEvent);
}
