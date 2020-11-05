[audio, audio_fs] = audioread('audio.wav');
[music, music_fs] = audioread('music.wav');

N = length(audio);
fft_audio = fft(audio);
f = (0:N-1)*audio_fs/N;
figure(1);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);
% sound(audio, audio_fs);

n = 7;
beginFreq = 0.01;
endFreq = 0.2;
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, audio);
% sound(fOut, audio_fs);

fft_audio = fft(fOut);
figure(2);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);


N = length(music);
fft_music = fft(music);
f = (0:N-1)*music_fs/N;
figure(3);
plot(f, abs(fft_music));
title('Music in Frequency Domain Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

n = 7;
beginFreq = 0.01;
endFreq = 0.2;
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, music);
sound(fOut, music_fs);

fft_music = fft(fOut);
f = (0:N-1)*music_fs/N;
figure(4);
plot(f, abs(fft_music));
title('Music in Frequency Domain After Filtering');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

