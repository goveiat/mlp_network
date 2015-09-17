function [amostrasNorm] = normaliza(amostras)
    entradas = amostras(:, 1:end-1);
    saidas = amostras(:, end);         
    M = max(entradas,[],1);
    m = min(entradas,[],1);
    den = M - m;
    nums = bsxfun(@minus, entradas, m);
    entradasNorm = bsxfun(@rdivide, nums, den);    
    amostrasNorm = [entradasNorm saidas];
end