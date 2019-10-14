plot([1:180] * 360/180,ground_velKlann,'DisplayName','Klann')
hold on;
plot([1:180] * 360/180,ground_velTJ,'DisplayName','Theo Jansen')
title('Klann vs Theo Jansen Ground Velocity over single revolution');
ylabel('forward velocity (cm/s)');

xlabel('Angle of Gear (degrees)');
lgd = legend;
lgd.NumColumns = 1;
grid on
