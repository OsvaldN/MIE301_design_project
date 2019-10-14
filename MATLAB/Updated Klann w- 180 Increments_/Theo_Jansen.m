%% Klann Linkage Analysis
%% Osvald Nitski
%%

close all; % closes all figures
clear all; % clears all variables from memory
clc;       % clears all calculations from the Matlab workspace

%% Plot Parameters
xmin= -60;       % leftmost window edge
xmax= 160;        % rightmost window edge
ymin= -50;       % bottom window edge
ymax= 30;        % top window edge

%% Sampling Parameters
increments = 180; 
max_rotation_theta2 = 360 *pi/180;
theta2 = linspace(0,-max_rotation_theta2,increments);

%% Link Parameters
anchor_x = 102;
anchor_y = 0;
l2 = 15/2;
l3 = 50/2;
l4 = 61.9/2;
l5 = 41.5/2;
l6 = 55.8/2;
l7 = 40.1/2;
l8 = 39.3/2;
l9 = 39.4/2;
l10 = 36.7/2;
l11 = 49/2;
l12 = 65.7/2;
C_x = 38/2; % x displacement of c
C_y = -7.8/2; % y displacement of C

lengths = [C_x,C_y,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12];
%% Point Equations
%% put into function to be optimized


%base points
[Ox(1,1,:),Oy(1,1,:),Ax(1,1,:),Ay(1,1,:),Bx(1,1,:),By(1,1,:),Cx(1,1,:),Cy(1,1,:),Dx(1,1,:),Dy(1,1,:),Ex(1,1,:),Ey(1,1,:),Fx(1,1,:),Fy(1,1,:),Gx(1,1,:),Gy(1,1,:)] = theoJ(1,increments,0,anchor_x,anchor_y,lengths);
[Ox(2,1,:),Oy(2,1,:),Ax(2,1,:),Ay(2,1,:),Bx(2,1,:),By(2,1,:),Cx(2,1,:),Cy(2,1,:),Dx(2,1,:),Dy(2,1,:),Ex(2,1,:),Ey(2,1,:),Fx(2,1,:),Fy(2,1,:),Gx(2,1,:),Gy(2,1,:)] = theoJ(-1,increments,0,0,anchor_y,lengths);
[Ox(1,2,:),Oy(1,2,:),Ax(1,2,:),Ay(1,2,:),Bx(1,2,:),By(1,2,:),Cx(1,2,:),Cy(1,2,:),Dx(1,2,:),Dy(1,2,:),Ex(1,2,:),Ey(1,2,:),Fx(1,2,:),Fy(1,2,:),Gx(1,2,:),Gy(1,2,:)] = theoJ(1,increments,increments/3,anchor_x,anchor_y,lengths);
[Ox(2,2,:),Oy(2,2,:),Ax(2,2,:),Ay(2,2,:),Bx(2,2,:),By(2,2,:),Cx(2,2,:),Cy(2,2,:),Dx(2,2,:),Dy(2,2,:),Ex(2,2,:),Ey(2,2,:),Fx(2,2,:),Fy(2,2,:),Gx(2,2,:),Gy(2,2,:)] = theoJ(-1,increments,increments/3,0,anchor_y,lengths);
[Ox(1,3,:),Oy(1,3,:),Ax(1,3,:),Ay(1,3,:),Bx(1,3,:),By(1,3,:),Cx(1,3,:),Cy(1,3,:),Dx(1,3,:),Dy(1,3,:),Ex(1,3,:),Ey(1,3,:),Fx(1,3,:),Fy(1,3,:),Gx(1,3,:),Gy(1,3,:)] = theoJ(1,increments,2*increments/3,anchor_x,anchor_y,lengths);
[Ox(2,3,:),Oy(2,3,:),Ax(2,3,:),Ay(2,3,:),Bx(2,3,:),By(2,3,:),Cx(2,3,:),Cy(2,3,:),Dx(2,3,:),Dy(2,3,:),Ex(2,3,:),Ey(2,3,:),Fx(2,3,:),Fy(2,3,:),Gx(2,3,:),Gy(2,3,:)] = theoJ(-1,increments,2*increments/3,0,anchor_y,lengths);

rot_vel = 0.786;

for i = 1:increments
    f = [Gy(1,1,i) Gy(1,2,i) Gy(1,3,i)];
    b = [Gy(2,1,i) Gy(2,2,i) Gy(2,3,i)];
    
    f_x = [Gx(1,1,i) Gx(1,2,i) Gx(1,3,i)];
    b_x = [Gx(2,1,i) Gx(2,2,i) Gx(2,3,i)];
    
    [GFmin(i), fi] = min(f);
    [GBmin(i), bi] = min(b);
    GFx(i) = f_x(fi);
    GBx(i) = b_x(bi);
    Gmin(i) = min(GFmin(i), GBmin(i));

    %forward speed vector
    if i > 1  
        df_x = [Gx(1,1,i)-Gx(1,1,i-1) Gx(1,2,i)-Gx(1,2,i-1) Gx(1,3,i)-Gx(1,3,i-1)];
        db_x = [Gx(2,1,i)-Gx(2,1,i-1) Gx(2,2,i)-Gx(2,2,i-1) Gx(2,3,i)-Gx(2,3,i-1)];
        
        G_dx = abs(df_x(fi) + db_x(bi))/2;
        ground_vel(i) = G_dx/((1/rot_vel)/increments);
    end
    
    %displacement and angle calculations
    y_disp(i) = point_to_line([0, 0, 0], [GFx(i),GFmin(i), 0], [GBx(i), GBmin(i), 0]);
    angle(i) = atan((GFmin(i)- GBmin(i)) / (GFx(i) - GBx(i)));
