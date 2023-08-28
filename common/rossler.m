function Value_dx = rossler(Time, Value_x)
Value_dx = [-Value_x(2) - Value_x(3); Value_x(1) + 0.2 * Value_x(2); 0.2 + (Value_x(1) - 5.7) * Value_x(3)];
