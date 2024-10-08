Music_PalletTown:
	channelcount 3
	channel 1, Music_PalletTown_Ch1
	channel 2, Music_PalletTown_Ch2
	channel 3, Music_PalletTown_Ch3

Music_PalletTown_Ch1:
	tempo 188
	volume $77
	vibrato $12, $24
	tone $0001
	stereopanning $f
.loop
	dutycycle $2
	notetype $c, $78
	octave 3
	note B_, 12
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note B_, 12
	note D#, 1
	note G_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 4
	intensity $77
	note G_, 8
	intensity $78
	note F#, 4
	note A_, 4
	note B_, 12
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 8
	intensity $77
	note B_, 8
	dutycycle $3
.repeat
	intensity $92
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	intensity $5f
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	note G_, 4
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	loopchannel 2, .repeat
	intensity $3f
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	note D_, 4
	note E_, 4
	intensity $72
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note A_, 1
	octave 5
	note D_, 2
	intensity $62
	note D_, 2
	intensity $22
	note D_, 2
	intensity $2f
	octave 3
	note D_, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	intensity $1f
	note F#, 8
	jumpchannel .loop

Music_PalletTown_Ch2:
	vibrato $12, $44
	dutycycle $2
	stereopanning $f0
	notetype $c, $88
.loop
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	note F#, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	octave 1
	note B_, 4
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note C_, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note D_, 2
	note __, 4
	note D_, 4
	note F#, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	note F#, 4
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note B_, 4
	octave 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 8
	note A_, 8
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
.repeat
	intensity $a2
	octave 3
	note E_, 2
	octave 2
	note C_, 2
	octave 3
	note E_, 2
	octave 2
	note C_, 2
	octave 3
	note D#, 2
	octave 2
	note C_, 2
	octave 3
	note D#, 2
	octave 2
	note C_, 2
	intensity $93
	note G_, 6
	note G_, 1
	note G_, 3
	note D_, 2
	note G_, 4
	loopchannel 2, .repeat
	note C_, 2
	octave 3
	note E_, 4
	octave 2
	note C_, 1
	octave 3
	note C_, 3
	octave 2
	note C_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 3
	note D_, 4
	octave 2
	note D_, 1
	note G_, 3
	note E_, 2
	note G_, 2
	note E_, 2
	intensity $1f
	note F#, 4
	intensity $88
	note F#, 4
	note B_, 4
	note G_, 4
	note A_, 2
	note D_, 2
	note G_, 2
	note D_, 4
	note C_, 2
	octave 1
	note B_, 2
	note A_, 2
	jumpchannel .loop

Music_PalletTown_Ch3:
	vibrato $14, $24
	notetype $c, $10
.loop
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	octave 6
	note G_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 6
	octave 5
	note B_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note C_, 8
	note __, 2
	octave 5
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 6
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 8
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	octave 6
	note D_, 2
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 6
	note D_, 1
	note __, 1
	note D_, 8
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 2
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 8
	note __, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 8
	note D_, 6
	note C_, 2
	octave 5
	note B_, 8
	note __, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	note __, 2
	note C_, 4
	note D_, 6
	note C_, 1
	note D_, 1
	octave 5
	note B_, 8
	note __, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 8
	note E_, 4
	note B_, 4
	note A_, 8
	note G_, 4
	note E_, 4
	note F#, 7
	note __, 1
	note G_, 3
	note __, 1
	note B_, 3
	note __, 1
	note B_, 8
	note A_, 8
	jumpchannel .loop
