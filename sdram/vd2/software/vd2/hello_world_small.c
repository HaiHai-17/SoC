#include "sys/alt_stdio.h"
#include <stdio.h>
#include <alt_types.h>
#include "system.h"
int check_mem(alt_u32 mem_base, int min, int max)
{
	int err, real_err;
	alt_u32 *pbase;
	alt_u32 i;
	alt_u32 t_pattn = 0xfa30fa30;
	pbase = (alt_u32 *)mem_base;
	err = 0;
	printf("write started ... \n");
	for(i=min; i<(max-3);i++){
		pbase[i] = i ^ t_pattn;
		//pbase[i] = i + 9;
		//printf("Data %d is %d \n",i,pbase[i]);
	}
	for (i=max-3; i<=max;i++){
		pbase[i] = i;
	}
	printf("read back started ... \n");
	for (i=min; i<=max; i++){
		//printf("Data %d is %d \n",i,pbase[i]);
		if(pbase[i] != (i^t_pattn)){
		err++;
		}
		}
		real_err = err-4;
		printf("completed with %d actual errors.\n", real_err);
		return(real_err);
	}
int main()
{
	 alt_putstr("Hello from Nios II!\n");
	 printf("SRAM test: \n");
	 check_mem(SDRAM1_BASE,0,0x0001ffff);
	 //check_mem(SRAM_BASE,0,0x00020000);
	 printf("SRAM TEST ended.............\n");
	 printf(".............................\n");
	 printf("SDRAM test: \n");
	 check_mem(SDRAM2_BASE,0,0x001fffff);
	 printf("SDRAM TEST ended.............\n");
	 printf(".............................\n");
	 /* Event loop never exits. */
	 while (1);
	 return 0;
}
