fs = 8000;
ts = 1/fs;
tstart = 0;
tend = 0.5;
tstop = 0.025;
ton = tstart:ts:tend-ts; 
rest = tstart:ts:tstop-ts; 
stop = zeros(size(rest));

Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
Frequencies = [523.25,554.37,587.33,622.25,659.25,698.46,739.99,783.99,830.61,880,932.33,987.77];

input_song = {'D' ,'D' ,'G' ,'F#', 'D'  ,    'D' , 'E' , 'E' , 'D' , 'F#', 'D' , 'E'    ,   'D' , 'E' , 'F#', 'E'    ,    'D' , 'E' , 'E' , 'D' ,'F#' ,'D' , 'E'    ,   'D' , 'E' , 'D' ,'F#' , 'E'   ,   'D' ,'E' ,'D' ,'F#' , 'E'    ,  'D' ,'D' , 'E' , 'F#','E' ,'F#'   , 'F#','E' ,'F#','F#','D'
              0.25,0.25, 0.5, 0.5, 0.5  ,    0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5    ,   0.5 , 0.5 , 0.5 , 0.5    ,    0.25, 0.25, 0.25, 0.25,0.25 ,0.25, 0.5    ,   0.5 , 0.25, 0.25, 0.5 , 0.5   ,   0.5 ,0.25,0.25, 0.5 , 0.5    ,  0.25,0.25, 0.5 ,0.25 ,0.25, 0.5   , 0.25,0.25, 0.5, 0.5,0.5};
 
out_voice = [];
for i = 1:length(input_song)

    n = find(Notes == input_song{1,i});
    note = sin(2*pi*Frequencies(n)*ton);
    duration =  2* input_song{2,i} * size(ton,2);
    out_voice = [out_voice note(1:duration) stop];
end

sound(out_voice)
audiowrite('part1_song.wav', out_voice, fs);

