	text "MOUSE" ; species name
	done
	dw 8, 300 ; height, weight

	db .page2 - .page1
.page1
	ctxt "If its electric"
	next "pouches run empty,"
	next "it raises its tail"
	done
.page2
	ctxt "to gather electri-"
	next "city from the"
	next "atmosphere."
	done
