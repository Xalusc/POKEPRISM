	ctxt "WOOL" ; species name
	done
	dw 8, 133 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Because of its"
	next "rubbery, electric-"
	next "ity-resistant"
	done
.page2
	ctxt "skin, it can store"
	next "lots of electric-"
	next "ity in its fur."
	done
