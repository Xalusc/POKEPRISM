	text "FOX" ; species name
	done
	dw 6, 99 ; height, weight

	db .page2 - .page1
.page1
	ctxt "As its body grows"
	next "larger, its six"
	next "warm tails become"
	done
.page2
	ctxt "more beautiful,"
	next "with a more luxur-"
	next "ious coat of fur."
	done
