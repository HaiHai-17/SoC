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
	int i, tmp;

	//char num[10]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39};
	char num[10]={'0','1','2','3','4','5','6','7','8','9'};
	 while (1)
	 {
		 tmp = IORD(KEY_BASE, 0);
		 if(tmp == 1){
			 if(tmp == 0){
				 IOWR_ALTERA_AVALON_UART_TXDATA(tmp, num[i/10]);
				 IOWR_ALTERA_AVALON_UART_TXDATA(tmp, num[i%10]);
				 delay(100);
				 IOWR_ALTERA_AVALON_UART_TXDATA(tmp, '\n');
				 delay(100);
				 i++;
			 }
		 }
	 }
	 return 0;
}
