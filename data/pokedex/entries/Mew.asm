	ctxt "NEW SPECIE" ; species name
	done
	dw 4, 40 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Because it can"
	next "learn any move,"
	next "some people began"
	done
.page2
	ctxt "research to see if"
	next "it is the ancestor"
	next "of all #MON."
	done
