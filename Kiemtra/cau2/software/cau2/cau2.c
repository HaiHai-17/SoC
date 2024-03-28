
#include <stdio.h>
#include "io.h"
#include "system.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_irq.h"
unsigned int counter = 0;


unsigned int hh = 13;
unsigned int mm = 10;
unsigned int ss = 00;

const unsigned char LED_HEX[17] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E, 0xFF};


void Time_Clock(){
	ss++;
	if(ss==60){
		mm++;
		if(mm==60){
			hh++;
			if(hh==24){
				hh=0;
			}
			mm=0;
		}
		ss=0;
	}
}


void Display(){
	Time_Clock();
	// Hien thi ra console
	printf("\t%d : %d : %d \n", hh, mm, ss);

	// Hien thi ra cac HEX
	// Hien thi so giay
	IOWR(HEX_0_BASE,0, LED_HEX[ss%10]);
	IOWR(HEX_1_BASE,0, LED_HEX[ss/10]);

	// Hien thi so phut
	IOWR(HEX_2_BASE,0, LED_HEX[mm%10]);
	IOWR(HEX_3_BASE,0, LED_HEX[mm/10]);

	// Hien thi so phut
	IOWR(HEX_4_BASE,0, LED_HEX[hh%10]);
	IOWR(HEX_5_BASE,0, LED_HEX[hh/10]);
}

void Edit_Time(){

}



void timer_Init(){
	unsigned int period = 0;
	// Stop Timer
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_STOP_MSK);
	//Configure period
	period = 50000000 - 1;
	IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, period);
	IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (period >> 16));
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
			ALTERA_AVALON_TIMER_CONTROL_CONT_MSK |    // Continue counting mode
			ALTERA_AVALON_TIMER_CONTROL_ITO_MSK |     // Interrupt enable
			ALTERA_AVALON_TIMER_CONTROL_START_MSK);   // Start Timer
}



void Timer_IRQ_Handler(void* isr_context){
counter ++;
if(counter==100) {counter=0;}
printf("%d seconds\n", counter);
IOWR(HEX_2_BASE,0, LED_HEX[16]);
IOWR(HEX_3_BASE,0, LED_HEX[16]);
IOWR(HEX_4_BASE,0, LED_HEX[16]);
IOWR(HEX_5_BASE,0, LED_HEX[16]);
IOWR(HEX_6_BASE,0, LED_HEX[16]);
IOWR(HEX_7_BASE,0, LED_HEX[16]);

IOWR(HEX_0_BASE,0, LED_HEX[counter%10]);
IOWR(HEX_1_BASE,0, LED_HEX[counter/10]);

	//Display();

// Clear Timer interrupt bit
IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,ALTERA_AVALON_TIMER_STATUS_TO_MSK);
}



void main(){
	timer_Init();
	alt_ic_isr_register(0, TIMER_0_IRQ, Timer_IRQ_Handler, (void*)0, (void*)0);
	while(1);
}
