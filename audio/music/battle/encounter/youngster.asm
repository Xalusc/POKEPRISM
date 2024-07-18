Music_LookYoungster:
	channelcount 3
	channel 1, Music_LookYoungster_Ch1
	channel 2, Music_LookYoungster_Ch2
	channel 3, Music_LookYoungster_Ch3

Music_LookYoungster_Ch1:
	tempo 118
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $a3
	octave 3
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	intensity $3e
	note B_, 16
	intensity $c3
	octave 4
	note C_, 1
	note __, 3
	note C_, 4
	note __, 2
	note C_, 6
	intensity $b3
.loop
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note __, 16
	jumpchannel .loop

Music_LookYoungster_Ch2:
	stereopanning $f0
	vibrato $12, $26
	dutycycle $1
	notetype $c, $a3
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	intensity $3e
	notetype $c, $2e
	note G_, 16
	notetype $c, $b3
	intensity $c3
	note F_, 1
	note __, 3
	note F_, 4
	note __, 2
	note F#, 6
.loop
	dutycycle $3
	intensity $b3
	note __, 2
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	intensity $97
	dutycycle $2
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 3
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	dutycycle $3
	intensity $b3
	note __, 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	dutycycle $2
	intensity $97
	note G#, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 3
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	jumpchannel .loop

Music_LookYoungster_Ch3:
	stereopanning $ff
	vibrato $2, $24
	notetype $c, $25
	note __, 4
	callchannel .sub3
	intensity $15
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 4
	note __, 2
	note G#, 6
	intensity $25
.main_loop
	callchannel .sub4
.repeat1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	loopchannel 4, .repeat1
	callchannel .sub4
.repeat2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	loopchannel 3, .repeat2
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	jumpchannel .main_loop

.sub4
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
.sub3
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	loopchannel 3, .sub3
	endchannel
