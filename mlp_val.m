function [h] = mlp_val(X, nCamadas, W)
    H{1} = X;
    for k = 1:nCamadas-1
        u = H{k}*W{k};
        h = 1./(1+exp(-u));
        H{k+1} = [1 h];
    end
end