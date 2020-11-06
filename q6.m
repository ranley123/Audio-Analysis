for i = 1:3
    cutoff = [2000, 200, 2200];
    
%     read audio
    filename = strcat('audio_in_noise', int2str(i),'.wav');
    [noise, noise_fs] = audioread(filename);
    
%     get left channel and right channel
    noise_left = noise(:, 1);
    noise_right = noise(:, 2);
    
%     get spectrum
    N = length(noise);
    fft_noise = fft(noise);
    fft_noise_left = abs(fft(noise_left));
    fft_noise_right = fft(noise_right);
    f = (0:N-1)*noise_fs/N;
    
%     plot frequency domain before filtering
    figure(4*(i - 1) + 1);
    plot(f, abs(fft_noise));
    title('Frequency Domain Before Filtering');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');

%     construct butterworth high-pass filters
    Fn = noise_fs/2;
    [b,a] = butter(8, (cutoff(i)/Fn), 'high');
    fOut = filter(b, a, noise);
%     sound(fOut,noise_fs);

%   get filtered audio's spectrum and plot
    fft_noise = fft(fOut);
    figure(4*(i - 1) + 2);
    plot(f, abs(fft_noise));
    title('Audio in Frequency Domain After Filtering');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    
    figure(4 * (i - 1) + 3);
    plot(noise);
    title('Time Domain Before Filtering');
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    
    figure(4 * (i - 1) + 4);
    plot(fOut);
    title('Time Domain After Filtering');
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    
%     save filtered audio into a new file
    audiowrite(strcat("noise_removed", int2str(i), ".wav"), fOut, noise_fs);
end