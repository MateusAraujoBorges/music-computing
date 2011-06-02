function [outputFileName] = reverbEcho(inputFileName,delayVect,attVect)
%REVERB_ECHO algoritmo de reverberaçao que utiliza uma serie de filtros passa-tudo.
%Atencao - funciona apenas em arquivos que tenham apenas um canal de audio!
%inputFileName - arquivo que sera lido (no formato wav)
%delayVect - 1xN com o tempo do delay de cada filtro (em numero de amostras)
%attVect - Fator de atenuacao de cada filtro (valor entre 0 e 1; deve ser do mesmo tamanho de delayVect)

  if(length(delayVect) != length(attVect))
    error ("vetores de delay e atenuacao devem ter o mesmo tamanho");
  end

  [vs,freq,bitrate] = wavread(inputFileName);

  if(size(vs,2) > 1)
    error ("apenas arquivos com um unico canal de audio sao suportados");
  end;

  revs = vs;

  for i = 1:size(delayVect,2)
    revs = allpassfilter(revs,attVect(i),delayVect(i));
  end;

  wavwrite(revs,freq,bitrate,"out.wav");

outputFileName = "out.wav";
end;

