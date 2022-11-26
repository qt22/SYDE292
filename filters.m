format short 
format compact

% % Passive filters - low pass
% r1 = 21.48;
% L1 = 1e-3;
% 
% freq_vec = 1e2:1:1e6;
% w = freq_vec * 2 * pi;
% wc = r1/L1;
% 
% gain = 20*log10(wc ./ (j*w + wc));
% 
% figure(1); 
% semilogx(freq_vec, gain);
% text(wc/(2*pi), -3, "\leftarrow cut off frequency");
% xlabel('frequency (Hz)');
% ylabel('gain (dB)');
% title('Bode Plot of an RL low pass filter')

% % Passive filters - band pass
% r1 = 5e3;
% L1 = 50e-3;
% c1 = 50e-9;
% 
% freq_vec = 1e2:1:1e6;
% w = freq_vec * 2 * pi;
% wc = 20e3;
% 
% gain = 20*log10( j*w*L1 ./ (r1*(1-w.*w*L1*c1) + j*w*L1));
% 
% figure(1); 
% semilogx(freq_vec, gain);
% text(wc/(2*pi), 0, "\leftarrow center frequency");
% xlabel('frequency (Hz)');
% ylabel('gain (dB)');
% ylim([-100 10])
% title('Bode Plot of an RLC band pass filter')

% Passive filters - high order pass

r1 = 2.47e3;
r2 = 2.47e3;
c1 = 0.033e-6;

freq_vec = 1e2:1:1e6;
w = freq_vec * 2 * pi;
w0 = 1990*pi;

gain = 20*log10(((-r2/r1) ./(1+j*w*r2*c1)).^3);

figure(1); 
semilogx(freq_vec, gain);
text(w0/(2*pi), -3, "\leftarrow center frequency");
xlabel('frequency (Hz)');
ylabel('gain (dB)');
ylim([-100 10])
title('Bode Plot of an RLC band pass filter')