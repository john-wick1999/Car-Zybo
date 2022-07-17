################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/drivers/motor.c \
../src/drivers/pwm.c 

OBJS += \
./src/drivers/motor.o \
./src/drivers/pwm.o 

C_DEPS += \
./src/drivers/motor.d \
./src/drivers/pwm.d 


# Each subdirectory must supply rules for building sources it contributes
src/drivers/%.o: ../src/drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/Users/aleja/Desktop/Projects/Car_Zybo/project_1/ZyboCarPlatform/export/ZyboCarPlatform/sw/ZyboCarPlatform/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