end



%% calculate mechanism motion and plot it
for j = 1:1           %number of revolutions
    for i=1:2%increments
        hold off;
        
        %% Main Gear
        figure(1)
        plot(0,0,'ro','MarkerFaceColor','w');
        plot(anchor_x,0,'ro','MarkerFaceColor','w'); 
        plot([0 anchor_x], [0 0], 'k','LineWidth',2 );
        axis( [xmin xmax ymin ymax] );
        hold on;
        grid on;
        rectangle('Position',[-l2-0.5 -l2-0.5 2*l2+1 2*l2+1],'Curvature',[1, 1], 'LineWidth', 2);
        rectangle('Position',[-l2-0.5+anchor_x -l2-0.5 2*l2+1 2*l2+1],'Curvature',[1, 1], 'LineWidth', 2);
        plot(Ax(1,1,mod(i+increments/4,increments)+1), Ay(1,1,mod(i+increments/4,increments)+1), 'k.');    % gear turning visual
        
        %% Minline
        
        plot([GFx(i) GBx(i)], [GFmin(i) GBmin(i)], 'b--');
        %y_disp(i) = point_to_line([0, 0, 0], [GFx(i),GFmin(i), 0], [GBx(i), GBmin(i), 0]);
        text(15, 6, num2str(y_disp(i)),'color','b'); 
        %angle(i) = atan((GFmin(i)- GBmin(i)) / (GFx(i) - GBx(i)));
        text(15, 10, num2str(angle(i)),'color','b'); 
        
        %% Draw links
        for k = 1:2
            for m = 1:3
                plot( [Ox(k,m,i) Ax(k,m,i)], [Oy(k,m,i), Ay(k,m,i)],'Color','k','LineWidth',3 );    % link 2
                plot( [Ax(k,m,i) Bx(k,m,i)], [Ay(k,m,i), By(k,m,i)],'Color','r','LineWidth',3 );    % link 3
                plot( [Ax(k,m,i) Ex(k,m,i)], [Ay(k,m,i), Ey(k,m,i)],'Color','r','LineWidth',3 );    % link 4
                plot( [Bx(k,m,i) Cx(k,m,i)], [By(k,m,i), Cy(k,m,i)],'Color','b','LineWidth',3 );    % link 5
                plot( [Bx(k,m,i) Dx(k,m,i)], [By(k,m,i), Dy(k,m,i)],'Color','b','LineWidth',3 );    % link 6
                plot( [Cx(k,m,i) Dx(k,m,i)], [Cy(k,m,i), Dy(k,m,i)],'Color','b','LineWidth',3 );    % link 7
                plot( [Cx(k,m,i) Ex(k,m,i)], [Cy(k,m,i), Ey(k,m,i)],'Color','g','LineWidth',3 );    % link 8
                plot( [Dx(k,m,i) Fx(k,m,i)], [Dy(k,m,i), Fy(k,m,i)],'Color','g','LineWidth',3 );    % link 9
                plot( [Ex(k,m,i) Fx(k,m,i)], [Ey(k,m,i), Fy(k,m,i)],'Color','b','LineWidth',3 );    % link 10
                plot( [Ex(k,m,i) Gx(k,m,i)], [Ey(k,m,i), Gy(k,m,i)],'Color','b','LineWidth',3 );    % link 11
                plot( [Fx(k,m,i) Gx(k,m,i)], [Fy(k,m,i), Gy(k,m,i)],'Color','b','LineWidth',3 );    % link 12
            end
        end
        
        
        %% motion path of G
        for p = 1:increments
           plot(Gx(1,1,p), Gy(1,1,p), 'k.');
        end

        %hold on;                          % draw on top of the current figure
        hold off;                          % redraw the current figure
        grid off;                          % add a grid to the figure
        %axis equal;                        % make sure the figure is not stretched
        title('Theo Jansen Mechanism');          % add a title to the figure
        axis( [xmin xmax ymin ymax] );     % figure axis limits
          pause(0.0005);                       % wait to proceed to next configuration, seconds
    end
end

%% plot vertical displacement
figure(2);
plot([1:increments] * 360/increments, y_disp/max(y_disp));
axis( [0 361 0.85 1.05] ); % axis( [0 361 39.4 40.7] ); % for non normalized values
%set(gca, 'XTickLabel', []);
title('Jansen normalized ground to centre of gear height over single revolution');
ylabel('Vertical Displacement (max = 1)');
xlabel('Angle of Gear (degrees)');
grid on

