% Question 1
fs = 10000; % sampling frequency
time = 1:(1/fs):11; % time signal -> startValue:stepSize:EndValue
freq = 261.6; % middle C frequency in Hz
middleC = sin(2*pi*freq*time); % create sine wave
% sound(middleC, fs); % create audio player object
% plot in time domain
figure(1);
title('Time Domain');
xlabel('Time');
ylabel('Amplitude');
plot(time, middleC);

figure(2);
% plot in frequency domain
N = length(middleC);
fft_middleC = fft(middleC);
f = (0:N-1) * fs/N;
plot(f, abs(fft_middleC));
title('Middle C in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');