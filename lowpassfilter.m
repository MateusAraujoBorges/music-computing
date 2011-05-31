function [output] = lowpassfilter(input)
%LOWPASSFILTER filtro passa-baixa (pag. 403 do Roads)
%input deve ser um vetor (Nx1)
%output eh um vetor (Nx1)

  tmp = [0; input]; % adicionei um zero para facilitar o calculo de y[1]
  out = tmp;

  pp = size(tmp,1)
  for i = 2 : (size(tmp,1)); %itere por todos os elementos do vetor de entrada
    a = tmp(i);
    b = tmp(i-1);
    out(i) = (a / 2) + (b / 2);
%    fprintf("out(%d):%d",i,out(i));
%    fflush(1);
  end

  output = out;
end

