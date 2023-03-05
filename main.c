#include "resistance.h"
#include "power.h"
#include "component.h"
#include <stdio.h>

int main()
{
    printf("success: 0\n");

    float *array;
    calc_resistance(0,0,array);
    printf("success: 1\n");

    calc_power_i(0.0f,0.0f);
    printf("success: 2\n");
    
    e_resistance(0.0f, array);
    printf("success: 3\n");

    return 0;
}

