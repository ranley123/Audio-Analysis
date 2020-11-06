% Question 2
[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

figure(1);
N = length(audio);
fft_audio = fft(audio);
f = (0:N-1) * audio_fs/N;
plot(f/1000, abs(fft_audio));
title('Audio in Frequency Domain');
xlabel('Frequency (kHz)');
ylabel('Amplitude');

figure(2);
N = length(music);
fft_music = fft(music);
f = (0:N-1) * music_fs/N;
plot(f/1000, abs(fft_music));
title('Music in Frequency Domain');
xlabel('Frequency (kHz)');
ylabel('Amplitude');
