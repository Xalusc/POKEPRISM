	ctxt "MONITOR" ; species name
	done
	dw 19, 1194 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Very protective"
	next "of NALJO. It does"
	next "anything necessary"
	done
.page2
	ctxt "to prevent outsid-"
	next "ers from entering"
	next "NALJO."
	done
