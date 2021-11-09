function MiniReqMue = FrictionDemoned(Forcevec , Constmatrix) 


M = Constmatrix(10);
g = Constmatrix(17);
L2 = Constmatrix(14);
L1 = Constmatrix(13);
L = L1 + L2;
Fa = Forcevec(2);
h = Constmatrix(16);
Fi = Forcevec(3);
H = Constmatrix(15);
B = Constmatrix(12);
Fl = Forcevec(4);
N_fr = (M * g * (L2/L) * 0.5) - ((Fa * h)/(L * 2)) + ((Fi * H)/(L*2)) + ((Fl*H*L2)/(B*L));
N_fl = (M * g * (L2/L) * 0.5) - ((Fa * h)/(L * 2)) + ((Fi * H)/(L*2)) - ((Fl*H*L2)/(B*L));
N_rr = (M * g * (L1/L) * 0.5) + ((Fa * h)/(L * 2)) - ((Fi * H)/(L*2)) + ((Fl*H*L1)/(B*L));
N_rl = (M * g * (L1/L) * 0.5) + ((Fa * h)/(L * 2)) - ((Fi * H)/(L*2)) - ((Fl*H*L1)/(B*L));

if (N_fr <= 0 || N_fl <= 0 || N_rr <= 0 || N_rl <= 0)
    fprintf ("OOPs!, The Car is rolling over @ These conditions")
    MiniReqMue =0;
    return 
end

k_bf = Constmatrix(3);
k_br = Constmatrix(4);
M_Rot = Constmatrix(18);
dec = Constmatrix(2);
Rr = Forcevec(1);
Fx_fr = (Fi + M_Rot * dec - Rr - Fa) * (k_bf/2);
Fx_fl = (Fi + M_Rot * dec - Rr - Fa) * (k_bf/2);
Fx_rr = (Fi + M_Rot * dec - Rr - Fa) * (k_br/2);
Fx_rl = (Fi + M_Rot * dec - Rr - Fa) * (k_br/2);


Fy_fr = Fl*(L2/L)*(N_fr/(N_fr + N_fl));
Fy_fl = Fl*(L2/L)*(N_fl/(N_fr + N_fl));
Fy_rr = Fl*(L1/L)*(N_rr/(N_rr + N_rl));
Fy_rl = Fl*(L1/L)*(N_rl/(N_rr + N_rl));

mue_fr =  (sqrt (Fx_fr^2 +Fy_fr^2)/N_fr);
mue_fl =  (sqrt (Fx_fl^2 +Fy_fl^2)/N_fl);
mue_rr =  (sqrt (Fx_rr^2 +Fy_rr^2)/N_rr);
mue_rl =  (sqrt (Fx_rl^2 +Fy_rl^2)/N_rl);

MiniReqMue = max ( [mue_fr, mue_fl, mue_rr, mue_rl] );
[mue_fr, mue_fl, mue_rr, mue_rl]
[N_fr, N_fl, N_rr, N_rl]

fprintf (" The Friction Demoned is %0.2f \n",  MiniReqMue );

end