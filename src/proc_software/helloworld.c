/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

// the premise here is that we have a GPIO where channel 0 is the phase increment, and ch1 is resetn


#include <stdio.h>
#include <math.h>
#include "platform.h"
#include "xparameters.h"
#include "xiic_l.h"

#define IIC_BASE_ADDRESS	XPAR_IIC_0_BASEADDR
#define CODEC_ADDRESS 26


void write_codec_register(unsigned int codec_reg_num, unsigned int data)
{
	   int ByteCount;
	   unsigned char databuf[10];
	   databuf[0]=(codec_reg_num << 1) | ((data<<7)&0x80); // this puts the register address in the proper place
	   databuf[0]=(codec_reg_num << 1) | ((data>>8)&0x01); // this puts the register address in the proper place and adds top bit of 9 bit data
	      databuf[1]=data&0xff;


	   ByteCount = XIic_Send(IIC_BASE_ADDRESS,
						CODEC_ADDRESS,
						databuf,
						2,
						XIIC_STOP);


}


void configure_codec()
{
     write_codec_register(15,0x00);
     usleep(1000);
     write_codec_register(6,0x30);
     write_codec_register(0,0x17);
     write_codec_register(1,0x17);
     write_codec_register(2,0x79);
     write_codec_register(3,0x79);
     write_codec_register(4,0x10);
     write_codec_register(5,0x00);
     write_codec_register(7,0x02);
     write_codec_register(8,0x00);
     usleep(75000);
	 write_codec_register(6,0x27);
	 usleep(75000);
     write_codec_register(9,0x01);
}


void main()
{
    print("Welcome to Microblaze\r\n");
    print("Configuring Codec Now...\r\n");
    configure_codec();
    unsigned int i=0;
    while(1)
    {
    usleep(1000000);
    xil_printf("Uptime : %d seconds\n\r",i++);
    }
}


