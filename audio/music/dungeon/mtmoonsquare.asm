Music_MtMoonSquare:
	channelcount 2
	channel 1, Music_MtMoonSquare_Ch1
	channel 2, Music_MtMoonSquare_Ch2

Music_MtMoonSquare_Ch1:
	tempo 112
	volume $77
	dutycycle $2
	tone $0001
	note __, 1
	notetype $c, $44
.loop
	callchannel Music_MtMoonSquare_Common_1
	callchannel Music_MtMoonSquare_Common_1
	callchannel Music_MtMoonSquare_Common_2
	callchannel Music_MtMoonSquare_Common_2
	callchannel Music_MtMoonSquare_Common_3
	callchannel Music_MtMoonSquare_Common_3
	callchannel Music_MtMoonSquare_Common_1
	callchannel Music_MtMoonSquare_Common_1
	jumpchannel .loop

Music_MtMoonSquare_Ch2:
	dutycycle $2
	vibrato $18, $24
.loop
	notetype $c, $82
	callchannel Music_MtMoonSquare_Common_1
	intensity $62
	callchannel Music_MtMoonSquare_Common_1
	intensity $82
	callchannel Music_MtMoonSquare_Common_2
	intensity $62
	callchannel Music_MtMoonSquare_Common_2
	intensity $82
	callchannel Music_MtMoonSquare_Common_3
	intensity $62
	callchannel Music_MtMoonSquare_Common_3
	intensity $82
	callchannel Music_MtMoonSquare_Common_1
	intensity $62
	callchannel Music_MtMoonSquare_Common_1
	jumpchannel .loop

Music_MtMoonSquare_Common_1:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	endchannel

Music_MtMoonSquare_Common_2:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	endchannel

Music_MtMoonSquare_Common_3:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	endchannel
