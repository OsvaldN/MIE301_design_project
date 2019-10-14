plot([1:180] * 360/180,angleKlann*180/pi,'DisplayName','Klann')
hold on;
plot([1:180] * 360/180,angleTJ*180/pi,'DisplayName','Theo Jansen')
title('Klann vs Theo Jansen Platform Tilt over single revolution');
ylabel('angle from horizontal (degrees)');
xlabel('Angle of Gear (degrees)');
lgd = legend;
lgd.NumColumns = 1;
grid on
