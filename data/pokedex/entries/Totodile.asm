	ctxt "BIG JAW" ; species name
	done
	dw 6, 95 ; height, weight

	db .page2 - .page1
.page1
	ctxt "This rough critter"
	next "chomps at any"
	next "moving object it"
	done
.page2
	ctxt "sees. Turning your"
	next "back on it is not"
	next "recommended."
	done
