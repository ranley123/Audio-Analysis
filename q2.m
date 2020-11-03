% Question 2
[audio, audio_fs] = audioread('audio.wav');
% [music, music_fs] = audioread('audio_in_noise2.wav');

% plot audio in time
audio_length = length(audio);
audio_time = (0 : audio_length - 1)/audio_fs;
plot(audio_time, audio);
xlabel('Time (seconds)');
ylabel('Audio Amplitude');

% % plot music in time
% music_length = length(music);
% music_time = (0 : music_length - 1)/music_fs;
% plot(music_time, music);
% xlabel('Time');
% ylabel('Music Amplitude');