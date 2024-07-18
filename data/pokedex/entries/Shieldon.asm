	ctxt "SHIELD" ; species name
	done
	dw 5, 570 ; height, weight

	db .page2 - .page1
.page1
	ctxt "A #MON that"
	next "lived in jungles"
	next "around 100 million"
	done
.page2
	ctxt "years ago. Its"
	next "facial hide is"
	next "extremely hard."
	done
