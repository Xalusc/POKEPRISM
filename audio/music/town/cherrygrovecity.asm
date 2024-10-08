Music_CherrygroveCity:
	channelcount 4
	channel 1, Music_CherrygroveCity_Ch1
	channel 2, Music_CherrygroveCity_Ch2
	channel 3, Music_CherrygroveCity_Ch3
	channel 4, Music_CherrygroveCity_Ch4

Music_CherrygroveCity_Ch1:
	tempo 152
	volume $77
	dutycycle $3
	tone $0001
	vibrato $8, $15
	stereopanning $f0
	notetype $c, $b5
	note __, 10
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
.loop
	note A_, 4
	note G#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 6
	note F_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 6
	note E_, 2
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note C_, 2
	intensity $b7
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note A#, 4
	note A_, 6
	note F_, 2
	note C_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	intensity $b5
	note A_, 4
	note G_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note A#, 4
	note A_, 6
	note F_, 2
	note C_, 4
	octave 2
	note B_, 4
	note A#, 6
	octave 3
	note C#, 2
	octave 2
	note A#, 4
	note G_, 4
	note A_, 4
	octave 3
	note C_, 4
	octave 2
	note A_, 4
	octave 3
	note C_, 4
	jumpchannel .loop

Music_CherrygroveCity_Ch2:
	dutycycle $3
	vibrato $10, $36
	stereopanning $f
	notetype $c, $c3
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note A#, 2
.loop
	intensity $c6
	octave 4
	note C_, 6
	note D_, 4
	intensity $b3
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	intensity $c7
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	note F_, 8
	intensity $c6
	note A#, 6
	octave 4
	note C_, 4
	intensity $b3
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	intensity $c7
	note A#, 6
	note G_, 2
	note E_, 8
	intensity $a0
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	note C_, 6
	intensity $a5
	octave 3
	note A_, 2
	intensity $c7
	note F_, 8
	intensity $a0
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	intensity $c7
	note C_, 16
	intensity $b5
	octave 3
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	note C_, 6
	octave 3
	note A_, 2
	note F_, 8
	note C#, 6
	note F_, 6
	note G_, 4
	intensity $a0
	note F_, 8
	intensity $a7
	note F_, 8
	jumpchannel .loop

Music_CherrygroveCity_Ch3:
	notetype $c, $16
	note __, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
.loop
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	callchannel .sub
	note D_, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	callchannel .sub
	note C#, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
.repeat
	note F_, 2
	note A_, 2
	loopchannel 4, .repeat
	jumpchannel .loop

.sub
	note D_, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	note F_, 2
	note E_, 2
	note D#, 2
	endchannel

Music_CherrygroveCity_Ch4:
	togglenoise $3
	notetype $c
	note __, 16
.loop
	note C#, 2
	note __, 2
	note G_, 2
	note C#, 2
	note C#, 2
	note F#, 2
	note C#, 4
	note C#, 2
	note __, 2
	note G_, 2
	note C#, 1
	note C#, 1
	note F#, 4
	note C#, 2
	note G_, 2
	jumpchannel .loop
