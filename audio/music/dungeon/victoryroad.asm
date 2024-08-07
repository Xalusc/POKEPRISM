Music_VictoryRoad:
	channelcount 4
	channel 1, Music_VictoryRoad_Ch1
	channel 2, Music_VictoryRoad_Ch2
	channel 3, Music_VictoryRoad_Ch3
	channel 4, Music_VictoryRoad_Ch4

Music_VictoryRoad_Ch1:
	tempo $6c
	dutycycle $1
	notetype $c, $1c
	vibrato $1, $23
	stereopanning $f0
.loop
	note __, 16
	loopchannel 16, .loop
	forceoctave $17
	intensity $1c
	octave 3
	note F_, 8
	callchannel Music_VictoryRoad_Common_1
	note G_, 8
	callchannel Music_VictoryRoad_Common_2
	note F_, 8
	callchannel .sub1
	note F#, 8
	callchannel Music_VictoryRoad_Common_2
	note F_, 8
	callchannel Music_VictoryRoad_Common_1
	note G_, 8
	callchannel Music_VictoryRoad_Common_2
	note F_, 8
	callchannel .sub1
	note F#, 8
	forceoctave $1a
	callchannel Music_VictoryRoad_Common_2
	forceoctave $0
	note C_, 8
	callchannel Music_VictoryRoad_Common_1
	note C#, 8
	callchannel Music_VictoryRoad_Common_2
	note C_, 8
	callchannel Music_VictoryRoad_Common_1
	note C#, 8
	forceoctave $1
	callchannel Music_VictoryRoad_Common_2
	forceoctave $0
	note C_, 8
	callchannel Music_VictoryRoad_Common_1
	note C#, 8
	note __, 4
	dutycycle $0
	intensity $81
	vibrato $0, $0
	octave 6
	note F#, 4
	octave 5
	note F_, 2
	note F_, 4
	note F_, 6
	octave 6
	note F_, 4
	octave 5
	note F_, 2
	note F_, 4
	note F_, 4
	note __, 6
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	forceoctave $17
	octave 3
	arp $7, $c
	note F_, 8
	callchannel .sub2
	arp $5, $c
	note G_, 8
	callchannel .sub3
	arp $7, $c
	note F_, 8
	callchannel .sub4
	arp $7, $c
	note F#, 8
	callchannel .sub3
	arp $7, $c
	note F_, 8
	callchannel .sub2
	arp $5, $c
	note G_, 8
	callchannel .sub3
	arp $7, $c
	note F_, 8
	callchannel .sub4
	arp $7, $c
	note F#, 8
	forceoctave $1a
	callchannel .sub3
	forceoctave $0
	arp $5, $c
	note C_, 8
	callchannel .sub2
	arp $5, $c
	note C#, 8
	callchannel .sub3
	arp $5, $c
	note C_, 8
	callchannel .sub2
	arp $5, $c
	note C#, 8
	forceoctave $1
	callchannel .sub3
	forceoctave $0
	arp $5, $c
	note C_, 8
	callchannel .sub2
	arp $5, $c
	note C#, 8
	dutycycle $0
	intensity $81
	vibrato $0, $0
	arp $0, $0
	stereopanning $f
	octave 5
	note F#, 2
	note F#, 2
	stereopanning $f0
	octave 6
	note F#, 2
	stereopanning $f
	octave 5
	note F#, 2
	stereopanning $f0
	note F_, 2
	note F_, 2
	stereopanning $f
	octave 6
	note F_, 2
	stereopanning $f0
	octave 5
	note F_, 2
	stereopanning $f
	note F_, 2
	note F_, 2
	stereopanning $f0
	octave 6
	note F_, 2
	stereopanning $f
	octave 5
	note F_, 2
	stereopanning $f0
	note F_, 2
	note F_, 2
	stereopanning $f
	octave 6
	note F_, 2
	stereopanning $f0
	octave 5
	note F_, 2
	stereopanning $f
	octave 6
	note F_, 2
	note __, 6
	dutycycle $1
	intensity $f
	vibrato $1, $23
	stereopanning $f0
	octave 3
	note D_, 16
	intensity $c7
	note D_, 16
	intensity $f
	note C#, 16
	intensity $c7
	note C#, 16
	intensity $f
	octave 4
	note C_, 16
	intensity $c7
	note C_, 16
	intensity $f
	octave 3
	note B_, 16
	intensity $c7
	note B_, 16
	intensity $f
	arp $6, $c
	note D_, 16
	intensity $c7
	note D_, 16
	intensity $f
	note C#, 16
	intensity $c7
	note C#, 16
	intensity $f
	arp $7, $c
	note F_, 16
	intensity $c7
	note F#, 16
	intensity $f
	note F_, 16
	intensity $cf
	note F_, 10
	arp $0, $0
	note __, 6
	jumpchannel .loop

.sub1
	dutycycle $0
	intensity $81
	vibrato $0, $0
	octave 5
	note F_, 2
	note F_, 4
	note F#, 2
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	octave 3
	endchannel

.sub2
	dutycycle $0
	intensity $81
	vibrato $0, $0
	arp $0, $0
	octave 5
	note F_, 2
	note F_, 2
	stereopanning $f
	octave 6
	note F_, 2
	stereopanning $f0
	octave 5
	note F_, 2
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	octave 3
	endchannel

.sub3
	dutycycle $0
	intensity $81
	vibrato $0, $0
	arp $0, $0
	stereopanning $f
	octave 5
	note F_, 2
	note F_, 2
	stereopanning $f0
	octave 6
	note F_, 2
	stereopanning $f
	octave 5
	note F_, 2
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	stereopanning $f0
	octave 3
	endchannel

