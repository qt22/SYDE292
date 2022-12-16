format short 
format compact

% Active filters - high order low pass filter 

r1 = 3.38e3;
r2 = 3.38e3;
c1 = 15e-9;

freq_vec = logspace(-1, 4);
w = freq_vec * 2 * pi;
w0 = 1600*2*pi;

gain = 20*log10(((-r2/r1) ./(1+j*w*r2*c1)).^3);

figure(1); 
semilogx(freq_vec, gain);
text(w0/(2*pi), -3, "\leftarrow cutoff frequency");
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
ylim([-40 1])
title('Bode Plot of a 3rd order active low pass filter')

% Active filters - bandpass

rl = 114;
rh = 1592;
c1 = 0.1e-6;
c2 = 0.1e-6;
rf = 1e3;
ri = 1e3;

freq_vec = logspace(1, 6);
w = freq_vec * 2 * pi;
w0 = 23509.53;

gain = 20*log10((-rf/ri) .* (1./(1+j*w*rl*c1)) .* (j*w*c2*rh ./(1 + j*w*c2*rh)) );

figure(2); 
semilogx(freq_vec, gain);
text(w0/(2*pi), 0, "\leftarrow center frequency");
xlabel('frequency (Hz)');
ylabel('gain (dB)');
ylim([-50 10])
title('Bode Plot of an active band pass filter')