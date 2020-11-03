
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
[audio, audio_fs] = audioread('audio.wav');

N = length(audio);
fft_audio = fft(audio);
f = (0:N-1)*audio_fs/N;
figure(1);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);

n = 7;
beginFreq = 0.01;
endFreq = 0.2;
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, audio);
sound(fOut, audio_fs);

fft_audio = fft(fOut);
f = (0:N-1)*audio_fs/N;
figure(2);
plot(f, abs(fft_audio));
title('Audio in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
set(gca,'xticklabel',get(gca,'xtick')*1e-1);


% Fs = audio_fs;                       % Sampling Frequency (Hz)
% Fn = Fs/2;                              % Nyquist Frequency (Hz)
% Wp = 890/Fn;                           % Passband Frequency (Normalised)
% Ws = 910/Fn;                           % Stopband Frequency (Normalised)
% Rp =  100;                               % Passband Ripple (dB)
% Rs = 150;                               % Stopband Ripple (dB)
% [n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);         % Filter Order
% [z,p,k] = cheby2(n,Rs,Ws,'low');        % Filter Design
% [soslp,glp] = zp2sos(z,p,k);    % Convert To Second-Order-Section For Stability
% filtered1 = filtfilt(soslp, glp, noise1);

