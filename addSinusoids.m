function output = addSinusoids(sinVector, sinAmps, sampleRate, numBits)
% ADDSINUSOIDS - gera um arquivo wav a partir da soma das sinusoides especificadas
% sinVector - Matriz NxM onde cada coluna é uma conjunto de valores associados à uma senóide
% sinAmps - Vetor 1xM (tamanho igual ao numero de colunas de sinVector) contendo as amplitudes de cada onda
% sampleRate, numBits - parametros para a funcao wavwrite
%
% output = nome do arquivo wav gerado
%
% ex. de entrada: 
%
% s1 = 0:pi/2:1000*pi; s1 = sin(s1); s1 = s1'
% s2 = 0:pi/4:500*pi; s2 = sin(s2); s2 = s2'
% s3 = 0:pi/8:250*pi; s3 = sin(s3); s1 = s3'
%
% filename = addSinusoids([s1 s2 s3],[1 3,7],8000,16)


if(size(sinVector,2) != size(sinAmps,2))
  error("numero de valores de amplitude deve ser igual ao numero de senoides");
end;

wave = zeros(size(sinVector,1),1);

for i = 1:size(sinVector,2)
  wave = wave + (sinVector(:,i).*sinAmps(i));
end  

wavwrite(wave,sampleRate,numBits,"out.wav");
output = "out.wav";



