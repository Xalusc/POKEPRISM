	ctxt "TINY BIRD" ; species name
	done
	dw 3, 20 ; height, weight

	db .page2 - .page1
.page1
	ctxt "To protect its"
	next "territory, it"
	next "flies around"
	done
.page2
	ctxt "ceaselessly,"
	next "making high-"
	next "pitched cries."
	done
