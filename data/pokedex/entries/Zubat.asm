	ctxt "BAT" ; species name
	done
	dw 8, 75 ; height, weight

	db .page2 - .page1
.page1
	ctxt "During the day, it"
	next "gathers with"
	next "others and hangs"
	done
.page2
	ctxt "from the ceilings"
	next "of old buildings"
	next "and caves."
	done
