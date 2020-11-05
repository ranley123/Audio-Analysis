% Question 2
[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

figure(1);
N = length(audio);
fft_audio = fft(audio);
f = (0:N-1) * audio_fs/N;
plot(f, abs(fft_audio));
title('Audio in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

figure(2);
N = length(music);
fft_music = fft(music);
f = (0:N-1) * music_fs/N;
plot(f, abs(fft_music));
title('Audio in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);
