function [output] = sawtooth_lowpass(t,width)
%SAWTOOTH_LOWPASS gera um sinal com formato dente-de-serra e passa ele no filtro passa-baixa
%t - Vetor 1xN com a serie temporal utilizada como base pro sinal (ex: 0:1000)
%width - Tamanho do periodo. Use 0.5 para gerar uma onda triangular! (default: 1)
%output - Vetor Nx1 contendo a onda sawtooth apos a aplicacao do filtro passa-baixa

  if (nargin == 1) %usa 1 como periodo
    width = 1;
  else
    if (width < 0 || width > 1 || ! isreal (width))
      error ("width deve ser entre 0 e 1");
    end
  end

  t = mod (t / (2 * pi), 1);
  saw = zeros (size (t));

  if (width != 0)
    saw (t < width) = 2 * t (t < width) / width - 1;
  end;

  if (width != 1)
    saw (t >= width) = -2 * (t (t >= width) - width) / (1 - width) + 1;
  end;

  %sinal sawtooth ok, vamos aplicar o filtro
  saw = saw';
  output = lowpassfilter(saw);
end;
