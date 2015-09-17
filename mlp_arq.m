function [O] = mlp_arq(nmArquivoTr, nmArquivoVal, nTreinos, ni, topo)
%PERCEPTRON perceptron simples que retorna o erro de cada amostra em cada
%treino.
%   nmArquivo = nome/caminho do arquivo com a base de dados
%   numTreinos = Quatidade de treinamentos
%   ni = Valor de ajuste do Ni
%   topo = Topologia da rede
%   Retorno: Total de amostras e quantidade de amostras que aprenderam (inteligentes)

    nEntradas = topo(1);
    nSaidas = topo(end);
    nCamadas = numel(topo);

    amostras = leArq(nmArquivoTr, nEntradas);    
    amostras = normaliza(amostras);    
    nAmostras = size(amostras, 1);  
    amostras = amostras(randperm(nAmostras),:);
    amostras = [ones(nAmostras, 1) amostras];
    
    W = gera_pesos(topo, nCamadas, nSaidas);    

    for i = 1:nTreinos
        erro_epc = 0;
        qtdAcertos = 0;
        qtdErros = 0;
        for j = 1:nAmostras
            X = amostras(j, 1:nEntradas);
            y = amostras(j,nEntradas+1:end);
            [W, saida, erro] = mlp_treino(X, y, nSaidas, nCamadas, W, ni);
            erro_epc = erro_epc + erro;
            if (erro < 0.5);
                qtdAcertos = qtdAcertos + 1;
            else
                qtdErros = qtdErros + 1;
            end            
        end  
        fprintf('Ep: %d \t Ac: %d \t Er: %d \n',i, qtdAcertos, qtdErros);
    end
    
    amostras = leArq(nmArquivoVal, nEntradas);
    amostras = normaliza(amostras);    
    nAmostras = size(amostras, 1);  
    amostras = [ones(nAmostras, 1) amostras];
    
    for j = 1:nAmostras
        X = amostras(j, 1:nEntradas);        
        o(j,:) = mlp_val(X, nCamadas, W);
        y(j,1) = amostras(j,nEntradas+1:end);
    end  
    O = [o y];    
  
end