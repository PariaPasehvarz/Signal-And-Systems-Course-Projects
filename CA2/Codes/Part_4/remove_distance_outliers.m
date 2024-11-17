% Function to remove outliers from distances
function filtered_distances = remove_distance_outliers(distances)
    mean_distance = mean(distances);
    std_distance = std(distances);
    z_scores = abs((distances - mean_distance) / std_distance);
    threshold = 3;
    filtered_distances = distances(z_scores < threshold);
end