.sub4
	dutycycle $0
	intensity $81
	vibrato $0, $0
	arp $0, $0
	octave 5
	note F_, 2
	note F_, 2
	stereopanning $f
	octave 6
	note F#, 2
	stereopanning $f0
	octave 5
	note F#, 2
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	octave 3
	endchannel

Music_VictoryRoad_Ch2:
	sound_duty 3, 3, 3, 3
	notetype $c, $1c
	vibrato $1, $23
	stereopanning $f
.loop
	note __, 16
	loopchannel 16, .loop
	forceoctave $17
	intensity $1c
	octave 4
	note C_, 8
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	callchannel Music_VictoryRoad_Common_1
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	forceoctave $18
	callchannel Music_VictoryRoad_Common_2
	forceoctave $17
	sound_duty 3, 3, 3, 3
	octave 4
	note C#, 8
	callchannel Music_VictoryRoad_Common_1
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	callchannel Music_VictoryRoad_Common_1
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	forceoctave $18
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	octave 4
	note C_, 8
	forceoctave $1a
	callchannel Music_VictoryRoad_Common_1
	forceoctave $0
	sound_duty 3, 3, 3, 3
	note F_, 8
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	note F#, 8
	callchannel Music_VictoryRoad_Common_1
	sound_duty 3, 3, 3, 3
	note F_, 8
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	note F#, 8
	forceoctave $1
	callchannel Music_VictoryRoad_Common_1
	forceoctave $0
	note F_, 8
	callchannel Music_VictoryRoad_Common_2
	sound_duty 3, 3, 3, 3
	note F#, 8
	dutycycle $0
	intensity $81
	vibrato $0, $0
	octave 5
	note F#, 2
	note F#, 4
	note F#, 2
	note __, 4
	octave 6
	note F_, 4
	octave 5
	note F_, 2
	note F_, 4
	note F_, 2
	note __, 4
	octave 6
	note F_, 4
	note F_, 2
	note __, 10
	sound_duty 3, 3, 2, 2
	intensity $c2
	octave 3
	note C_, 2
	note F_, 4
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note __, 2
	note C_, 14
	note C_, 2
	note F_, 4
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note __, 2
	note A_, 14
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	note C_, 4
	note C_, 2
	note D_, 6
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 8
	note D#, 2
	note D#, 4
	note D#, 2
	note F_, 4
	octave 3
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 10
	octave 4
	note F_, 4
	octave 3
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	octave 3
	note F#, 2
	note __, 2
	octave 4
	intensity $c3
	note C#, 6
	intensity $c4
	note F#, 4
	intensity $c5
	note F_, 8
	octave 3
	note F_, 8
	octave 4
	note C_, 8
	note F#, 8
	intensity $f
	note F_, 16
	intensity $cf
	note F_, 10
	note __, 6
	sound_duty 3, 3, 3, 3
	intensity $f
	vibrato $1, $23
	octave 3
	note G#, 16
	intensity $c7
	note G#, 16
	intensity $f
	note G_, 16
	intensity $c7
	note G_, 16
	intensity $f
	note F#, 16
	intensity $c7
	note F#, 16
	intensity $f
	note F_, 16
	intensity $c7
	note F_, 16
	note __, 4
	intensity $a3
	vibrato $9, $11
	octave 2
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note __, 2
	note D_, 14
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note __, 2
	note A#, 4
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	note D#, 2
	note F_, 4
	note C_, 2
	note F_, 4
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 4
	note C#, 2
	note F#, 4
	note C#, 2
	note F#, 2
	note C_, 2
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 2
	note __, 6
	jumpchannel .loop

Music_VictoryRoad_Common_1:
	dutycycle $0
	intensity $81
	vibrato $0, $0
	octave 5
	note F_, 2
	note F_, 4
	note F_, 2
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	octave 3
	endchannel

Music_VictoryRoad_Common_2:
	dutycycle $0
	intensity $81
	vibrato $0, $0
	octave 6
	note __, 4
	note F_, 4
	dutycycle $1
	intensity $1c
	vibrato $1, $23
	octave 3
	endchannel

Music_VictoryRoad_Ch3:
	notetype $c, $19
.loop
	octave 2
	callchannel .sub
	note G_, 4
	note __, 4
	callchannel .sub
	note A#, 4
	note __, 4
	note F_, 6
	octave 3
	note C_, 6
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	note __, 2
	octave 2
	note G_, 6
	note __, 4
	note F_, 6
	octave 3
	note C_, 6
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	note __, 2
	note D#, 4
	note __, 2
	note E_, 4
	note F_, 4
	note C_, 2
	note F_, 4
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 4
	note C#, 2
	note F#, 4
	note C#, 2
	note F#, 2
	note C_, 2
	note F_, 7
	note __, 1
	note F_, 7
	note __, 1
	note F_, 7
	note __, 1
	note F_, 2
	note __, 6
	loopchannel 3, .loop
	octave 2
.repeat1
	note F_, 1
	note __, 1
	loopchannel 100, .repeat1
	octave 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
.repeat2
	note F_, 1
	note __, 1
	loopchannel 12, .repeat2
	note F_, 1
	note __, 7
	jumpchannel .loop

.sub
	note C_, 6
	note G_, 2
	note __, 4
	note D_, 12
	note __, 8
	note C_, 6
	note G_, 2
	note __, 4
	note G#, 8
	note __, 4
	endchannel

Music_VictoryRoad_Ch4:
	notetype $c
	togglenoise $5
.loop
	note C_, 2
	note A#, 2
	note A#, 2
	note A#, 2
	loopchannel 31, .loop
	note C_, 2
	note __, 6
	jumpchannel .loop
