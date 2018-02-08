function map = SOM_Create (N , dim , learning_rate , neighborhood_spread , size_pattern)


map = [];
map.n_dims = dim;
map.n_nodesPerDim = N;
map.n_nodes = N^dim;
map.learning_rate_i = learning_rate(1);
map.learning_rate_f = learning_rate(2);
map.neigborhood_spread_i = neighborhood_spread(1);
map.neigborhood_spread_f = neighborhood_spread(2);
map.weights = rand(N^dim, size_pattern);
map.topology = zeros(N^dim, dim);

if dim == 1
    for i = 1:N^dim
        map.topology(i) = i ;
    end
else if dim == 2
        compteur = 1;
        for i = 1:N
            for j = 1:N
                map.topology(compteur,1) = i ;
                map.topology(compteur,2) = j ;
                compteur = compteur + 1;
            end
        end
    end
end
