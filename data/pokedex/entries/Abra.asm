	ctxt "PSI" ; species name
	done
	dw 9, 195 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It hypnotizes"
	next "itself so that it"
	next "can TELEPORT away"
	done
.page2
	ctxt "when it senses"
	next "danger, even"
	next "if it is asleep."
	done
