% Function to remove outliers from centroids
function filtered_centroids = remove_centroid_outliers(centroids)
    mean_centroid = mean(centroids);
    std_centroid = std(centroids);
    z_scores = abs((centroids - mean_centroid) ./ std_centroid);
    threshold = 3;
    valid_indices = all(z_scores < threshold, 2);
    filtered_centroids = centroids(valid_indices, :);
end