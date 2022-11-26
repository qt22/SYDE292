vout  = [18.8 37.2 66 89.6 120 168 222 326 524 1080 1600 160 56 44.8 21.8];
freq_vec = (100:100:1000);
freq_vec(11) = 1060;
freq_vec(12) = 2000;
freq_vec(13) = 4000;
freq_vec(14) = 5000;
freq_vec(15) = 10e3;

gain_dB = 20*log10(vout/2000);

%Biquad
R = 10e3 ;
Rg = 1e6;
Rd = 1e6;
C = 15e-9;
Vout=@(f) (-(1/(Rg*C))*(j*2*pi*f))./((j*2*pi*f).^2+(j*2*pi*f)*(1/(Rd*C))+1/(R*C)^2);
freq_vec2 = [100,200,500,700,800,900,1000,1060,1100,1200,1300,1700,2000,4000,10000];
Vout_ratio = Vout(freq_vec2);
Gain_dB = 20*log10(abs(Vout_ratio));
Vout_phase = angle(Vout_ratio)*180/pi;

figure(22);
semilogx(freq_vec, gain_dB);
xlabel('Freuqency of the input signal in Hz');
ylabel('Gain in dB');
title('Gain vs Frequency of the input signal [use log scale]');
grid on;
hold on;
semilogx(freq_vec2, Gain_dB);
xlabel('Frequency in logscale (Hz)');
ylabel('Gain (dB)');
xticks([100,200,400,1000,2000,4000,10000]);
title('MFBF and biquad bandpass filter');
grid on;
hold off;

legend('MFBF', 'Biquad')