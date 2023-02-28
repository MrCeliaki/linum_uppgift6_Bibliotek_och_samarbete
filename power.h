#pragma once

namespace Power
{
    class Power
    {
        public:
            float calc_power_r(float volt, float resistance);
            float calc_power_i(float volt, float current);
    }
}