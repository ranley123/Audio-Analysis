% Question 1
fs = 10000; % sampling frequency
time = 1:(1/fs):11; % time signal -> startValue:stepSize:EndValue
freq = 261.6; % middle C frequency in Hz
middleC = sin(2*pi*freq*time); % create sine wave
sound(middleC, fs); % create audio player object
% plot in time domain
title('Time Domain');
xlabel('Time');
ylabel('Magnitude');
plot(time, middleC);


% plot in frequency domain
fft_middleC = fft(middleC);
fft_middleC = fftshift(fft_middleC); % range from [0, fs] to [-2/fs, 2/fs]
f = fs/2*linspace(-1,1,fs);
% plot(abs(fft_middleC));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');