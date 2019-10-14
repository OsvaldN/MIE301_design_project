%% Klann Linkage Analysis
%% Osvald Nitski
%%

close all; % closes all figures
clear all; % clears all variables from memory
clc;       % clears all calculations from the Matlab workspace

%% Plot Parameters
xmin= -20;       % leftmost window edge
xmax= 25;        % rightmost window edge
ymin= -10;       % bottom window edge
ymax= 15;        % top window edge

%% Sampling Parameters
increments = 60; 
max_rotation_theta2 = 360 *pi/180;
theta2 = linspace(0,max_rotation_theta2,increments);

%rot_vel = 0.786 * 40 / 7.73; %scaled rotational velocity from TJ mechanism
rot_vel = 0.786; %scaled rotational velocity from TJ mechanism


%% Link Parameters
l2 = 3;
l3 = 6;
l4 = 4;
l5 = 7;     % rigidly connected to l3
l6 = 10;
l7 = 8;     % rigidly connected to l6
l8 = 10;
ang35 = 10 * pi/180; % angle of link 3-5 at point D
ang67 = -10 * pi/180; % angle of link 6-7 at poin F

%% Point Equations
Ox = 0 * ones(1, increments);
Oy = 0 * ones(1, increments);
Ax = l2 * cos(theta2);
Ay = l2 * sin(theta2);
Bx = 6 * ones(1, increments);
By = -2 * ones(1, increments);
Cx = 3 * ones(1, increments);
Cy = 6 * ones(1, increments);

ABx = Bx - Ax;
ABy = Ay - By;
AB = sqrt(ABx.^2 + ABy.^2);
alpha = atan( ABy ./ ABx );
beta = acos((AB.^2 + l4^2 - l3^2) ./ (2 * l4 .* AB));
gamma = alpha + beta;
Dx = Bx - l4 * cos(gamma);
Dy = By + l4 * sin(gamma);

ADx = Dx - Ax;
ADy = Dy - Ay;
delta = atan(ADy ./ ADx);    % angle of AD below horizontal
Fx = Dx + l5 * cos(delta + ang35);
Fy = Dy + l5 * sin(delta + ang35);

CFx = Fx - Cx;
CFy = Fy - Cy;
CF = sqrt(CFx.^2 + CFy.^2);
epsilon = atan(CFy ./ CFx);    % angle of CD below horizontal
zeta = acos((CF.^2 + l7^2 - l6^2) ./ (2 * l7 .* CF));   %angle C of triangle CED
eta = epsilon + zeta;
Ex = Cx + l7 * cos(eta);
Ey = Cy + l7 * sin(eta);

EFx = Fx - Ex;
EFy = Fy - Ey;
iota = atan(EFy ./ EFx);    % angle of AD below horizontal
Gx = Fx + l8 * cos(iota + ang67);
Gy = Fy + l8 * sin(iota + ang67);

%% mirrored (back) leg
Bx2 = [ -Bx(31:-1:1) -Bx(60:-1:32)];
By2 = [ By(31:-1:1) By(60:-1:32)];
Cx2 = [ -Cx(31:-1:1) -Cx(60:-1:32)];
Cy2 = [ Cy(31:-1:1) Cy(60:-1:32)];
Dx2 = [ -Dx(31:-1:1) -Dx(60:-1:32)];
Dy2 = [ Dy(31:-1:1) Dy(60:-1:32)];
Ex2 = [ -Ex(31:-1:1) -Ex(60:-1:32)];
Ey2 = [ Ey(31:-1:1) Ey(60:-1:32)];
Fx2 = [ -Fx(31:-1:1) -Fx(60:-1:32)];
Fy2 = [ Fy(31:-1:1) Fy(60:-1:32)];
Gx2 = [ -Gx(31:-1:1) -Gx(60:-1:32)];
Gy2 = [ Gy(31:-1:1) Gy(60:-1:32)];

%% second legs
Ax2 = [Ax(31:60) Ax(1:32)];
Ay2 = [Ay(31:60) Ay(1:32)];
Bx3 = [Bx(31:60) Bx(1:32)];
By3 = [By(31:60) By(1:32)];
Cx3 = [Cx(31:60) Cx(1:32)];
Cy3 = [Cy(31:60) Cy(1:32)];
Dx3 = [Dx(31:60) Dx(1:32)];
Dy3 = [Dy(31:60) Dy(1:32)];
Ex3 = [Ex(31:60) Ex(1:32)];
Ey3 = [Ey(31:60) Ey(1:32)];
Fx3 = [Fx(31:60) Fx(1:32)];
Fy3 = [Fy(31:60) Fy(1:32)];
Gx3 = [Gx(31:60) Gx(1:32)];
Gy3 = [Gy(31:60) Gy(1:32)];

