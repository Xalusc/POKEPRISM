	ctxt "SCORPION" ; species name
	done
	dw 13, 615 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It has the power"
	next "in its clawed arms"
	next "to make scrap of a"
	done
.page2
	ctxt "car. The tips of"
	next "its claws release"
	next "poison."
	done
