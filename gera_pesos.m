function [W] = gera_pesos(topo, nCamadas, nSaidas)
    for i = 1:nCamadas-2
        ant = topo(i);
        pos = topo(i+1) -1;
        W{i} = -0.3 + (0.6)*rand(ant,pos);
    end
    W{i+1} = -0.3 + (0.6)*rand(pos+1,nSaidas);
end