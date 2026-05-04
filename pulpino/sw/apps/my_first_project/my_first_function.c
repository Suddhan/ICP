#include "my_first_function.h"
#include <stdint.h>

int my_first_function() {
    // Start at the safe offset defined in your header (0x00004000)
    volatile uint32_t *sram_ptr = (volatile uint32_t *)SRAM_BASE; 

    uint32_t start_w = 0x0600 / 4;
    uint32_t end_w = (SRAM_SIZE - 2048) / 4; 
    
    // Write Phase
    for (uint32_t i = start_w; i < end_w; i++) {
        sram_ptr[i] = 0x55AA0000 + i;
    }

    // Read & Verify Phase
    for (uint32_t i = start_w; i < end_w; i++) {
        uint32_t expected = 0x55AA0000 + i;
        uint32_t actual = sram_ptr[i];

        if (actual != expected) {
            return -1; // Failure detected
        }
    }
    return 0; // Success
}
/*#include "my_first_function.h"
#include <stdint.h>

int my_first_function() {
    volatile uint32_t *target = (volatile uint32_t *)(SRAM_BASE + 0x0008);
    
    // Write distinctive patterns
    target[0] = 0x00000008;
    target[1] = 0x00000008;
    target[2] = 0x00000008;

    // Small verify
    if (target[0] == 0x00000008 && target[1] == 0x00000008) {
        return 0; // PASS
    }
    
    return -1; // FAIL
}*/
