Music_BattleTowerLobby:
	channelcount 4
	channel 1, Music_BattleTowerLobby_Ch1
	channel 2, Music_BattleTowerLobby_Ch2
	channel 3, Music_BattleTowerLobby_Ch3
	channel 4, Music_BattleTowerLobby_Ch4

Music_BattleTowerLobby_Ch1:
	tempo 152
	volume $77
	dutycycle $3
	tone $0001
	vibrato $8, $22
	stereopanning $f0
.loop
	notetype $c, $72
	octave 3
	note G#, 2
	intensity $73
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	intensity $72
	note F#, 2
	intensity $73
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note E_, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	intensity $72
	note G#, 2
	intensity $73
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	intensity $72
	note F#, 3
	intensity $73
	note D_, 1
	note E_, 2
	octave 3
	note B_, 2
	note G#, 2
	note E_, 2
	note G#, 2
	note B_, 2
	intensity $72
	note C#, 2
	intensity $73
	note D#, 2
	note E_, 2
	note C#, 1
	octave 2
	note B_, 1
	note A_, 4
	intensity $62
	note A_, 4
	intensity $72
	note B_, 2
	intensity $73
	octave 3
	note C#, 2
	note D#, 2
	note E_, 1
	note F#, 1
	note G#, 4
	intensity $62
	octave 2
	note G#, 4
	intensity $72
	note A_, 2
	intensity $73
	note B_, 2
	octave 3
	note C#, 2
	note D_, 1
	note E_, 1
	note D_, 2
	note E_, 2
	note F#, 2
	note A_, 2
	intensity $72
	note B_, 2
	intensity $73
	note B_, 4
	note A_, 1
	note G#, 1
	intensity $72
	note F#, 4
	intensity $75
	octave 2
	note B_, 4
	jumpchannel .loop

Music_BattleTowerLobby_Ch2:
	dutycycle $2
	vibrato $10, $34
	stereopanning $f
.loop
	notetype $c, $82
	octave 4
	note E_, 2
	note E_, 4
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note B_, 4
	note A_, 2
	note G#, 2
	note A_, 3
	note E_, 1
	octave 3
	note B_, 4
	intensity $65
	note F#, 4
	octave 2
	note B_, 4
	intensity $82
	octave 4
	note E_, 2
	note E_, 4
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note B_, 4
	note A_, 2
	note G#, 2
	note A_, 3
	note F#, 1
	intensity $87
	note G#, 12
	intensity $82
	octave 3
	note A_, 2
	intensity $84
	note A_, 4
	note F#, 1
	note G#, 1
	note A_, 4
	intensity $82
	note C#, 4
	octave 4
	note G#, 2
	intensity $84
	note G#, 4
	note F#, 1
	note G#, 1
	note E_, 4
	intensity $82
	octave 3
	note E_, 4
	octave 4
	note F#, 2
	intensity $84
	note F#, 4
	note A_, 1
	note G#, 1
	note A_, 4
	note D_, 4
	intensity $82
	note E_, 2
	intensity $84
	note E_, 4
	note F#, 1
	note E_, 1
	note D#, 4
	intensity $73
	octave 3
	note D#, 1
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
	jumpchannel .loop

Music_BattleTowerLobby_Ch3:
	notetype $c, $11
.loop
	callchannel .sub
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	callchannel .sub
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note D_, 2
	octave 2
	note F#, 2
	note A_, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	note A_, 2
	octave 3
	note D_, 2
	note F#, 2
	note E_, 2
	octave 2
	note B_, 2
	note E_, 2
	note B_, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note F#, 2
	jumpchannel .loop

.sub
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	endchannel

Music_BattleTowerLobby_Ch4:
	togglenoise $0
.loop
	notetype $c
	note __, 2
	note F_, 4
	note F_, 4
	note F_, 2
	note F_, 4
	jumpchannel .loop
