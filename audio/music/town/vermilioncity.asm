Music_VermilionCity:
	channelcount 3
	channel 1, Music_VermilionCity_Ch1
	channel 2, Music_VermilionCity_Ch2
	channel 3, Music_VermilionCity_Ch3

Music_VermilionCity_Ch1:
	stereopanning $f
	tempo 176
	volume $77
	dutycycle $2
	notetype $c, $65
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 2
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	vibrato $10, $23
.loop
	dutycycle $1
	intensity $85
	callchannel .sub1
	note F_, 4
	octave 4
	note D_, 4
	note C#, 4
	note E_, 4
	callchannel .sub1
	callchannel .sub2
	dutycycle $2
	callchannel .sub1
	note F_, 4
	octave 4
	note D_, 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note C_, 1
	callchannel .sub1
	callchannel .sub2
	intensity $93
	dutycycle $0
.repeat1
	note __, 2
	note F#, 2
	loopchannel 4, .repeat1
.repeat2
	note __, 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	note F#, 2
	note __, 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	note B_, 2
	note G#, 2
	loopchannel 2, .repeat2
	intensity $87
	dutycycle $2
	octave 4
	note D_, 8
	octave 3
	note G#, 8
	note E_, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	octave 2
	note B_, 4
	note G#, 4
	note B_, 4
	octave 3
	note D_, 4
	jumpchannel .loop

.sub1
	octave 3
	note C#, 4
	note E_, 4
	note F#, 2
	note A_, 2
	note E_, 2
	note G#, 2
	endchannel

.sub2
	note D_, 2
	note F_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note E_, 2
	endchannel

Music_VermilionCity_Ch2:
	stereopanning $ff
	dutycycle $3
	notetype $c, $77
	vibrato $10, $23
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note F#, 4
	note G#, 4
.loop
	intensity $97
	callchannel .sub
	note G#, 2
	callchannel .sub
	note E_, 2
	intensity $b7
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
.repeat
	note F#, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	loopchannel 2, .repeat
	note F#, 6
	note E_, 1
	note F#, 1
	note E_, 8
	note A_, 6
	note G#, 1
	note A_, 1
	note G#, 8
	note G#, 14
	notetype $6, $57
	note __, 1
	octave 4
	note E_, 1
	note G#, 1
	note B_, 1
	notetype $c, $87
	octave 5
	note E_, 16
	jumpchannel .loop

.sub
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note C#, 1
	note D_, 1
	note E_, 8
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note E_, 1
	note D_, 1
	note C#, 2
	note E_, 2
	octave 1
	note A_, 2
	endchannel

Music_VermilionCity_Ch3:
	stereopanning $f0
	vibrato $22, $23
	notetype $c, $25
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note B_, 4
	note D_, 4
	note E_, 4
	note D_, 2
	octave 3
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
.loop
	intensity $22
	callchannel .sub1
	octave 5
	note A_, 6
	intensity $24
	note E_, 1
	note G#, 1
	callchannel .sub1
	note A_, 8
	intensity $14
	octave 3
	note D_, 4
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	octave 3
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	callchannel .sub2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	callchannel .sub2
	intensity $25
	octave 3
	note E_, 8
	octave 4
	note E_, 8
	octave 3
	note B_, 8
	octave 4
	note E_, 8
	octave 2
	note E_, 16
	octave 3
	note E_, 14
	intensity $22
	octave 5
	note E_, 1
	note G#, 1
	jumpchannel .loop

.subrepeat
	note A_, 1
	note B_, 1
	octave 6
	note C#, 8
.sub1
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	loopchannel 2, .subrepeat
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	endchannel

.sub2
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note F#, 2
	note E_, 2
	note __, 4
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	note __, 1
	note D_, 2
	note __, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	endchannel
