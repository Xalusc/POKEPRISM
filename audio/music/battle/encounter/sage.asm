Music_LookSage:
	channelcount 2
	channel 1, Music_LookSage_Ch1
	channel 3, Music_LookSage_Ch3

Music_LookSage_Ch1:
	tempo 144
	stereopanning $f
	volume $77
	dutycycle $3
	notetype $c, $b3
	note __, 2
	note __, 16
	callchannel .sub1
	octave 3
	callchannel .sub2
	intensity $b3
	note F_, 2
	intensity $93
	note F_, 2
.loop
	callchannel .sub3
	intensity $b3
	octave 3
	note D_, 2
	intensity $93
	note D_, 2
	intensity $b3
	octave 2
	note B_, 2
	intensity $93
	note B_, 2
	intensity $b3
	octave 3
	note D_, 2
	intensity $93
	note D_, 2
	intensity $b3
	note E_, 2
	intensity $93
	note E_, 2
	intensity $b3
	note F_, 2
	intensity $93
	note F_, 2
	callchannel .sub2
	callchannel .sub3
	callchannel .sub1
	jumpchannel .loop

.sub1
	octave 2
	intensity $b3
	note E_, 2
	intensity $93
	note E_, 2
	intensity $b3
	note A_, 2
	intensity $93
	note A_, 2
	intensity $b3
	note B_, 2
	intensity $93
	note B_, 2
	intensity $b3
	note A_, 2
	intensity $93
	note A_, 2
	endchannel

.sub2
	intensity $b3
	note D_, 2
	intensity $93
	note D_, 2
	intensity $b3
	note E_, 2
	intensity $93
	note E_, 2
	intensity $b3
	note A_, 2
	intensity $93
	note A_, 2
	endchannel

.sub3
	intensity $b3
	note D_, 2
	intensity $93
	note D_, 2
	octave 2
	intensity $b3
	note B_, 2
	intensity $93
	note B_, 2
	intensity $b3
	note A_, 2
	intensity $93
	note A_, 2
	intensity $b3
	note B_, 2
	intensity $93
	note B_, 2
	endchannel

Music_LookSage_Ch3:
	stereopanning $f0
	vibrato $16, $23
	notetype $c, $10
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 16
	vibrato $7, $23
	note B_, 8
	vibrato $14, $23
	octave 6
	note D_, 6
	note E_, 1
	note F_, 1
	note E_, 14
	note G_, 1
	note G#, 1
.loop
	note A_, 12
	note B_, 4
	note D_, 9
	note E_, 1
	note F_, 1
	note D_, 1
	vibrato $0, $0
	note E_, 4
	vibrato $7, $23
	note E_, 8
	vibrato $14, $23
	octave 5
	note B_, 8
	octave 6
	note F_, 8
	notetype $6, $10
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note __, 4
	octave 6
	note E_, 2
	note F_, 2
	notetype $c, $10
	note E_, 14
	note G_, 1
	note G#, 1
	jumpchannel .loop
