function [output] = allpassfilter(input,gain,delay)
%ALLPASSFILTER filtro passa-tudo
%input deve ser um vetor (1xN). gain e delay sao escalares.
%output eh um vetor
out = input;

%tmp = (delay+1):(size(out,2))
for j = 1 : (size(input,1));
%   disp(out(1,j));
%   fprintf("j:%d out: %s",j,out);
%   fflush(1);
   xval = 0; %segundo termo da equacao
   yval = 0; %terceiro termo
   if (j-delay) > 0
     xval = input(j-delay);
     yval = out(j-delay);
   endif

   out(j) = (input(j) * gain * (-1)) + xval + (gain * yval);
end

output = out;
end

