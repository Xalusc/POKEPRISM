Music_Mom: ; f6bf2
	channelcount 3
	channel 2, Music_Mom_Ch2
	channel 3, Music_Mom_Ch3
	channel 4, Music_Mom_Ch4

Music_Mom_Ch2: ; f6bfb
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $2
	notetype $6, $b3
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G#, 1
	note A_, 1
	note B_, 8
Music_Mom_branch_f6c0e: ; f6c0e
	notetype $c, $b1
	note __, 4
	octave 3
	note C#, 6
	note D_, 4
	note C_, 2
	note __, 2
	note C#, 6
	octave 2
	note E_, 4
	note A#, 2
	note B_, 2
	jumpchannel Music_Mom_branch_f6c0e

Music_Mom_Ch3: ; f6c20
	stereopanning $f0
	notetype $6, $25
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
	note G#, 1
	note E_, 8
	intensity $23
Music_Mom_branch_f6c2e: ; f6c2e
	octave 2
	note A_, 2
	note __, 6
	octave 4
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 8
	note D#, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 2
	note __, 6
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 6
	note C#, 4
	note D_, 2
	note __, 2
	jumpchannel Music_Mom_branch_f6c2e

Music_Mom_Ch4: ; f6c51
	togglenoise $3
	notetype $c
	note __, 6
Music_Mom_branch_f6c56: ; f6c56
	note D#, 1
	note __, 1
	note F#, 2
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 4
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 2
	note D#, 1
	note __, 1
	jumpchannel Music_Mom_branch_f6c56
