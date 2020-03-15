function [y, time] = my_dft(signal, N)
  w = exp(-j*2*pi/N);
  
  if(N > length(signal))
    for i = [length(signal)+1:N]
      signal(i) = 0;
    endfor
  endif
  
  t = cputime;
  
  for k = [0:N-1]
    sum = 0;
    for n = [0:N-1]
      sum += signal(n+1)*w^(n*k); 
    endfor
    y(k+1) = sum;
  endfor
  
  time = cputime-t;
endfunction
