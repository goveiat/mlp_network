function [W, h, erro] = mlp_treino(X, y, nSaidas, nCamadas, W, ni)
    H{1} = X;
    Y = zeros(1,nSaidas);
    Y(y) = 1;
    for k = 1:nCamadas-1
        u = H{k}*W{k};
        h = 1./(1+exp(-u));
        H{k+1} = [1 h];
    end
    erro = abs(Y - h);
    dW{k} = h.*(1 - h).*(Y - h);
    W{k} = W{k} + ni.*(H{k}'*dW{k});
    for k = nCamadas-2:-1:1
        dW{k} = H{k+1}.*(1 - H{k+1}).*(dW{k+1}*W{k+1}');
        dW{k}(1) = [];
        W{k} = W{k} + ni*(H{k}'*dW{k});                
    end
end