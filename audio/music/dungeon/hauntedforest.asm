Music_HauntedForest:
	channelcount 3
	channel 1, Music_HauntedForest_Ch1
	channel 2, Music_HauntedForest_Ch2
	channel 3, Music_HauntedForest_Ch3

Music_HauntedMansion:
	channelcount 3
	channel 1, Music_HauntedMansion_Ch1
	channel 2, Music_HauntedMansion_Ch2
	channel 3, Music_HauntedMansion_Ch3

Music_HauntedMansion_Ch1:
	forceoctave 2
Music_HauntedForest_Ch1:
	stereopanning $f0
	tempo 272
	volume $77
.loop
	vibrato $12, $33
	dutycycle $3
	notetype $6, $48
	octave 5
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	notetype $c, $48
	octave 6
	note C_, 14
	vibrato $0, $33
	intensity $46
	note C_, 8
	note __, 8
	note __, 16
	note __, 16
	note __, 16
	vibrato $12, $33
	dutycycle $3
	notetype $6, $48
	octave 4
	note G#, 1
	note A_, 16
	vibrato $0, $33
	note A_, 11
	intensity $38
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	dutycycle $2
	vibrato $12, $53
	notetype $6, $b8
	octave 3
	note D_, 2
	note C#, 2
	note G_, 2
	notetype $c, $98
	note F#, 9
	notetype $6, $48
	note F_, 1
	note E_, 1
	notetype $6, $28
	note D#, 1
	note D_, 1
	notetype $c, $b3
	note __, 2
	note __, 16
	jumpchannel .loop

Music_HauntedMansion_Ch2:
	forceoctave 2
Music_HauntedForest_Ch2:
	stereopanning $f
	tone $0001
.loop
	dutycycle $3
	vibrato $12, $33
	notetype $6, $48
	octave 6
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	notetype $c, $48
	note F_, 14
	vibrato $0, $33
	intensity $46
	note F_, 8
	dutycycle $2
	vibrato $12, $33
	notetype $6, $98
	octave 4
	note F#, 1
	intensity $28
	note F#, 1
	intensity $98
	note F_, 1
	intensity $28
	note F_, 1
	intensity $98
	note A#, 1
	intensity $28
	note A#, 1
	intensity $98
	note A_, 4
	intensity $68
	note C#, 4
	intensity $48
	note C_, 2
	intensity $18
	note C_, 2
	intensity $68
	octave 3
	note A#, 4
	intensity $88
	note A_, 2
	intensity $28
	note A_, 2
	intensity $88
	note F#, 6
.repeat
	intensity $28
	note F_, 1
	note F#, 1
	intensity $38
	note F_, 1
	note F#, 1
	intensity $48
	note F_, 1
	note F#, 1
	intensity $58
	note F_, 1
	note F#, 1
	intensity $68
	note F_, 1
	note F#, 1
	intensity $78
	note F_, 1
	note F#, 1
	intensity $b8
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	intensity $a8
	note F_, 1
	note F#, 1
	intensity $88
	note F_, 1
	note F#, 1
	intensity $78
	note F_, 1
	note F#, 1
	intensity $68
	note F_, 1
	note F#, 1
	intensity $58
	note F_, 1
	note F#, 1
	intensity $48
	note F_, 1
	note F#, 1
	intensity $28
	note F_, 1
	note F#, 1
	intensity $18
	note F_, 1
	note F#, 1
	loopchannel 2, .repeat
	note __, 16
	dutycycle $3
	intensity $48
	octave 5
	note G_, 1
	note G#, 16
	vibrato $0, $33
	note G#, 11
	vibrato $12, $33
	intensity $38
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	dutycycle $2
	vibrato $12, $53
	intensity $b8
	octave 3
	note F#, 2
	note F_, 2
	note B_, 2
	notetype $c, $a8
	note A#, 9
	notetype $6, $48
	note A_, 1
	note G#, 1
	notetype $6, $38
	note G_, 1
	note F#, 1
	intensity $78
	octave 1
	note F#, 4
	notetype $c, $b3
	note __, 14
	notetype $6, $a8
	octave 2
	note B_, 1
	note A#, 1
	note G_, 1
	note F#, 1
	jumpchannel .loop

Music_HauntedMansion_Ch3:
	forceoctave 2
Music_HauntedForest_Ch3:
	notetype $6, $22
	octave 1
.loop
	note B_, 2
	intensity $32
	callchannel .sub1
	intensity $22
	callchannel .sub2
	intensity $22
	octave 1
	note B_, 2
	intensity $32
	octave 3
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note __, 2
	intensity $22
	octave 1
	note B_, 2
	intensity $32
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note __, 2
	intensity $22
	octave 1
	note B_, 2
	note __, 6
	note B_, 2
	note __, 6
	intensity $32
	octave 1
	note B_, 2
	callchannel .sub1
	callchannel .sub2
	intensity $22
	octave 2
	note D_, 2
	note __, 6
	intensity $32
	note D_, 2
	note __, 6
	octave 1
	note B_, 2
	callchannel .sub1
	octave 1
	note B_, 2
	note __, 6
	intensity $22
	octave 2
	note D_, 2
	note __, 6
	intensity $32
	note D_, 2
	note __, 6
	octave 1
	note B_, 2
	callchannel .sub1
	octave 1
	note B_, 2
	note __, 6
	intensity $22
	octave 1
	note B_, 2
.repeat
	intensity $32
	callchannel .sub3
	loopchannel 3, .repeat
	callchannel .sub3
	note __, 6
	note B_, 2
	note __, 6
	intensity $32
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	intensity $12
	note F#, 4
	intensity $32
	note B_, 2
	note __, 6
	note B_, 2
	note __, 6
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	intensity $22
	note B_, 1
	note A#, 1
	note G_, 1
	note F#, 1
	jumpchannel .loop

.sub1
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	endchannel

.sub2
	octave 1
	note B_, 2
	note __, 6
	note B_, 2
	note __, 6
	note B_, 2
	intensity $32
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	endchannel

.sub3
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	intensity $22
	octave 1
	note B_, 2
	endchannel
