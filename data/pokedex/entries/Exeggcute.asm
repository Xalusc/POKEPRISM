	text "EGG" ; species name
	done
	dw 4, 25 ; height, weight

	db .page2 - .page1
.page1
	ctxt "If even one is"
	next "separated from the"
	next "group, the energy"
	done
.page2
	ctxt "bond between the"
	next "six will make them"
	next "rejoin instantly."
	done
