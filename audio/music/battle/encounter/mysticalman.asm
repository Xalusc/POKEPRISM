Music_LookMysticalMan:
	channelcount 4
	channel 1, Music_LookMysticalMan_Ch1
	channel 2, Music_LookMysticalMan_Ch2
	channel 3, Music_LookMysticalMan_Ch3
	channel 4, Music_LookMysticalMan_Ch4

Music_LookMysticalMan_Ch1:
	tempo 136
	volume $77
	vibrato $a, $34
	tone $0001
	stereopanning $f
	notetype $c, $b3
	note __, 8
.loop
	dutycycle $3
	notetype $6, $96
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 2
	note F#, 2
	note __, 4
	note F#, 2
	note __, 9
	note __, 9
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 2
.repeat1
	note E_, 2
	note __, 4
	note E_, 2
	note __, 9
	note __, 9
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 2
	loopchannel 2, .repeat1
	note E_, 2
	note __, 3
	note F_, 1
	note F#, 4
	note __, 4
	note E_, 4
	note __, 4
	note C#, 4
	dutycycle $2
	callchannel .sub
	octave 4
	note C#, 2
	note __, 2
	octave 3
	note B_, 2
	note __, 2
	note A#, 2
	octave 4
	note C#, 6
	note __, 4
	octave 3
	note F#, 4
	note __, 4
	note E_, 4
	callchannel .sub
	octave 4
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 3
	note A#, 2
	note B_, 6
	note A#, 4
	note F#, 4
	intensity $a5
	dutycycle $0
	octave 4
	note F#, 2
	note A#, 6
	dutycycle $2
	intensity $72
.repeat2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	loopchannel 4, .repeat2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
.repeat3
	octave 5
	note D_, 2
	octave 4
	note G#, 2
	note E_, 2
	octave 3
	note B_, 2
	loopchannel 4, .repeat3
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note F#, 2
	note C#, 2
	octave 3
	note A#, 2
	note F#, 2
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	note E_, 2
	note F#, 2
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note F#, 2
	note A#, 2
	jumpchannel .loop

.sub
	note D_, 16
	octave 4
	note D_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F#, 2
	note D_, 6
	octave 3
	note E_, 16
	note B_, 2
	note __, 2
	octave 4
	note C#, 2
	note __, 2
	note D_, 2
	octave 3
	note B_, 6
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 2
	note C#, 6
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 3
	note B_, 2
	note A_, 6
	endchannel

Music_LookMysticalMan_Ch2:
	dutycycle $3
	vibrato $a, $34
	notetype $c, $b3
	note __, 8
.loop
	stereopanning $f0
	notetype $6, $b8
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 2
	note B_, 2
	note __, 4
	note B_, 2
	note __, 6
	stereopanning $ff
	note B_, 8
	note A_, 4
	stereopanning $f0
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 2
	note G#, 2
	note __, 4
	note G#, 2
	note __, 6
	stereopanning $ff
	note F#, 8
	note G#, 4
	stereopanning $f0
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note __, 4
	note A_, 2
	note __, 6
	stereopanning $ff
	note A_, 8
	note G_, 4
	stereopanning $f0
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 2
	note F#, 2
	note __, 3
	note A_, 1
	note A#, 4
	note __, 4
	note F#, 4
	note __, 4
	note E_, 4
	callchannel .sub1
	note F#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 2
	note E_, 6
	callchannel .sub2
	callchannel .sub1
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note D_, 6
	callchannel .sub2
	notetype $c, $b7
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 1
	note C#, 2
	note __, 1
	octave 3
	note B_, 16
	note __, 2
	note B_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	note C#, 2
	note __, 1
	octave 3
	note B_, 2
	note __, 1
	note A#, 16
	note __, 2
	jumpchannel .loop

.sub1
	note B_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	note F#, 2
	note A_, 6
	note B_, 8
	note __, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	note D_, 2
	note C#, 6
	octave 4
	note B_, 12
	intensity $88
	note A#, 1
	note A_, 1
	intensity $68
	note G#, 1
	note F#, 1
	intensity $b8
	octave 5
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note B_, 2
	note A_, 6
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note E_, 6
	endchannel

