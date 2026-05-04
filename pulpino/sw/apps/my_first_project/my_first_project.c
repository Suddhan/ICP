#include<stdio.h>
#include"my_first_function.h"

//int main() {
//printf("The sum is %d\n",sum(4,3));
//return 0;
//}

int main() {
    printf("Starting SRAM Test...\n");
    
    if (my_first_function() == 0) {
        printf("SUCCESS!\n");
    } else {
        printf("FAILURE!\n");
    }

    printf("Test complete. Parking CPU.\n");
    
    while(1) {
        // Force the CPU to stay here forever
        asm volatile("nop");
    }
    
    return 0; // The CPU should never reach this line
}
