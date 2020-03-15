f_sampling = 500;
t_sampling = 1/f_sampling;

f_signal_1 = 60;
f_signal_2 = 200;

n_amostras = 32;

t = [0:t_sampling:(n_amostras-1)*t_sampling];
y_signal = sin(2*pi*f_signal_1*t) + sin(2*pi*f_signal_2*t);

subplot(511);
plot(t, y_signal);
title('Sinal amostrado');

N = 256;

x = f_sampling*(0:N-1)/N;
t = cputime;
y_fft = fft(y_signal, N);
time = cputime-t;

subplot(512);
plot(x(1:N/2), abs(y_fft(1:N/2)));
title(sprintf('FFT Octave (%d amostras) - %ds', N, time));

[y_my_dft, time] = my_dft(y_signal, N);
subplot(513);
plot(x(1:N/2), abs(y_my_dft(1:N/2)));
title(sprintf('DFT (%d amostras) - %ds', N, time));

[y_fft_radix2, time] = fft_radix2(y_signal, N);
subplot(514);
plot(x(1:N/2), abs(y_fft_radix2(1:N/2)));
title(sprintf('FFT Raíz 2 Decimação no Tempo (%d amostras) - %ds', N, time));

[y_fft_dec_freq, time] = fft_dec_freq(y_signal, N);
subplot(515);
plot(x(1:N/2), abs(y_fft_dec_freq(1:N/2)));
title(sprintf('FFT Decimação na Frequência (%d amostras) - %ds', N, time));