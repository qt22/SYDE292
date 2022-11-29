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

% % Passive filters - band pass (A5Q4)
% r1 = 8200;
% L1 = 10e-3;
% c1 = 10e-9;
% 
% freq_vec = 1e2:1:1e6;
% w = freq_vec * 2 * pi;
% wc = 1e5;
% 
% gain = 20*log10( j*w*L1 ./ (r1*(1-w.*w*L1*c1) + j*w*L1));
% 
% figure(1); 
% grid on
% semilogx(freq_vec, gain);
% text(wc/(2*pi), 0, "\leftarrow center frequency");
% xlabel('Frequency (Hz)');
% ylabel('Gain (dB)');
% ylim([-50 10])
% title('Bode Plot of a parallel band-pass filter')

% Active filters - high order low pass filter (A5Q5)

r1 = 2.325e3;
r2 = 2.325e3;
c1 = 22e-9;

freq_vec = 1e-1:0.1:1e4;
w = freq_vec * 2 * pi;
w0 = 2400*pi;

gain = 20*log10(((-r2/r1) ./(1+j*w*r2*c1)).^5);

figure(1); 
semilogx(freq_vec, gain);
text(w0/(2*pi), -3, "\leftarrow cutoff frequency");
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
ylim([-30 1])
title('Bode Plot of a 5th order active low pass filter')

% % Active filters - bandpass
% 
% rl = 20e3;
% rh = 20e3;
% c1 = 798e-12;
% c2 = 80e-9;
% rf = 9.9e3;
% ri = 1e3;
% 
% freq_vec = 1:1:1e6;
% w = freq_vec * 2 * pi;
% w0 = 6283.2;
% 
% gain = 20*log10((-rf/ri) .* (1./(1+j*w*rl*c1)) .* (j*w*c2*rh ./(1 + j*w*c2*rh)) );
% 
% figure(1); 
% semilogx(freq_vec, gain);
% text(w0/(2*pi), 20, "\leftarrow center frequency");
% xlabel('frequency (Hz)');
% ylabel('gain (dB)');
% ylim([-30 30])
% title('Bode Plot of an active band pass filter')

% % Assignment 5 question 1 - RLC low pass filter
% 
% rl = 0.25;
% c1 = 1;
% l1 = 1;
% 
% freq_vec = 1e-2:0.01:1e2;
% w = freq_vec * 2 * pi;
% w0 = 1;
% 
% gain = 20*log10( 0.25 ./ (0.25 - 0.25*w.^2 + j*w) );
% 
% figure(1); 
% semilogx(freq_vec, gain);
% % text(w0/(2*pi), -3, "\leftarrow center frequency");
% xlabel('Frequency (Hz)');
% ylabel('Gain (dB)');
% % ylim([0 -100])
% title('Bode Plot of an RLC low pass filter')