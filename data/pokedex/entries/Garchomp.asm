	ctxt "MACH" ; species name
	done
	dw 19, 950 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It flies at speeds"
	next "equal to a jet"
	next "fighter plane. It"
	done
.page2
	ctxt "never allows its"
	next "prey to escape."
	done
