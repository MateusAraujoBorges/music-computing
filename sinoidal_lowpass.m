% gerando uma senoide

%s_interval = 0:pi/100:2*pi;
%senoid = sin(s_interval);

function [output] = sinoidal_lowpass(intervalVec)
%SINOIDAL_LOWPASS gera uma senoide a partir do vetor de entrada e passa o filtro low-pass
%intervalVec Vetor 1xN com o intervalo da senoide a ser criada (ex: 0:1000)
%output Vetor Nx1 com a senoide passada pelo filtro low-pass

  senoid = sin(intervalVec);
  transverse = senoid';
  lp_senoid = lowpassfilter(transverse);
  output = lp_senoid;

end
