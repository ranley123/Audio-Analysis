for i = 1:3
    bound = [1500, 100, 2000];
    filename = strcat('audio_in_noise', int2str(i),'.wav');
    
    [noise, noise_fs] = audioread(filename);
    
    noise_left = noise(:, 1);
    noise_right = noise(:, 2);
    
    N = length(noise);
    fft_noise = fft(noise);
    fft_noise_left = abs(fft(noise_left));
    fft_noise_right = fft(noise_right);
    f = (0:N-1)*noise_fs/N;

    figure(2*(i - 1) + 1);
    plot(f, abs(fft_noise));
    title('Frequency Domain Before Filtering');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');

    Fn = noise_fs/2;
    [b,a] = butter(8, (bound(i)/Fn), 'high');
    fOut = filter(b, a, noise);
%     sound(fOut,noise_fs);

    fft_noise = fft(fOut);
    figure(2*(i - 1) + 2);
    plot(f, abs(fft_noise));
    title('Audio in Frequency Domain After Filtering');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    
    audiowrite(strcat("noise_removed", int2str(i), ".wav"), fOut, noise_fs);
end