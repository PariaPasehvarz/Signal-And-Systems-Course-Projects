function [L, num] = mysegmentation(BW)
    % Input: BW is a binary image (2D matrix) with 0's and 1's.
    % Output: L is the labeled image, num is the number of connected components.
    
    [rows, cols] = size(BW);       % Get the size of the input image
    L = zeros(rows, cols);         % Initialize the label matrix with zeros
    label = 0;                     % Initial label (no components yet)
    
    % Define the 4-connected neighborhood (up, down, left, right)
    neighbors = [-1, 0; 1, 0; 0, -1; 0, 1];
    
    % Function to perform depth-first search (DFS) to label a connected component
    function DFS(r, c, current_label)
        stack = [r, c];  % Initialize a stack for DFS
        while ~isempty(stack)
            % Pop the last element from the stack
            [row, col] = deal(stack(end, 1), stack(end, 2));
            stack(end, :) = [];  % Remove from stack
            
            % Check if the current pixel is within the bounds and has not been labeled
            if row >= 1 && row <= rows && col >= 1 && col <= cols && BW(row, col) == 1 && L(row, col) == 0
                % Label the current pixel
                L(row, col) = current_label;
                
                % Add the neighbors (up, down, left, right) to the stack
                for i = 1:size(neighbors, 1)
                    newRow = row + neighbors(i, 1);
                    newCol = col + neighbors(i, 2);
                    stack = [stack; newRow, newCol];  % Push onto the stack
                end
            end
        end
    end

    % Main loop to scan through the binary image
    for r = 1:rows
        for c = 1:cols
            % If the pixel is a foreground pixel (1) and hasn't been labeled
            if BW(r, c) == 1 && L(r, c) == 0
                % Increment the label count (new connected component)
                label = label + 1;
                % Perform DFS to label the entire connected component
                DFS(r, c, label);
            end
        end
    end
    
    % Output the number of connected components
    num = label;
end
