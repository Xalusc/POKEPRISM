	text "EVOLUTION" ; species name
	done
	dw 3, 65 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Its ability to"
	next "evolve into many"
	next "forms allows it to"
	done
.page2
	ctxt "adapt smoothly"
	next "and perfectly to"
	next "any environment."
	done
