[noise1, noise1_fs] = audioread('audio_in_noise1.wav');
[noise2, noise2_fs] = audioread('audio_in_noise2.wav');
[noise3, noise3_fs] = audioread('audio_in_noise3.wav');
                      % Sampling Frequency (Hz)
Fn = noise1_fs/2;                              % Nyquist Frequency (Hz)
beginFreq = 890/Fn;                           % Passband Frequency (Normalised)
endFreq = 910/Fn;                           
[b,a] = butter(7, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, noise1);
sound(fOut,noise1_fs);