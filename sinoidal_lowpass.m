function [output] = sinoidal_lowpass(intervalVec)
%SINOIDAL_LOWPASS gera uma senoide a partir do vetor de entrada e passa o filtro low-pass
%intervalVec Vetor 1xN com o intervalo da senoide a ser criada (ex: 0:1000)
%output Vetor Nx1 com a senoide passada pelo filtro low-pass
%
% exemplo: sinoidal_lowpass(0:pi/4:30*pi)

  senoid = sin(intervalVec);
  transverse = senoid';
  lp_senoid = lowpassfilter(transverse);
  output = lp_senoid;

end
