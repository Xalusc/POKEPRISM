Music_LookRival:
	channelcount 4
	channel 1, Music_LookRival_Ch1
	channel 2, Music_LookRival_Ch2
	channel 3, Music_LookRival_Ch3
	channel 4, Music_LookRival_Ch4

Music_LookRival_Ch1:
	tempo 112
	volume $77
	dutycycle $1
	tone $0001
	vibrato $12, $15
	stereopanning $f
	notetype $c, $b2
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 2
	note A#, 1
	note G#, 1
	note F#, 2
	note F_, 6
	intensity $b7
	note G#, 6
	intensity $b2
	note A#, 4
	note F_, 2
	note G#, 4
	intensity $a0
	note G#, 10
	intensity $a5
	note G#, 8
	intensity $a6
	note F#, 8
	; fallthrough

Music_RivalCommon_Ch1::
	intensity $b5
	note F_, 4
	note D#, 2
	note F_, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note A#, 4
	note G#, 2
	note G_, 4
	intensity $a0
	note F_, 2
	intensity $a7
	note F_, 16
	intensity $66
	note __, 2
	note F_, 2
	note G_, 4
	intensity $b6
	note G#, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 2
	note A#, 6
	intensity $b4
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C#, 2
	note D#, 2
	note D#, 2
	note C#, 2
	note C_, 6
	intensity $b7
	octave 3
	note A#, 12
	note G#, 2
	note G_, 2
	note G#, 2
	note A#, 10
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 6
	note G_, 10
	note A#, 6
	note G#, 6
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 8
	note F_, 6
	note C_, 2
.repeat
	intensity $b2
	note F_, 6
	intensity $b7
	note G#, 4
	note F#, 2
	note F_, 2
	note D#, 2
	loopchannel 3, .repeat
	intensity $b2
	note F_, 2
	note G#, 4
	intensity $b7
	note G#, 6
	note F#, 4
	jumpchannel Music_RivalCommon_Ch1

Music_LookRival_Ch2:
	dutycycle $3
	vibrato $8, $36
	stereopanning $f0
	notetype $c, $c2
	octave 4
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 6
	intensity $c7
	note D#, 6
	intensity $c2
	note F_, 4
	note C_, 2
	note D#, 4
	intensity $b0
	note D#, 10
	intensity $b7
	note D#, 16
	; fallthrough

Music_RivalCommon_Ch2::
	intensity $c7
	note C_, 12
	intensity $c4
	note C_, 2
	note D_, 2
	note D#, 4
	note D_, 4
	note C_, 2
	note D_, 4
	intensity $b0
	note C_, 6
	intensity $b7
	note C_, 8
	intensity $b4
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	intensity $c6
	octave 4
	note C_, 6
	intensity $c7
	note D#, 8
	note F_, 12
	intensity $c4
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note F_, 2
	intensity $c4
	note G_, 6
	intensity $b0
	note F_, 16
	intensity $b7
	note F_, 16
	intensity $b0
	note G_, 12
	note F_, 4
	note E_, 16
	note F_, 12
	note D#, 4
	intensity $c7
	note D_, 8
	intensity $c4
	note C_, 2
	note D_, 2
	note D#, 1
	note D_, 1
	note D#, 2
.repeat
	intensity $c2
	note C_, 6
	intensity $c7
	note D#, 6
	intensity $c2
	note F_, 4
	loopchannel 3, .repeat
	note C_, 2
	note D#, 4
	intensity $c7
	note D#, 10
	jumpchannel Music_RivalCommon_Ch2

Music_LookRival_Ch3:
	notetype $c, $28
	note __, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note F#, 2
	note F_, 4
	note G#, 2
	note D#, 4
	note C_, 2
	note D_, 2
	note D#, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 10
	note D#, 10
	note C_, 2
	note D#, 2
	note F#, 2
	; fallthrough

Music_RivalCommon_Ch3::
	callchannel .sub1
	loopchannel 3, Music_RivalCommon_Ch3
	note F_, 4
	note C_, 2
	note D#, 4
	note G#, 2
	note G_, 2
	note F#, 2
	callchannel .sub2
	note A#, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note F_, 2
	note G_, 2
	note G#, 1
	note A_, 1
	callchannel .sub3
	note A#, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note F_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 2
	note A#, 4
	note G_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 2
	note A#, 4
	note G_, 2
	note A_, 2
	note A#, 1
	note A_, 1
	callchannel .sub2
	callchannel .sub3
	callchannel .sub1
	callchannel .sub1
	note F_, 2
	note C_, 2
	note D_, 2
	note D#, 4
	note C_, 2
	note D_, 2
	note D#, 1
	note E_, 1
	note F_, 2
	note C_, 2
	note D_, 2
	note D#, 4
	note C_, 2
	note F#, 2
	note E_, 2
	jumpchannel Music_RivalCommon_Ch3

.sub1
	note F_, 2
	note C_, 2
	note D_, 2
	note D#, 4
	note C_, 2
	note D_, 2
	note D#, 2
	endchannel

.sub2
	note A#, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note F_, 2
	note G_, 2
	note G#, 2
	endchannel

.sub3
	note A#, 4
	note F_, 2
	note G#, 4
	note F_, 2
	note G_, 2
	note G#, 2
	endchannel

Music_LookRival_Ch4:
	stereopanning $f0
	togglenoise $3
	notetype $c
	note __, 8
	note __, 16
	note D#, 2
	note D_, 4
	note D_, 6
	note D_, 4
	note D#, 4
	note D#, 4
	note D_, 2
	; fallthrough

Music_RivalCommon_Ch4::
	note D_, 2
.loop
	note D_, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 4
	note D_, 2
	note D#, 4
	note D#, 2
	jumpchannel .loop

Music_AfterTheRivalFight:
	channelcount 4
	channel 1, Music_AfterTheRivalFight_Ch1
	channel 2, Music_AfterTheRivalFight_Ch2
	channel 3, Music_AfterTheRivalFight_Ch3
	channel 4, Music_AfterTheRivalFight_Ch4

Music_AfterTheRivalFight_Ch1:
	tempo 112
	volume $77
	dutycycle $0
	tone $0001
	vibrato $8, $14
	stereopanning $f0
	notetype $c, $b2
	octave 2
	note G#, 4
	note G#, 4
	intensity $82
	octave 3
	rept 4
		note G#, 2
	endr
	jumpchannel Music_RivalCommon_Ch1

Music_AfterTheRivalFight_Ch2:
	dutycycle $1
	vibrato $6, $35
	stereopanning $f
	notetype $c, $c2
	octave 4
	note G#, 4
	note G#, 4
	intensity $a2
	rept 4
		note G#, 2
	endr
	jumpchannel Music_RivalCommon_Ch2

Music_AfterTheRivalFight_Ch3:
	notetype $c, $28
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	jumpchannel Music_RivalCommon_Ch3

Music_AfterTheRivalFight_Ch4:
	togglenoise $3
	stereopanning $f
	notetype $c
	note D_, 4
	note D_, 4
	note D#, 2
	jumpchannel Music_RivalCommon_Ch4
