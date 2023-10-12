clear all; clc;
% Define symbolic variables
syms z z1 p1 h;

% Define the symbolic transfer function D(z) with z instead of s
bz = z + z1;
az = z * (z + p1);

% Choose between strictly causal (true) and semi-causal (false)
is_strictly_causal = false;

% Perform matched z-transform for poles and finite zeros
z_transform = exp(h * z);
bz = poly2sym(subs(bz, z, z_transform));
az = poly2sym(subs(az, z, z_transform));

% Map infinite zeros to z = -1 or z = ∞ based on causality
if is_strictly_causal
    az = subs(az, z, inf);
else
    az = subs(az, z, -1);
end

% Prewarping to match the gain at the critical frequency (optional)
if exist('omega_bar', 'var')
    z_critical = exp(omega_bar * h);
    G_s_critical = subs(bz / az, z, z_critical);
    G_z_critical = subs(bz / az, z, z_critical);
    gain_correction = G_s_critical / G_z_critical;
    bz = bz * gain_correction;
end

% Display the resulting D(z) only
disp('D(z) Numerator (bz):');
disp(bz);
disp('D(z) Denominator (az):');
disp(az);

bz_numeric = vpa(bz);
az_numeric = vpa(az);

% Substitute specific values for z1 and p1
z1 = 1;
p1 = 10;

% Choose a time step
h = 0.01;

% bz = subs(bz, {z, z1, p1}, {1, 1, 10});
% az = subs(az, {z, z1, p1}, {1, 1, 10});

% Display the resulting D(z) only
% disp('D(z) Numerator (bz):');
% disp(bz);
% disp('D(z) Denominator (az):');
% disp(az);
% Now you have D(z) as numeric polynomials (being worked on)

% Use MatLab c2d
s = tf('s');

D_s2 = (s+z1)/(s*(s+p1));

D_z2 = c2d(D_s2, h, 'zoh');
disp(D_z2)

% DO NOT MATCH (probably did something wrong.....)
