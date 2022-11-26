format short 
format compact

% Passive filters
r1 = 31.4;
L1 = 1e-3;

freq_vec = 1e3:1:1e5;
w = freq_vec * 2 * pi;
wc = r1/L1;

gain = 20*log10(wc ./ (j*w + wc));

figure(1); 
semilogx(freq_vec, gain);
text(5e3, -3, "\leftarrow cut off frequency");
xlabel('frequency (Hz)');
ylabel('gain (dB)');
title('Bode Plot of an RL low pass filter')