	ctxt "SCORPION" ; species name
	done
	dw 20, 425 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It dances silently"
	next "through the sky."
	next "When it approaches"
	done
.page2
	ctxt "prey, it can land"
	next "a critical hit in"
	next "an instant."
	done
