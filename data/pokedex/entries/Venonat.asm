	ctxt "INSECT" ; species name
	done
	dw 10, 300 ; height, weight

	db .page2 - .page1
.page1
	ctxt "The small bugs it"
	next "eats appear only"
	next "at night, so it"
	done
.page2
	ctxt "sleeps in a hole"
	next "in a tree until"
	next "night falls."
	done