Bx4 = [Bx2(31:60) Bx2(1:32)];
By4 = [By2(31:60) By2(1:32)];
Cx4 = [Cx2(31:60) Cx2(1:32)];
Cy4 = [Cy2(31:60) Cy2(1:32)];
Dx4 = [Dx2(31:60) Dx2(1:32)];
Dy4 = [Dy2(31:60) Dy2(1:32)];
Ex4 = [Ex2(31:60) Ex2(1:32)];
Ey4 = [Ey2(31:60) Ey2(1:32)];
Fx4 = [Fx2(31:60) Fx2(1:32)];
Fy4 = [Fy2(31:60) Fy2(1:32)];
Gx4 = [Gx2(31:60) Gx2(1:32)];
Gy4 = [Gy2(31:60) Gy2(1:32)];



%% calculate mechanism motion and plot it
for j = 1:1           %number of revolutions
    for i=1:increments
        %hold off;
        
        %% Main Gear
        plot(0,0,'ro','MarkerFaceColor','w'); 
        hold on;
        grid on;
        plot([0,.15],[0,-.15],'r');                     
        plot([0,-.15],[0,-.15],'r');
        rectangle('Position',[-l2-0.5 -l2-0.5 2*l2+1 2*l2+1],'Curvature',[1, 1], 'LineWidth', 2);
        plot(Ax(mod(i+15,60)+1), Ay(mod(i+15,60)+1), 'k.');    % gear turning visual
        
        %% Minline
        
        f = [Gy(i) Gy3(i)];
        b = [Gy2(i) Gy4(i)];
        f_x = [Gx(i) Gx3(i)];
        b_x = [Gx2(i) Gx4(i)];
        [GFmin(i), fi] = min(f);
        [GBmin(i), bi] = min(b);
        GFx(i) = f_x(fi);
        GBx(i) = b_x(bi);
        Gmin(i) = min(GFmin(i), GBmin(i));
        plot([GFx(i) GBx(i)], [GFmin(i) GBmin(i)], 'b--');
        y_disp(i) = point_to_line([0, 0, 0], [GFx(i),GFmin(i), 0], [GBx(i), GBmin(i), 0]);
        text(15, 6, num2str(y_disp(i)),'color','b'); 
        angle(i) = atan((GFmin(i)- GBmin(i)) / (GFx(i) - GBx(i)));
        text(15, 10, num2str(angle(i)),'color','b'); 
        
        if i > 1  
            df_x = [Gx(i)-Gx(i-1) Gx3(i)-Gx3(i-1)];
            db_x = [Gx2(i)-Gx2(i-1) Gx4(i)-Gx4(i-1)];

            G_dx = abs(df_x(fi) + db_x(bi))/2;
            ground_vel(i) = G_dx/((1/rot_vel)/increments);
        end
        
        
        slope = polyfit([GFx(i) GBx(i)], [GFmin(i) GBmin(i)], 1);
        height_slope = -1/slope(1);
        %plot([0 y_disp(i).*cos(height_slope(1))], [0 y_disp(i).*sin(height_slope(1))], 'g--');
        
        
%         plot([-40 40], [0 0], 'g--');
%         plot([-40 40], [Gmin(i) Gmin(i)], 'g--');
         plot([GFx(i) GBx(i)], [GFmin(i) GBmin(i)], 'b--');
