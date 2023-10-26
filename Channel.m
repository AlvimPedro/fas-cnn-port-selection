function [g_k] = Channel(N, W, sigma)

% Independent Gaussian Random Variables with zero mean and variance of 1/2
x_k = sqrt(0.5) * randn(1,N);
y_k = sqrt(0.5) * randn(1,N);

% Correlation Model
mu = sqrt(2)*sqrt(hypergeom(0.5, [1 1/3], -1*pi^2 * W^2) - besselj(1, 2*pi*W)/(2*pi*W));

% Real and Imaginary parts
real = sigma*sqrt(1-mu^2).*x_k + mu*x_k(1);
imag = sigma*sqrt(1-mu^2).*y_k + mu*y_k(1);

% Module of g_k

g_k = sqrt(real.^2 + imag.^2);

% To dB
g_k = pow2db(g_k);
% ports = linspace(1,N,N);

end
% % Interpolação para visual
% x_interp = linspace(1,N, 1000);
% y_interp = interp1(ports,g_k,x_interp,'spline');

% figure
% % plot(ports, g_k, '-b')
% plot(x_interp, y_interp)

