RP = 6378.0;  % km
MU = 3.986e5;  % km^3/s^2
tf = 5615.;  % s

inertia = [0.035, 0., 0.; 0., 0.02, 0.; 0., 0., 0.05];
a = sum(double('BSPI')) - 4 * double('A') + 4;
b = sum(double('BMRS')) - 4 * double('A') + 4;
h = 400. + b;  % km
month = mod(a, 10); % mes
inc = a; % deg
raan = b; % deg

n = sqrt(MU / (RP + h) ^ 3);  % rad/s

r_raan = [cosd(raan), sind(raan), 0e0; -sind(raan), cosd(raan), 0e0; 0e0, 0e0, 1e0];
r_incc = [1e0, 0e0, 0e0; 0e0, cosd(raan), sind(raan); 0e0, -sind(raan), cosd(raan)];
r_ob = [0e0, 0e0, -1e0; 0e0, 1e0, 0e0; 1e0, 0e0, 0e0];

c_bi = r_ob * r_incc * r_raan;

omega_b = -[n; 0e0; 0e0];  % rad/s
omega_i = c_bi' * omega_b;  % rad/s
omega0 = omega_i;  % rad/s
omega_d = omega_i;  % rad/s

q0 = zeros(4, 1);
phi = acos(5e-1 * (trace(c_bi) - 1e0));
s_p = sin(phi);
c_p = cos(phi);
q0(1) = (c_bi(2,3) - c_bi(3,2)) / (2e0 * s_p);
q0(2) = (c_bi(3,1) - c_bi(1,3)) / (2e0 * s_p);
q0(3) = (c_bi(1,2) - c_bi(2,1)) / (2e0 * s_p);
q0(4) = cos(phi/2e0);
