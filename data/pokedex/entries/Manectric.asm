	ctxt "DISCHARGE" ; species name
	done
	dw 15, 402 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Its nest can be"
	next "found where a"
	next "thunderbolt hits."
	done
.page2
	ctxt "It is discharging"
	next "electricity from"
	next "its mane."
	done