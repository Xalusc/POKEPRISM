	ctxt "COAL" ; species name
	done
	dw 5, 804 ; height, weight

	db .page2 - .page1
.page1
	ctxt "You find abandoned"
	next "coal mines full of"
	next "them."
	done
.page2
	ctxt "They always dig"
	next "tirelessly in"
	next "search of coal."
	done
