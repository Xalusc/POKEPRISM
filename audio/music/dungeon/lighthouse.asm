Music_Lighthouse:
	channelcount 4
	channel 1, Music_Lighthouse_Ch1
	channel 2, Music_Lighthouse_Ch2
	channel 3, Music_Lighthouse_Ch3
	channel 4, Music_Lighthouse_Ch4

Music_Lighthouse_Ch1:
	tempo 144
	volume $77
	dutycycle $3
	tone $0004
	vibrato $8, $45
	stereopanning $f
	notetype $c, $b3
.loop
	octave 3
	note C#, 8
	octave 2
	note F#, 2
	note G#, 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	note B_, 4
	note G#, 1
	note __, 7
	octave 3
	note C_, 4
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C_, 2
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C#, 8
	octave 2
	note C#, 2
	note F#, 2
	note G#, 2
	octave 3
	note C_, 2
	note D_, 2
	note C#, 2
	octave 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 2
	note G#, 1
	note __, 7
	octave 3
	note C_, 12
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	octave 3
	note C_, 1
	note __, 3
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note C#, 4
	note E_, 4
	note F#, 2
	note E_, 2
	note D#, 12
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 8
	note A_, 4
	octave 3
	note A_, 4
	note G#, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note G#, 12
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 8
	jumpchannel .loop

Music_Lighthouse_Ch2:
	dutycycle $3
	tone $0002
	vibrato $10, $45
	notetype $c, $c5
	octave 3
.loop
	note G#, 12
	note F#, 2
	note G#, 2
	note A_, 8
	octave 4
	note C#, 8
	note C_, 1
	note __, 7
	octave 3
	note G#, 16
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note G#, 12
	note F#, 2
	note G#, 2
	note A_, 8
	octave 4
	note C#, 8
	note C_, 1
	note __, 7
	note D#, 12
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	note D#, 1
	note __, 3
	octave 4
	note E_, 12
	note D#, 2
	note C#, 2
	octave 3
	note G#, 12
	note A#, 4
	note B_, 2
	octave 4
	note C#, 2
	callchannel .sub
	octave 4
	note E_, 12
	note D#, 2
	note C#, 2
	octave 3
	note G#, 12
	octave 4
	note C_, 4
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	callchannel .sub
	jumpchannel .loop

.sub
	note D#, 12
	octave 3
	note D#, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 8
	endchannel

Music_Lighthouse_Ch3:
	notetype $c, $19
	stereopanning $f0
.loop
	octave 2
	note G#, 2
	note __, 2
	note D#, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
.repeat1
	note __, 2
	note G#, 2
	note __, 2
	note D#, 2
	note __, 2
	note F#, 2
	note __, 2
	note A_, 2
	loopchannel 3, .repeat1
	octave 3
	note C_, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 2
.repeat2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	loopchannel 2, .repeat2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 3
	note D#, 2
	note F#, 2
.repeat3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 2
	note F_, 2
	note __, 2
	loopchannel 8, .repeat3
	jumpchannel .loop

Music_Lighthouse_Ch4:
	togglenoise $0
	notetype $c
.loop
	stereopanning $f
	note G#, 4
	note F_, 2
	note G#, 4
	note F_, 2
	note A_, 2
	note A#, 2
	stereopanning $ff
	note G#, 2
	note F_, 4
	note G#, 2
	note F_, 4
	note G#, 2
	note A_, 2
	jumpchannel .loop
