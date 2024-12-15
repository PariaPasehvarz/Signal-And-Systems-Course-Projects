function bin = message_to_binary(str, mapset)
    bin = arrayfun(@(c) mapset{2, strcmp(mapset(1, :), c)}, str, 'UniformOutput', false);
    bin = cell2mat(bin);
end
