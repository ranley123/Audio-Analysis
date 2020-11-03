



% Question 3

% Question 5: human speech hz [300, 3000]
% [noise1, noise1_fs] = audioread('audio_in_noise1.wav');
% [noise2, noise2_fs] = audioread('audio_in_noise2.wav');
% [noise3, noise3_fs] = audioread('audio_in_noise3.wav');

% 
% Fs = noise1_fs;                       % Sampling Frequency (Hz)
% Fn = Fs/2;                              % Nyquist Frequency (Hz)
% Wp = 890/Fn;                           % Passband Frequency (Normalised)
% Ws = 910/Fn;                           % Stopband Frequency (Normalised)
% Rp =  100;                               % Passband Ripple (dB)
% Rs = 150;                               % Stopband Ripple (dB)
% [n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);         % Filter Order
% [z,p,k] = cheby2(n,Rs,Ws,'low');        % Filter Design
% [soslp,glp] = zp2sos(z,p,k);    % Convert To Second-Order-Section For Stability
% filtered1 = filtfilt(soslp, glp, noise1);

% n = 7;
% beginFreq = 6000 / (noise1_fs/2);
% endFreq = 0.99;
% [b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
% fOut = filter(b, a, noise1);
% 
% % plot in frequency domain
% fft_noise1 = fft(fOut);
% fft_noise1 = fftshift(fft_noise1); % range from [0, fs] to [-2/fs, 2/fs]
% f = noise1_fs/2*linspace(-1,1,noise1_fs);
% plot(abs(fft_noise1));
% % title('magnitude FFT of sine');
% % xlabel('Frequency (Hz)');
% % ylabel('magnitude');
% 
% sound(fOut, noise1_fs);

