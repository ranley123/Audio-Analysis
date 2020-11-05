% Question 2
[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

% plot audio in time
figure(1);
audio_length = length(audio);
audio_time = (0 : audio_length - 1)/audio_fs;
plot(audio_time, audio);
xlabel('Time (seconds)');
ylabel('Audio Amplitude');

figure(2);
% plot music in time
music_length = length(music);
music_time = (0 : music_length - 1)/music_fs;
plot(music_time, music);
xlabel('Time (seconds)');
ylabel('Amplitude');