.sub2
	note C#, 8
	intensity $88
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	intensity $68
	note G#, 1
	note F#, 1
	intensity $48
	note E_, 1
	note C#, 1
	note __, 1
	intensity $b8
	endchannel

Music_LookMysticalMan_Ch3:
	notetype $6, $16
	note __, 16
.loop
	octave 2
	note B_, 4
	octave 3
	note A_, 2
	note __, 2
	note F#, 4
	octave 2
	note B_, 1
	note __, 1
	note B_, 4
	note A_, 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note A_, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note E_, 4
	note G#, 2
	note __, 2
	note B_, 4
	note E_, 1
	note __, 1
	note E_, 6
	octave 2
	note A#, 2
	note B_, 6
	note G#, 4
	note A_, 4
	octave 3
	note G_, 2
	note __, 2
	note E_, 4
	octave 2
	note A_, 1
	note __, 1
	note A_, 4
	note G_, 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
.repeat
	octave 2
	note F#, 4
	note A#, 2
	note __, 2
	octave 3
	note C#, 4
	octave 2
	note F#, 1
	note __, 1
	note F#, 6
	note G#, 4
	note __, 4
	note A#, 4
	note B_, 4
	octave 3
	note A_, 2
	note __, 2
	note F#, 4
	octave 2
	note B_, 1
	note __, 1
	note B_, 6
	octave 3
	note D_, 2
	note __, 2
	note F#, 2
	note D_, 6
	note E_, 4
	note G#, 2
	note __, 2
	note B_, 4
	note E_, 1
	note __, 1
	note E_, 6
	note D_, 2
	note __, 2
	octave 2
	note B_, 2
	note G#, 6
	note A_, 4
	octave 3
	note C#, 2
	note __, 2
	note E_, 4
	octave 2
	note A_, 1
	note __, 1
	note A_, 6
	octave 3
	note E_, 4
	note C#, 2
	octave 2
	note E_, 6
	loopchannel 2, .repeat
	note F#, 4
	note A#, 2
	note __, 2
	octave 3
	note C#, 2
	note F#, 6
	octave 2
	note F#, 2
	note __, 2
	octave 3
	note C#, 4
	octave 2
	note A#, 2
	octave 3
	note F#, 6
	octave 2
	note B_, 4
	octave 3
	note B_, 4
	octave 2
	note B_, 4
	octave 3
	note F#, 2
	note A_, 6
	octave 2
	note B_, 4
	octave 3
	note F#, 4
	octave 2
	note B_, 4
	note A_, 4
	note __, 2
	note A#, 4
	note __, 2
	note B_, 6
	note __, 2
	note B_, 4
	note A_, 4
	note F#, 4
	note E_, 4
	octave 3
	note E_, 4
	octave 2
	note E_, 4
	note G#, 2
	octave 3
	note D_, 6
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note F#, 4
	note __, 2
	note E_, 4
	note __, 2
	note C#, 8
	octave 2
	note B_, 8
	note A#, 4
	jumpchannel .loop

Music_LookMysticalMan_Ch4:
	togglenoise $3
	notetype $c
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 1
	note D_, 1
.loop
	callchannel .sub
	note D#, 4
	note D_, 2
	note D#, 1
	note D_, 3
	note D_, 2
	note D#, 2
	note D_, 1
	note D_, 1
	loopchannel 2, .loop
	callchannel .sub
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 1
	note D_, 1
	note D_, 2
	note D#, 2
	note D_, 2
	note D_, 1
	note D_, 1
.repeat
	note D_, 2
	note D#, 2
	note D_, 3
	note D#, 1
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 3
	note D#, 1
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	loopchannel 2, .repeat
	jumpchannel .loop

.sub
	note D#, 4
	note D_, 3
	note D#, 3
	note D#, 2
	note D_, 4
	note D#, 4
	note D_, 3
	note D_, 3
	note D#, 2
	note D_, 4
	note D#, 4
	note D_, 3
	note D#, 3
	note D#, 2
	note D_, 4
	endchannel
