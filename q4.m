[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

% plot audio in time domain
figure(1);
plot(audio);
title('Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude');

% plot audio in frequency domain
N = length(audio);
fft_audio = fft(audio);
f = (0:N-1)*audio_fs/N;
figure(2);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% filter audio
n = 7;
[b,a] = butter(n, 1102.5/(audio_fs/2), 'low');
fOut = filter(b, a, audio);
% sound(fOut, audio_fs);

% plot filtered audio in frequency domain
fft_audio = fft(fOut);
figure(3);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% plot filtered audio in time domain
figure(4);
plot(ifft(fft_audio));
title('Time Domain After Filtering');
xlabel('Time (seconds)');
ylabel('Amplitude');

% plot audio in frequency domain
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
sound(fOut, music_fs);

% plot music in frequency domain after filtering
fft_music = fft(fOut);
f = (0:N-1)*music_fs/N;
figure(6);
plot(f, abs(fft_music));
title('Music in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% plot music in time domain
figure(7);
plot(music);

% plot music in time domain after filtering
figure(8);
plot(ifft(fft_music));

