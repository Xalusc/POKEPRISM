	ctxt "COCOON" ; species name
	done
	dw 7, 99 ; height, weight

	db .page2 - .page1
.page1
	ctxt "This is its pre-"
	next "evolved form. At"
	next "this stage, it can"
	done
.page2
	ctxt "only harden, so it"
	next "remains motionless"
	next "to avoid attack."
	done
