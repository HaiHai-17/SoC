#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_uart_regs.h"
#include <stdint.h>

void delay(int a) {
    volatile int i=0;
    while(i<a*1000) {
        i++;
    }
}

int main() {
    char rxData;

    while (1) {
        rxData = IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);

        switch(rxData) {
            case 'A':
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'L');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'e');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'f');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 't');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, '\n');
                break;

            case 'D':
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'R');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'i');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'g');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'h');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 't');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, '\n');
                break;

            case 'W':
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'U');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'p');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, '\n');
                break;

            case 'S':
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'D');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'o');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'w');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, 'n');
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, '\n');
                break;

            default:
                break;
        }

        delay(100); // Delay for stability
    }

    return 0;
}
