function [y, time] = fft_dec_freq(signal, N)
  w = exp(-j*2*pi/N);
  
  if(N > length(signal))
    for i = [length(signal)+1:N]
      signal(i) = 0;
    endfor
  endif
  
  t = cputime;
  
  for k = [0:N-1]
    sum = 0;
    for n = [0:(N/2)-1]
      sum += (signal(n+1) + signal((n+1)+(N/2))*w^(N*k/2))*w^(n*k);
    endfor
    y(k+1) = sum;
  endfor
  
  time = cputime-t;
endfunction
