#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_uart_regs.h"
#include <stdint.h>

void delay(int a) {
    volatile int i = 0;
    while(i < a * 1000) {
        i++;
    }
}

int main() {
    char rxData;
    int leftSent = 0;
    int downSent = 0;
    int rightSent = 0;
    int upSent = 0;

    while (1) {
        rxData = IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);

        if (rxData == 'A' && leftSent == 0) {
            char left[] = {'L', 'e', 'f', 't', '\n'};
            int i;
            for (i = 0; i < sizeof(left)/sizeof(left[0]); i++) {
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, left[i]);
                delay(1);
            }
            leftSent = 1;
        } else if (rxData == 'S' && downSent == 0) {
            char down[] = {'D', 'o', 'w', 'n', '\n'};
            int i;
            for (i = 0; i < sizeof(down)/sizeof(down[0]); i++) {
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, down[i]);
                delay(1);
            }
            downSent = 1;
        } else if (rxData == 'D' && rightSent == 0) {
            char right[] = {'R', 'i', 'g', 'h', 't', ' ', '\n'};
            int i;
            for (i = 0; i < sizeof(right)/sizeof(right[0]); i++) {
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, right[i]);
                delay(1);
            }
            rightSent = 1;
        } else if (rxData == 'W' && upSent == 0) {
            char up[] = {'U', 'p', '\n'};
            int i;
            for (i = 0; i < sizeof(up)/sizeof(up[0]); i++) {
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, up[i]);
                delay(1);
            }
            upSent = 1;
        }

        if (rxData != 'A') {
            leftSent = 0;
        }
        if (rxData != 'S') {
            downSent = 0;
        }
        if (rxData != 'D') {
            rightSent = 0;
        }
        if (rxData != 'W') {
            upSent = 0;
        }
    }

    return 0;
}
