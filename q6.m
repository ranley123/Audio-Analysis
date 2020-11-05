[noise1, noise1_fs] = audioread('audio_in_noise1.wav');
[noise2, noise2_fs] = audioread('audio_in_noise2.wav');
[noise3, noise3_fs] = audioread('audio_in_noise3.wav');
                      % Sampling Frequency (Hz)
Fn = noise1_fs/2;                              % Nyquist Frequency (Hz)
beginFreq = 0.12;                           % Passband Frequency (Normalised)
endFreq = 0.99;                           
[b,a] = butter(7, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, noise1);
sound(fOut,noise1_fs);

% Fn = noise2_fs/2;                              % Nyquist Frequency (Hz)
% beginFreq = 0.01;                           % Passband Frequency (Normalised)
% endFreq = 0.99;                           
% [b,a] = butter(7, [beginFreq, endFreq], 'bandpass');
% fOut = filter(b, a, noise2);
% sound(fOut,noise2_fs);
% 
% Fn = noise3_fs/2;                              % Nyquist Frequency (Hz)
% beginFreq = 0.1;                           % Passband Frequency (Normalised)
% endFreq = 0.99;                           
% [b,a] = butter(7, [beginFreq, endFreq], 'bandpass');
% fOut = filter(b, a, noise3);
% sound(fOut,noise3_fs);