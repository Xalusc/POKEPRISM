	text "LIZARD" ; species name
	done
	dw 6, 85 ; height, weight

	db .page2 - .page1
.page1
	ctxt "If it's healthy,"
	next "the flame on the"
	next "tip of its tail"
	done
.page2
	ctxt "will burn vigor-"
	next "ously, even if it"
	next "gets a bit wet."
	done
