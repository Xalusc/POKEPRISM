	ctxt "METEORITE" ; species name
	done
	dw 10, 1680 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Because it turns"
	next "active on nights"
	next "of the full moon,"
	done
.page2
	ctxt "it is said to have"
	next "some link to the"
	next "lunar phases."
	done
