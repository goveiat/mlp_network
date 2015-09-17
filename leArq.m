function [amostras] = leArq(nmArquivo, nEntradas)
    ptrArquivo = fopen(nmArquivo, 'r');
    dados = fscanf(ptrArquivo, '%f', [nEntradas Inf]);
    fclose(ptrArquivo);
    amostras = dados'; 
end