#include "resistance.h"
#include "power.h"
#include "component.h"
#include <stdio.h>

int main()
{
    printf("Hello Lib World!");

    float *array;
    calc_resistance(0,0,array);
    calc_power_i(0.0f,0.0f);
    e_resistance(0.0f, array);

    return 0;
}

