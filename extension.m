
[noise, noise_fs] = audioread("audio_in_noise3.wav");

%     get left channel and right channel
noise_left = noise(:, 1);
noise_right = noise(:, 2);

%     get spectrum
N = length(noise);
fft_noise = fft(noise);
fft_noise_left = abs(fft(noise_left));
fft_noise_right = fft(noise_right);
f = (0:N-1)*noise_fs/N;

%     plot frequency domain before filtering
figure(1);
plot(f, abs(fft_noise));
title('Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

%     construct filters
Fn = noise_fs/2;
[b,a] = cheby1(8,5,1300/Fn,'high');
% [b,a] = besself(8, 1300/Fn, 'high');
fOut = filter(b, a, noise);
% sound(fOut, noise_fs);

%   get filtered audio's spectrum and plot
fft_noise = fft(fOut);
figure(2);
plot(f, abs(fft_noise));
title('Audio in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure(3);
plot(noise);
title('Time Domain Before Filtering');
xlabel('Time (seconds)');
ylabel('Amplitude');

figure(4);
plot(fOut);
title('Time Domain After Filtering');
xlabel('Time (seconds)');
ylabel('Amplitude');
