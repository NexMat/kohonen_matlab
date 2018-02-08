function map = SOM_UpdateWeights (map , patt_in , inode , iter , iter_max)

if iter<=iter_max
    it = iter / iter_max ;

    current_learning_rate = map.learning_rate_i + (map.learning_rate_f - map.learning_rate_i) * it ;

    neighborhood_spread = map.neigborhood_spread_i + (map.neigborhood_spread_f - map.neigborhood_spread_i) * it;

    for i = 1:map.n_nodes

        % Calcul de alpha
        alpha = exp(-sum((map.topology(inode,:)-map.topology(i,:)).^2)/(2*neighborhood_spread.^2));

        % Delta des poids synaptiques
        dw = alpha * current_learning_rate * (patt_in-map.weights(i,:));

        % Mise à jour des poids synaptiques
        map.weights(i,:) = map.weights(i,:) + dw;

    end

end
