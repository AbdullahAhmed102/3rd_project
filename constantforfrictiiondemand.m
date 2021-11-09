function C = constantforfrictiiondemand(Speed, Deceleration, TurningRadius, Mass)

v = Speed ;         % velocity                       [m/sec]
dec = Deceleration;      % Decceleration                  [m/sec^2]
k_bf =0.6 ;     % Front break distribution
k_br = 0.4 ;    % Rare break distribution
C_D = 0.3;      % Drag coefficient 
f_R = 0.012;    % Rolling rissistence factor
R_T = TurningRadius;      % Turnning Raduis                [m]
d_air = 1.225;  % Air denisty                    [Kg/m^3]
A_F = 2;        % Frontal area                   [m^2]
M = Mass;       % Car mass                       [Kg]
R_r = 0.31 ;    % Rolling radius                 [m]
B = 1.6 ;       % Track width                    [m]
Lf = 1.5  ;     % Front wheel base               [m]
Lr = 1.5  ;     % Rare wheel base                [m]
H = 0.75  ;     % The highet from c.g            [m]
h = 0.65  ;     % The highet for air resisstence [m]
g = 9.81  ;     % earth grvity acceleration      [m/sec^2]
M_R = 200;      % Rotating Parts Moment of Inertia            [Kg]
C = [v, dec, k_bf, k_br, C_D, f_R, R_T, d_air, A_F, M, R_r, B, Lf, Lr, H, h, g, M_R]; % store all constant in the ouput fn.C
end