function img = SOM_BuildImageFromMap (map)


% Dimension d'une imagette (NxN)
columns = size(map.weights,2);
N = sqrt(columns);

% Image retournee
Nlig = map.n_nodesPerDim;
Ncol = map.n_nodesPerDim;

% Image a remplir avec les imagettes
img = zeros(Nlig*N,Ncol*N);

% Collage des imagettes de chaque chiffre
% sachant que 1 pattern (256) est represente par une imagette (16x16)
for p=1:map.n_nodes
    
    % Reformattage d'un pattern 256 en 16x16
    im = reshape(map.weights(p,:),N,N);
    
    % Position de l'imagette dans l'image finale
    pos_lig = floor((p-1)/Ncol)* N + 1;
    pos_col = (rem(p-1,Ncol))* N + 1;
    
    % Recopie de l'imagette dans l'image finale
    img(pos_lig:pos_lig+N-1,pos_col:pos_col+N-1) = im(:,:)' ;
end

