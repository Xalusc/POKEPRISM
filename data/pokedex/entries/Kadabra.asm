	ctxt "PSI" ; species name
	done
	dw 13, 565 ; height, weight

	db .page2 - .page1
.page1
	ctxt "When it closes its"
	next "eyes, twice as"
	next "many alpha parti-"
	done
.page2
	ctxt "cles come out of"
	next "the surface of its"
	next "body."
	done
