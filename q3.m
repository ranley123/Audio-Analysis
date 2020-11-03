% Question 2
[audio, audio_fs] = audioread('audio.wav');
% [music, music_fs] = audioread('audio_in_noise2.wav');

N = length(audio);
fft_audio = fft(audio);
f = (0:N-1)*audio_fs/N;
plot(f, abs(fft_audio));
title('Audio in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

% % plot music in time
% music_length = length(music);
% music_time = (0 : music_length - 1)/music_fs;
% plot(music_time, music);
% xlabel('Time');
% ylabel('Music Amplitude');