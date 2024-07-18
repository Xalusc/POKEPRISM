	text "VIRTUAL" ; species name
	done
	dw 6, 325 ; height, weight

	db .page2 - .page1
.page1
	ctxt "This manmade"
	next "#MON evolved"
	next "from the latest"
	done
.page2
	ctxt "technology. It"
	next "may have unprog-"
	next "rammed reactions."
	done
