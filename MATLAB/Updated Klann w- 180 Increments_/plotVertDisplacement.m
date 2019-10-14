plot([1:180] * 360/180,y_dispKlann/max(y_dispKlann),'DisplayName','Klann')
hold on;
plot([1:180] * 360/180,y_dispTJ/max(y_dispTJ),'DisplayName','Theo Jansen')
title('Klann vs Theo Jansen ground to centre of gear height over single revolution (Normalized)');
ylabel('Vertical Displacement (cm)');
xlabel('Angle of Gear (degrees)');
lgd = legend;
lgd.NumColumns = 1;
grid on
