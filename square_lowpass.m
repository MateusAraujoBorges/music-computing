function [output] = square_lowpass(interval,nPeriods)
%SQUARE_LOWPASS gera um sinal com formato quadrado e passa ele no filtro passa-baixa
%interval - numero de amostras em um periodo da onda
%nPeriods - numero de periodos do sinal
%output - Vetor Nx1 contendo a onda square apos a aplicacao do filtro passa-baixa
%
% exemplo: square_lowpass(20,100)

vecH = ones(1,interval);
vecL = zeros(1,interval);
wave = [];

for i = 1 : nPeriods
  wave = [wave vecH vecL];
end

wave = wave';

output = lowpassfilter(wave);
end




