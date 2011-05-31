function [output] = triangle_lowpass(input)
%TRIANGLE_LOWPASS gera um sinal com formato triangular e passa ele no filtro passa-baixa
%t - Vetor 1xN com a serie temporal utilizada como base pro sinal (ex: 0:1000)
%output - Vetor Nx1 contendo a onda triangular apos a aplicacao do filtro passa-baixa

  output = sawtooth_lowpass(input,0.5);

end;
