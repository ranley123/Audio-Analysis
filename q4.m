[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

figure(1);
plot(audio);
title('Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude');

N = length(audio);
fft_audio = fft(audio);
f = (0:N-1)*audio_fs/N;
figure(2);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
% sound(audio, audio_fs);

n = 7;
[b,a] = butter(n, 1102.5/(audio_fs/2), 'low');
fOut = filter(b, a, audio);
% sound(fOut, audio_fs);

fft_audio = fft(fOut);
figure(3);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure(4);
plot(ifft(fft_audio));
title('Time Domain After Filtering');
xlabel('Time (seconds)');
ylabel('Amplitude');

N = length(music);
fft_music = fft(music);
f = (0:N-1)*music_fs/N;
figure(5);
plot(f, abs(fft_music));
title('Music in Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

n = 7;
[b,a] = butter(n, 500/(music_fs/2), 'low');
fOut = filter(b, a, music);
% sound(fOut, music_fs);

fft_music = fft(fOut);
f = (0:N-1)*music_fs/N;
figure(6);
plot(f, abs(fft_music));
title('Music in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure(7);
plot(music);

figure(8);
plot(ifft(fft_music));

