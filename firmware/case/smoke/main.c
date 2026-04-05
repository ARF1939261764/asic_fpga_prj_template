#include "stdio.h"
#include "printf.h"
#include "uart.h"

volatile int a = 5;
volatile int b;

int main(void){
  printf("hello world0\n");
  printf("hello world1\n");
  printf("hello world2\n");
  printf("hello world3\n");
  printf("hello world4\n");
  printf("hello world5\n");
  printf("hello world6\n");
  uart_putc(0x54000000,0);
}

