#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "io.h"
#include "sys/alt_irq.h"

int ngay = 21, thang = 03, nam = 2024, gio, phut, giay;
unsigned int counter = 0;
char data[10]={'0','1','2','3','4','5','6','7','8','9'};

void timer_Init(){
	unsigned int period = 0;
	// Stop Timer
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
	ALTERA_AVALON_TIMER_CONTROL_STOP_MSK);
	//Configure period
	period = 50000000 - 1;
	IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, period);
	IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (period >> 16));
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
	ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | // Continue counting mode
	ALTERA_AVALON_TIMER_CONTROL_ITO_MSK | // Interrupt enable
	ALTERA_AVALON_TIMER_CONTROL_START_MSK);// Start Timer
}

void Timer_IRQ_Handler(void* isr_context){
	giay ++;
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,
	ALTERA_AVALON_TIMER_STATUS_TO_MSK);
}

void delay(int a){
    volatile int i=0;
    while(i<a*1000) {i++; }
}

void command(int data){
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_RS_BASE, 0x00);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_RW_BASE, 0x00);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_DATA_BASE, data & 0xFF);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_EN_BASE, 0x01);
    delay(20);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_EN_BASE, 0x00);
    delay(20);
}

void lcd_data(char data){
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_RS_BASE, 0x01);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_RW_BASE, 0x00);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_DATA_BASE, data & 0xFF);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_EN_BASE, 0x01);
    delay(20);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_EN_BASE, 0x00);
    delay(20);
}

void lcd_string(char *str) {
	char i=0;
	while(str[i] != 0){
		lcd_data(str[i]);
		i++;
	 }
}

void lcd_init(){
    command(0x38); delay(100);
    command(0x0c); delay(100);
    command(0x06); delay(100);
    command(0x01);
}

void ngaythang(){
    giophut();

    if((nam % 4 == 0 && nam % 100 != 0) || (nam % 400 == 0)){
        if(thang == 2){
            if(ngay > 29){
                ngay = 1;
                thang++;
            }
        }
    } else {
        if(thang == 2){
            if(ngay > 28){
                ngay = 1;
                thang++;
            }
        }
    }
    //command(0x80);
    printf("%02d/%02d/%04d", ngay, thang, nam);
}
void giophut(){
    if(giay == 60){
        phut++;
        if(phut == 60){
            gio++;
            if(gio == 24){
                gio = 0;
                phut = 0;
                giay = 0;
                ngay++;
            }
        }
    }
    //command(0xC0);
    printf("%d/%d/%d", gio, phut, giay);
}

int main(void){

    lcd_init();
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_ON_BASE, 0x01);
    IOWR_ALTERA_AVALON_PIO_DATA(LCD_BLON_BASE, 0x01);

    while(1){
        ngaythang();
        giophut();
        delay(1000);
    }

    return 0;
}
