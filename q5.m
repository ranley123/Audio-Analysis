[noise1, noise1_fs] = audioread('audio_in_noise1.wav');
[noise2, noise2_fs] = audioread('audio_in_noise2.wav');
[noise3, noise3_fs] = audioread('audio_in_noise3.wav');

N = length(noise1);
noise1_left = noise1(:, 1);
noise1_right = noise1(:, 2);
fft_noise1 = fft(noise1);
fft_noise1_left = fft(noise1_left);
fft_noise1_right = fft(noise1_right);
f = (0:N-1)*noise1_fs/N;

figure(1);
plot(f, abs(fft_noise1));

title('Noise 1 in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

N2 = length(noise2);
noise2_left = noise2(:, 1);
noise2_right = noise2(:, 2);
fft_noise2 = fft(noise2);
f = (0:N2-1)*noise2_fs/N2;
figure(2);
plot(f, abs(fft_noise2));
title('Noise 2 in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

N3 = length(noise3);
noise3_left = noise3(:, 1);
noise3_right = noise3(:, 2);
fft_noise3 = fft(noise3);
f = (0:N-1)*noise3_fs/3;
figure(3);
plot(f, abs(fft_noise3));
title('Noise 3 in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-6);