%% plot vertical acceleration
figure(3);
y_acc = -1*diff(y_disp, 2)/( 100* ( (1/rot_vel) / increments) ^2 ); %m/s^2
for i=1:length(y_acc)
if y_acc(i) < -9.81;
    y_acc(i) = -9.81;
end
    
end
plot([2:increments-1] * 360/increments, y_acc);
axis( [0 361 -10 30] ); % for Klann comparison
%axis( [0 361 39.4 40.7] );
%set(gca, 'XTickLabel', []);
title('Jansen vertical acceleration over single revolution');
ylabel('Vertical Acceleration (m/s^2)');
xlabel('Angle of Gear (degrees)');
grid on

%% plot angle
figure(4);
plot([1:increments] * 360/increments, angle*180/pi);
%axis( [0 361 -0.05 0.05] );
%set(gca, 'XTickLabel', []);
title('Jansen tilt over single revolution');
ylabel('angle from horizontal (degrees)');
xlabel('Angle of Gear (degrees)');
grid on

%% plot ground velocity
figure(5);
plot([2:increments] * 360/increments, ground_vel(2:increments));
axis( [0 361 0 150] ); % for Klann comparison
%set(gca, 'XTickLabel', []);
title('Jansen ground velocity over single revolution');
ylabel('forward velocity (cm/s)');
xlabel('Angle of Gear (degrees)');
grid on

function d = point_to_line(pt, v1, v2)
      a = v1 - v2;
      b = pt - v2;
      d = norm(cross(a,b)) / norm(a);
end

function [Ox,Oy,Ax,Ay,Bx,By,Cx,Cy,Dx,Dy,Ex,Ey,Fx,Fy,Gx,Gy] = theoJ(dir,increments, offset,anchor_x,anchor_y,lengths)
    %expand length
    lengths = num2cell(lengths);
    [C_x,C_y,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12] = deal(lengths{:});
    
    %setup rotation vector
    max_rotation_theta2 = 360 *pi/180;
    theta2 = linspace(0,dir*-max_rotation_theta2,increments + 1);
    theta2 = theta2(1:end-1); %removes everlap from linspace
    theta2 = [theta2(offset+1:end) theta2(1:offset)]; %handles offset
    if dir == -1
        theta2 = [theta2(increments/2+1:increments) theta2(1:increments/2)]; %fixes mirroring issues\
    end
    
    
    Ox = zeros(1, increments);
    Oy = zeros(1, increments);
    Cx = Ox + C_x;
    Cy = Oy + C_y;

    Ax = l2 * cos(theta2);
    Ay = l2 * sin(theta2);

    ACx = Cx - Ax;
    ACy = Cy - Ay;
    theta_AC = atan2( ACy , ACx );
    AC = sqrt(ACx.^2 + ACy.^2);

    alpha_A = acos((AC.^2 + l3^2 - l5^2) ./ (2 * l3 .* AC));
    beta_A = acos((AC.^2 + l4^2 - l8^2) ./ (2 * l4 .* AC));
    theta_B = theta_AC + alpha_A;
    theta_E = theta_AC - beta_A;
    Bx = Ax + l3 * cos(theta_B);
    By = Ay + l3 * sin(theta_B);
    Ex = Ax + l4 * cos(theta_E);
    Ey = Ay + l4 * sin(theta_E);

    theta_CB = atan2( (By - Cy) , (Bx - Cx) );
    phi_57 = acos((l5^2 + l7^2 - l6^2) / (2 * l5 * l7)); %angle between BC and BD
    theta_D = theta_CB - phi_57;

    Dx = Cx + l7 * cos(theta_D);
    Dy = Cy + l7 * sin(theta_D);

    EDx = Dx - Ex;
    EDy = Dy - Ey;
    theta_ED = atan2( EDy , EDx );
    ED = sqrt(EDx.^2 + EDy.^2);
    
    alpha_E = acos((ED.^2 + l10^2 - l9^2) ./ (2 * l10 .* ED));
    theta_F = theta_ED - alpha_E;
    Fx = Ex + l10*cos(theta_F);
    Fy = Ey + l10*sin(theta_F);

    beta_E = acos((l11^2 + l10^2 - l12^2) / (2 * l10 * l11));
    theta_G = theta_F - beta_E;
    Gx = Ex + l10*cos(theta_G);
    Gy = Ey + l10*sin(theta_G);
    
    %apply mirroring if specified
    Ox = Ox + anchor_x;
    Ax = dir * Ax + anchor_x;
    Bx = dir * Bx + anchor_x;
    Cx = dir * Cx + anchor_x;
    Dx = dir * Dx + anchor_x;
    Ex = dir * Ex + anchor_x;
    Fx = dir * Fx + anchor_x;
    Gx = dir * Gx + anchor_x;
    
end
