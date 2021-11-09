function Forceresult = ResistanceForces (Constmatrix)
% Calculating Air Resistance Force 
v = Constmatrix (1);
C_D = Constmatrix (5);
A_F = Constmatrix (9);
d_air =Constmatrix (8);

Fa = 0.5 * d_air * C_D * A_F * v * v;

% here we calculate Rolling Resistance
fr = Constmatrix(6);
M = Constmatrix(10);
g = Constmatrix(17);
Rr = fr * M * g ;
% Calculating Inertia Fcorce
dec = Constmatrix (2);
Fi = M * dec;
% Calculating Laterral Force
R = Constmatrix (7);
Fl = (M *v^2) / R;
Forceresult = [Rr, Fa , Fi , Fl];

end
