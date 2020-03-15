function [y, time] = fft_radix2(signal, N)
  w = exp(-j*2*pi/N);
  w2 = exp(-j*2*pi/(N/2));
  
  if(N > length(signal))
    for i = [length(signal)+1:N]
      signal(i) = 0;
    endfor
  endif
  
  t = cputime;
  
  for k = [0:N-1]
    sum_p = sum_i = 0;
    for n = [0:(N/2)-1]
      sum_p += signal((2*n)+1)*w2^(n*k);
      sum_i += signal((2*n+1)+1)*w2^(n*k);
    endfor
    y(k+1) = sum_p + sum_i*w^k;
  endfor
  
  time = cputime-t;
endfunction
