	ctxt "LIGHT" ; species name
	done
	dw 14, 615 ; height, weight

	db .page2 - .page1
.page1
	ctxt "When it gets dark,"
	next "the light from its"
	next "bright, shiny tail"
	done
.page2
	ctxt "can be seen from"
	next "far away on the"
	next "ocean's surface."
	done