%         plot([21 23], [max(Gmin) max(Gmin)], 'k','LineWidth',2 );
%         plot([21 23], [min(Gmin) min(Gmin)], 'k','LineWidth',2 );
%         plot([20 20], [0 Gmin(i)], 'g-');
%         text(20, 1, num2str(-Gmin(i)),'color','b');            % y displacement
        
        
        %% Draw links
        %plot( [Ox(i) Ax(i)], [Oy(i), Ay(i)],'Color','r','LineWidth',3 );    % link 2
        plot( [Ox(i) Bx(i)], [Oy(i)-l2-2, By(i)],'Color','b','LineWidth',3 );    % OB link - invisible
        plot( [Bx(i) Cx(i)], [By(i), Cy(i)],'Color','b','LineWidth',3 );    % BC link - invisible
        plot( [Ax(i) Dx(i)], [Ay(i), Dy(i)],'Color','r','LineWidth',3 );    % link 3
        plot( [Bx(i) Dx(i)], [By(i), Dy(i)],'Color','r','LineWidth',3 );    % link 4
        plot( [Dx(i) Fx(i)], [Dy(i), Fy(i)],'Color','r','LineWidth',3 );    % link 5
        plot( [Ex(i) Fx(i)], [Ey(i), Fy(i)],'Color','r','LineWidth',3 );    % link 6
        plot( [Cx(i) Ex(i)], [Cy(i), Ey(i)],'Color','r','LineWidth',3 );    % link 7
        plot( [Fx(i) Gx(i)], [Fy(i), Gy(i)],'Color','r','LineWidth',3 );    % link 8
        
        %% Lines to show rigid links that cross turning pairs
        plot( [Ax(i) Fx(i)], [Ay(i), Fy(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ex(i) Gx(i)], [Ey(i), Gy(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ax(i) Fx2(i)], [Ay(i), Fy2(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ex2(i) Gx2(i)], [Ey2(i), Gy2(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ax2(i) Fx3(i)], [Ay2(i), Fy3(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ex3(i) Gx3(i)], [Ey3(i), Gy3(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ax2(i) Fx4(i)], [Ay2(i), Fy4(i)],'Color','r','LineWidth',2 );    % Rigid link
        plot( [Ex4(i) Gx4(i)], [Ey4(i), Gy4(i)],'Color','r','LineWidth',2 );    % Rigid link
        
        %% back leg
        plot( [Cx(i) Cx2(i)], [Cy(i), Cy2(i)],'Color','b','LineWidth',3 );    % top-bar
        plot( [Ox(i) Bx2(i)], [Oy(i)-l2-2, By2(i)],'Color','b','LineWidth',3 );    % symm
        plot( [Bx2(i) Cx2(i)], [By2(i), Cy2(i)],'Color','b','LineWidth',3 );  
        plot( [Ax(i) Dx2(i)], [Ay(i), Dy2(i)],'Color','r','LineWidth',3 );    
        plot( [Bx2(i) Dx2(i)], [By2(i), Dy2(i)],'Color','r','LineWidth',3 );  
        plot( [Dx2(i) Fx2(i)], [Dy2(i), Fy2(i)],'Color','r','LineWidth',3 );  
        plot( [Ex2(i) Fx2(i)], [Ey2(i), Fy2(i)],'Color','r','LineWidth',3 ); 
        plot( [Cx2(i) Ex2(i)], [Cy2(i), Ey2(i)],'Color','r','LineWidth',3 );  
        plot( [Fx2(i) Gx2(i)], [Fy2(i), Gy2(i)],'Color','r','LineWidth',3 ); 
        
        %% second set of legs
        %plot( [Ox(i) Ax2(i)], [Oy(i), Ay2(i)],'Color','r','LineWidth',3 );    % link 2
        plot( [Ax2(i) Dx3(i)], [Ay2(i), Dy3(i)],'Color','r','LineWidth',3 );    % link 3
        plot( [Bx3(i) Dx3(i)], [By3(i), Dy3(i)],'Color','r','LineWidth',3 );    % link 4
        plot( [Dx3(i) Fx3(i)], [Dy3(i), Fy3(i)],'Color','r','LineWidth',3 );    % link 5
        plot( [Ex3(i) Fx3(i)], [Ey3(i), Fy3(i)],'Color','r','LineWidth',3 );    % link 6
        plot( [Cx3(i) Ex3(i)], [Cy3(i), Ey3(i)],'Color','r','LineWidth',3 );    % link 7
        plot( [Fx3(i) Gx3(i)], [Fy3(i), Gy3(i)],'Color','r','LineWidth',3 );    % link 8
        
        plot( [Ax2(i) Dx4(i)], [Ay2(i), Dy4(i)],'Color','r','LineWidth',3 );    % link 3
        plot( [Bx4(i) Dx4(i)], [By4(i), Dy4(i)],'Color','r','LineWidth',3 );    % link 4
        plot( [Dx4(i) Fx4(i)], [Dy4(i), Fy4(i)],'Color','r','LineWidth',3 );    % link 5
        plot( [Ex4(i) Fx4(i)], [Ey4(i), Fy4(i)],'Color','r','LineWidth',3 );    % link 6
        plot( [Cx4(i) Ex4(i)], [Cy4(i), Ey4(i)],'Color','r','LineWidth',3 );    % link 7
        plot( [Fx4(i) Gx4(i)], [Fy4(i), Gy4(i)],'Color','r','LineWidth',3 );    % link 8
        
        %% Draw Turning Pairs
        plot(Ax(i), Ay(i), 'bo','MarkerFaceColor','w');     % A
        plot(Ax2(i), Ay2(i), 'bo','MarkerFaceColor','w');     % A
        %text(Ax(i)+0.9, Ay(i), 'A','color','b');            % A
        plot(Bx(i), By(i), 'bo','MarkerFaceColor','w');     % B
        plot(Bx2(i), By2(i), 'bo','MarkerFaceColor','w');     % B
        %text(Bx(i)+0.9, By(i), 'B','color','b');            % B
        plot(Cx(i), Cy(i), 'bo','MarkerFaceColor','w');     % C
        plot(Cx2(i), Cy2(i), 'bo','MarkerFaceColor','w');     % C
        %text(Cx(i)+0.9, Cy(i), 'C','color','b');            % C
        %plot(Dx(i), Dy(i), 'bo','MarkerFaceColor','w');     % D
        %text(Dx(i)+0.9, Dy(i), 'D','color','b');            % D
        %plot(Ex(i), Ey(i), 'bo','MarkerFaceColor','w');     % E
        %text(Ex(i)+0.9, Ey(i), 'E','color','b');            % E
        %plot(Fx(i), Fy(i), 'bo','MarkerFaceColor','w');     % F
        %text(Fx(i)+0.9, Fy(i), 'F','color','b');            % F
        %plot(Gx(i), Gy(i), 'bo','MarkerFaceColor','w');     % G
        %text(Gx(i)+0.9, Gy(i), 'G','color','b');            % G
        
        %% motion path of G
        for p = 1:(length(Gx)/30):length(Gx)
           plot(Gx(p), Gy(p), 'k.');
        end

        %hold on;                          % draw on top of the current figure
        hold off;                          % redraw the current figure
        grid off;                          % add a grid to the figure
        axis equal;                        % make sure the figure is not stretched
        title('Klann Mechanism');          % add a title to the figure
        axis( [xmin xmax ymin ymax] );     % figure axis limits
        pause(0.0005);                       % wait to proceed to next configuration, seconds
        
    end
end

%% vertical displacement
figure(2);
plot([1:60] * 360/60, y_disp/max(y_disp));
y_dispKlann=y_disp/max(y_disp);
axis( [0 361 0.85 1.05] ); %axis( [0 361 7 8.4] ); for non normalized values
%set(gca, 'XTickLabel', []);
title('Klann ground to centre of gear height over single revolution');
ylabel('Vertical Displacement (cm)');
xlabel('Angle of Gear (degrees)');
grid on

%% plot vertical acceleration
figure(3);
y_acc = -5* diff(y_disp, 2)/( 100* ( (1/rot_vel) / increments) ^2 ); %m/s^2
ymin=-9.81;
%fix this for theo janse
y_acc(y_acc<-9.81) = -9.81;
klannAccel=y_acc;
plot([2:increments-1] * 360/increments, y_acc);
%axis( [0 361 39.4 40.7] );
%set(gca, 'XTickLabel', []);
title('Klann vertical acceleration over single revolution');
ylabel('Vertical Acceleration (m/s^2)');
xlabel('Angle of Gear (degrees)');
grid on

%plot angle
figure(4);
plot([1:60] * 360/60, angle);
axis( [0 361 -0.05 0.05] );
%set(gca, 'XTickLabel', []);
title('Klann tilt over single revolution');
ylabel('angle from horizontal (rad)');
xlabel('Angle of Gear (degrees)');
grid on

%% plot ground velocity
figure(5);
plot([2:increments] * 360/increments, ground_vel(2:increments));
axis( [0 361 0 150] );
%set(gca, 'XTickLabel', []);
title('Klann ground velocity over single revolution');
ylabel('forward velocity (cm/s)');
xlabel('Angle of Gear (degrees)');
grid on

function d = point_to_line(pt, v1, v2)
      a = v1 - v2;
      b = pt - v2;
      d = norm(cross(a,b)) / norm(a);
end