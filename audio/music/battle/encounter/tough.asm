Music_LookTough:
	channelcount 4
	channel 1, Music_LookTough_Ch1
	channel 2, Music_LookTough_Ch2
	channel 3, Music_LookTough_Ch3
	channel 4, Music_LookTough_Ch4

Music_LookTough_Ch1::
	tempo 100
	volume $77
	stereopanning $f0
	dutycycle $2
	tone $0001
	notetype $c, $81
.loop
	octave 5
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note __, 6
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note A#, 2
	note G#, 2
	note G_, 2
	note __, 6
	note D#, 2
	note D_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note F_, 4
	note __, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	note D#, 2
	jumpchannel .loop

Music_LookTough_Ch2::
	dutycycle $0
	vibrato $10, $22
	notetype $c, $c2
.loop
	octave 4
	note C_, 4
	note __, 2
	note D#, 2
	note D_, 2
	note C_, 2
	vibrato $00, $33
	notetype $c, $e7
	dutycycle $1
	note F_, 4
	vibrato $10, $22
	notetype $c, $c2
	dutycycle $0
	note __, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note C_, 4
	note __, 2
	note D#, 2
	note D_, 2
	note C_, 2
	vibrato $00, $33
	notetype $c, $e7
	dutycycle $1
	octave 5
	note F_, 4
	vibrato $10, $22
	notetype $c, $c2
	dutycycle $0
	octave 4
	note __, 2
	note A#, 2
	note G#, 2
	note G_, 2
	note C_, 4
	note __, 2
	note D#, 2
	note D_, 2
	note C_, 2
	intensity $60
	note D_, 4
	intensity $a0
	note D#, 4
	intensity $d0
	note F_, 4
	intensity $f0
	note D#, 4
	intensity $b0
	note C_, 4
	intensity $70
	note D_, 4
	vibrato $10, $22
	notetype $c, $c2
	note D#, 2
	note D_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note F_, 2
	jumpchannel .loop

Music_LookTough_Ch3::
	stereopanning $ff
	vibrato $0, $23
	notetype $c, $16
.loop
	octave 3
	callchannel .sub
	note G_, 6
	note D#, 6
	callchannel .sub
	note F_, 6
	note D#, 6
	callchannel .sub
	note G_, 6
	note D#, 6
	callchannel .sub
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	jumpchannel .loop

.sub
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 6
	endchannel

Music_LookTough_Ch4::
	togglenoise $3
	notetype $c
.loop
	note C_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	note B_, 6
	note C_, 2
	note A#, 2
	note A#, 2
	note C_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	loopchannel 2, .loop
	note C_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	note B_, 6
.repeat
	note D_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	note A#, 1
	note A#, 1
	loopchannel 2, .repeat
	note C_, 2
	note A#, 1
	note A#, 1
	note C_, 2
	note B_, 6
	jumpchannel .loop
