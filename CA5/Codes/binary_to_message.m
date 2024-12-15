function str = binary_to_message(bin, mapset)
    bin = bin(1:5 * floor(length(bin) / 5));
    numChunks = length(bin) / 5;
    str = blanks(numChunks);

    chunks = reshape(bin, 5, numChunks)';
    for i = 1:numChunks
        index = strcmp(mapset(2, :), chunks(i, :));
        str(i) = mapset{1, index};
    end
end
