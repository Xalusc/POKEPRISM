Music_LookKimonoGirl:
	channelcount 3
	channel 1, Music_LookKimonoGirl_Ch1
	channel 2, Music_LookKimonoGirl_Ch2
	channel 3, Music_LookKimonoGirl_Ch3

Music_LookKimonoGirl_Ch1:
	tempo 160
	volume $77
	stereopanning $f
	dutycycle $1
	notetype $6, $87
	tone $0001
	callchannel Music_LookKimonoGirl_CommonSub
	tone 0
.loop
	notetype $c, $b2
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	callchannel .sub2
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	intensity $b4
	octave 3
	note E_, 1
	intensity $54
	octave 4
	note E_, 1
	intensity $b4
	octave 3
	note D_, 1
	intensity $54
	octave 4
	note D_, 1
	intensity $b4
	octave 2
	note B_, 1
	intensity $54
	octave 3
	note B_, 1
	intensity $b4
	octave 2
	note A_, 1
	intensity $54
	octave 3
	note A_, 1
	jumpchannel .loop

.sub1
	intensity $b4
	octave 2
	note F_, 1
	intensity $74
	octave 3
	note F_, 1
	jumpchannel .common

.sub2
	intensity $b4
	octave 2
	note E_, 1
	intensity $74
	octave 3
	note E_, 1
.common
	intensity $b4
	octave 2
	note A_, 1
	intensity $74
	octave 3
	note A_, 1
	intensity $b4
	octave 2
	note B_, 1
	intensity $74
	octave 3
	note B_, 1
	intensity $b4
	octave 3
	note D_, 1
	intensity $74
	octave 4
	note D_, 1
	endchannel

Music_LookKimonoGirl_Ch2:
	dutycycle $0
	notetype $6, $a7
	stereopanning $f0
	callchannel Music_LookKimonoGirl_CommonSub
.loop
	dutycycle $3
	notetype $c, $91
	octave 5
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	callchannel .sub
	octave 5
	note F_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	callchannel .sub
	jumpchannel .loop

.sub
	octave 5
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note E_, 1
	endchannel

Music_LookKimonoGirl_CommonSub:
	octave 4
	note E_, 1
	octave 5
	note E_, 16
	note __, 1
	note E_, 2
	note __, 3
	intensity $b7
	note E_, 2
	note __, 2
	intensity $b7
	note E_, 2
	note __, 1
	intensity $a7
	note E_, 2
	note __, 1
	notetype $6, $65
	note E_, 2
	note __, 1
	intensity $54
	note E_, 2
	note __, 1
	intensity $63
	note E_, 2
	note E_, 2
	intensity $91
	note E_, 2
	intensity $a1
	note E_, 1
	notetype $8, $b1
	note E_, 1
	note E_, 1
	endchannel

Music_LookKimonoGirl_Ch3:
	stereopanning $ff
	vibrato $12, $24
	notetype $6, $13
	note __, 1
	note __, 16
	octave 5
	note E_, 1
	note F_, 1
	note E_, 2
	notetype $c, $13
	note E_, 12
	notetype $6, $13
	octave 5
	note D_, 2
	note E_, 2
.loop
	octave 5
	note D_, 4
	note E_, 4
	note F_, 4
	note A_, 4
	note B_, 4
	note A_, 4
	note B_, 4
	octave 6
	note D_, 4
	note E_, 8
	note F_, 1
	note F#, 1
	note F_, 2
	note D_, 4
	note E_, 8
	note D_, 4
	note E_, 4
	note F_, 8
	note A_, 8
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 2
	note A_, 4
	note F_, 4
	note D_, 4
	note E_, 1
	note F_, 1
	note E_, 10
	note F_, 2
	note E_, 2
	note D_, 8
	note E_, 8
	jumpchannel .loop
