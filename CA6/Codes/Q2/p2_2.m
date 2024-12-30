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

song = { 'C','C','G','G','A','A','G','F','F','E','E','D','D','C','G','G','F','F','E','E','D','G','G','F','F','E','E','D','C','G','G','A','G','F','F','E','E','D','C'
         0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5 0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5 0.5,0.5,0.5,0.5,0.5,0.5,0.5};

mysong = [];
for i = 1:length(song)
    n = find(Notes == song{1,i});
    note = sin(2*pi*Frequencies(n)*ton);
    duration = 2*song{2,i} * size(ton,2);
    mysong = [mysong note(1:duration) stop];

end

sound(mysong)
audiowrite('mysong.wav',mysong,fs)