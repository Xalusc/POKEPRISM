Music_LookHiker:
	channelcount 4
	channel 1, Music_LookHiker_Ch1
	channel 2, Music_LookHiker_Ch2
	channel 3, Music_LookHiker_Ch3
	channel 4, Music_LookHiker_Ch4

Music_LookHiker_Ch1:
	tempo 132
	volume $77
	tone $0001
	vibrato $12, $24
	dutycycle $2
	stereopanning $f
	notetype $c, $68
	octave 3
	note F#, 2
	note F_, 2
	note F#, 8
.loop
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note __, 4
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note F#, 2
	note __, 6
	jumpchannel .loop

Music_LookHiker_Ch2:
	dutycycle $0
	notetype $c, $a1
	note __, 4
	octave 1
	note B_, 1
	note B_, 5
	octave 2
	note F#, 1
	note F#, 5
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	intensity $a1
.loop
	octave 1
	note B_, 1
	note B_, 2
	octave 2
	note D_, 1
	note D_, 2
	note F#, 1
	note F#, 2
	note A#, 1
	note A#, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	jumpchannel .loop

Music_LookHiker_Ch3:
	vibrato $12, $24
	stereopanning $f0
	notetype $c, $14
	octave 4
	note B_, 2
	note A#, 2
	note B_, 8
.loop
	octave 5
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	callchannel .sub
	note G_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	callchannel .sub
	jumpchannel .loop

.sub
	octave 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note B_, 2
	note __, 6
	endchannel

Music_LookHiker_Ch4:
	togglenoise $3
	notetype $c
	note F_, 4
	note __, 16
.loop
	note D#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	jumpchannel .loop
