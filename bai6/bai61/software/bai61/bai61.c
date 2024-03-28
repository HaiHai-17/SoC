#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_uart_regs.h"
#include <stdint.h>
void delay(int a)
{
	volatile int i=0;
	while(i<a*10000)
	 {
	 i++;
	 }
}
int main()
{
	int i,j;

	//char num[10]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39};
	char num[10]={'0','1','2','3','4','5','6','7','8','9'};
	 while (1)
	 {
		 for(i=0;i<100;i++)
		 {
			 IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, num[i/10]);
			 IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, num[i%10]);
			 delay(100);
			 IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, '\n');
			 delay(100);
		 }
	 }
	 return 0;
}
