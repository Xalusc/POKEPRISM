	ctxt "POISON GAS" ; species name
	done
	dw 12, 95 ; height, weight

	db .page2 - .page1
.page1
	ctxt "When it inhales"
	next "poisonous gases"
	next "from garbage, its"
	done
.page2
	ctxt "body expands, and"
	next "its insides smell"
	next "much worse."
	done
