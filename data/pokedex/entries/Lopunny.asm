	ctxt "RABBIT" ; species name
	done
	dw 12, 333 ; height, weight

	db .page2 - .page1
.page1
	ctxt "The ears appear to"
	next "be delicate. If"
	next "they are touched"
	done
.page2
	ctxt "roughly, it kicks"
	next "with its graceful"
	next "legs."
	done
