Music_SproutTower:
	channelcount 4
	channel 1, Music_SproutTower_Ch1
	channel 2, Music_SproutTower_Ch2
	channel 3, Music_SproutTower_Ch3
	channel 4, Music_SproutTower_Ch4

Music_SproutTower_Ch1:
	tempo 176
	volume $77
	dutycycle $3
	tone $0002
	vibrato $8, $45
	stereopanning $f
	notetype $c, $a3
	note __, 16
	note __, 16
.loop
	note __, 6
	octave 3
	note F_, 2
	note F#, 4
	note F#, 4
	note F_, 4
	note C_, 4
	note C#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note F#, 4
	note F#, 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note F_, 4
	note F#, 2
	note D#, 10
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	intensity $a5
	note C_, 8
	intensity $a3
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $a7
	note C_, 16
	intensity $a3
	callchannel Music_SproutTower_Common
	jumpchannel .loop

Music_SproutTower_Ch2:
	dutycycle $3
	tone $0001
	vibrato $8, $48
	notetype $c, $b2
	octave 3
	callchannel Music_SproutTower_Common
.loop
	intensity $b5
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note F#, 4
	intensity $b7
	note F_, 8
	intensity $b5
	note F#, 4
	note A#, 4
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 8
	intensity $b5
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note F#, 2
	intensity $b7
	note A#, 8
	intensity $b5
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note F#, 2
	note D#, 2
	intensity $b7
	note F_, 8
	intensity $b3
	note F_, 4
	note F_, 4
	note F#, 4
	note A#, 2
	note F_, 1
	note A#, 1
	intensity $b7
	octave 4
	note C_, 16
	note __, 16
	jumpchannel .loop

Music_SproutTower_Common:
	note F_, 4
	note F_, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note F_, 4
	note D#, 4
	note D#, 4
	endchannel

Music_SproutTower_Ch3:
	vibrato $14, $e8
	notetype $c, $14
	octave 3
.repeat
	note F_, 2
	note __, 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	note __, 2
	note F#, 2
	loopchannel 2, .repeat
	stereopanning $f0
.loop
	note __, 4
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	note __, 2
	note F#, 2
	callchannel .sub
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note __, 2
	note F#, 2
	note F_, 2
	note __, 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	note __, 2
	note F#, 2
	note F_, 8
	note F#, 4
	note A#, 4
	note D#, 8
	note F_, 4
	note F#, 4
	note F_, 16
	callchannel .sub
	callchannel .sub
	jumpchannel .loop

.sub
	note F_, 2
	note __, 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	note __, 2
	note F_, 2
	endchannel

Music_SproutTower_Ch4:
	togglenoise $0
	notetype $c
	note __, 4
.loop
	note F#, 4
	stereopanning $f0
	note D#, 4
	note F#, 2
	stereopanning $f
	note D#, 2
	stereopanning $ff
	note F#, 4
	note F#, 4
	stereopanning $f
	note D#, 4
	note F#, 2
	stereopanning $f0
	note D#, 2
	stereopanning $ff
	note F#, 4
	jumpchannel .loop
