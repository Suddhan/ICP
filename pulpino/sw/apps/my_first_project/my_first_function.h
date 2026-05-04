/*#ifndef MY_FIRST_FUNCTION_H
#define MY_FIRST_FUNCTION_H

//int sum (int x, int y);
//#endif
//#ifndef SRAM_TEST_H
//#define SRAM_TEST_H

#include <stdint.h>

#ifndef SRAM_BASE
#define SRAM_BASE 0x00108000 	//04E4 
#endif

#ifndef SRAM_SIZE
#define SRAM_SIZE 32768 // 32kB
#endif
*/
#ifndef MY_FIRST_FUNCTION_H
#define MY_FIRST_FUNCTION_H

#include <stdint.h>

#define SRAM_BASE 0x00100000 
#define SRAM_SIZE 32768

int my_first_function(void);

#endif
