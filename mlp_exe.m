[val]=mlp_arq('seeds_tr.txt', 'seeds_val.txt', 1500 , 0.3, [8 2 3]);
nAmostras = size(val, 1);
nCols = size(val, 2);
for j = 1:nCols-1
    fprintf('Classe %d \t',j);
end
fprintf('Esperado\n');
contAcertos = 0;
contErros = 0;
for i = 1:nAmostras
    index = val(i, end);
    [~, indMax] = max(val(i, 1:end-1));
    if index == indMax
        msg = 'acertou';
        contAcertos = contAcertos +1;
    else
        msg = 'errou';
        contErros = contErros +1;
    end    
    fprintf('%f \t',val(i, :));
    fprintf('%s \n',msg);
end
fprintf('\n');
fprintf('ACERTOS: %d\tERROS:%d\n', contAcertos, contErros);