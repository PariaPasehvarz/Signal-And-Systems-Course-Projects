[audio, fs] = audioread('part1_song.wav');

notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
frequencies = [523.25,554.37,587.33,622.25,659.25,698.46,739.99,783.99,830.61,880,932.33,987.77];

t_step = 0.025; 
samples_per_step = round(t_step * fs);
silence_threshold = 0.01; 


detected_notes = [];
detected_duration=[];
i = 1;
while i <= length(audio)
    segment = audio(i:min(i+samples_per_step-1, length(audio)));
    if max(abs(segment)) < silence_threshold
        i = i + samples_per_step;
        continue;
    end
    start_idx = i;
    while i <= length(audio)
        segment = audio(i:min(i+samples_per_step-1, length(audio)));
        if max(abs(segment)) < silence_threshold
            break;
        end
        i = i + samples_per_step;
    end
    end_idx = i - 1;
    duration = (end_idx - start_idx + 1) / fs;
    active_segment = audio(start_idx:end_idx);
    fft_result = fft(active_segment);
    S_mag = abs(fft_result(1:floor(length(fft_result)/2))); 
    f_axis = linspace(0, fs/2, length(S_mag));
    [~, max_idx] = max(S_mag);
    dominant_freq = f_axis(max_idx);
    [~, note_idx] = min(abs(frequencies - dominant_freq));
    detected_notes = [detected_notes, notes(note_idx)];
    detected_duration=[detected_duration duration];
end

disp('Detected Data:');
for j=1:5:length(detected_notes)
    fprintf('%s ',detected_notes{j:min(j+4,length(detected_notes))});
        fprintf('\n');
    for i=j:min(j+4,length(detected_duration))
        fprintf("%.3f ",detected_duration(i));
    end
    fprintf('\n');
end

