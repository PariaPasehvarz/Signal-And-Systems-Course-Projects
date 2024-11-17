% Load video
video = VideoReader('car_video.mp4');

% Initialize variables
centroids = [];
frameRate = video.FrameRate;
detector = vision.ForegroundDetector('NumGaussians', 3, 'NumTrainingFrames', 50);

while hasFrame(video)
    frame = readFrame(video);
    grayFrame = rgb2gray(frame);
    
    % Use background subtraction to detect moving objects
    mask = detector(grayFrame);
    mask = bwareaopen(mask, 50); % Remove small objects
    
    % Get the properties of the detected regions
    stats = regionprops(mask, 'Centroid', 'BoundingBox');
    
    if ~isempty(stats)
        % Assuming the largest blob is the car
        areas = arrayfun(@(s) s.BoundingBox(3) * s.BoundingBox(4), stats);
        [~, maxIdx] = max(areas);
        centroid = stats(maxIdx).Centroid;
        centroids = [centroids; centroid];
        
        % Display centroid and bounding box on frame
        frame = insertMarker(frame, centroid, 'o', 'Color', 'red', 'Size', 5);
        bbox = stats(maxIdx).BoundingBox;
        frame = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
    end
    
    % Display the video with detected centroids and bounding boxes
    imshow(frame);
    pause(1/frameRate); % Pause to match the frame rate of the video
end

% Remove outliers from centroids
centroids = remove_centroid_outliers(centroids);

% Calculate speed if there are enough valid centroids
if size(centroids, 1) > 1
    distances = sqrt(sum(diff(centroids).^2, 2));
    filtered_distances = remove_distance_outliers(distances);
    total_distance = sum(filtered_distances);
    total_time = (length(filtered_distances) / frameRate);
    average_speed = total_distance / total_time; % Average speed in pixels per second
    disp('Average speed of the car in pixels per second:');
    disp(average_speed);
end

pixels_per_meter = 1400; % Conversion factor (pixels in one meter)

% Convert speed from pixels per second to meters per second
speed_meters_per_second = average_speed / pixels_per_meter;

disp('Speed of the car in meters per second:');
disp(speed_meters_per_second);

