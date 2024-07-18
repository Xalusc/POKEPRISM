	ctxt "BALLOON" ; species name
	done
	dw 4, 12 ; height, weight

	db .page2 - .page1
.page1
	ctxt "A #MON formed"
	next "by the spirits of"
	next "people and"
	done
.page2
	ctxt "#MON. It loves"
	next "damp, humid"
	next "seasons."
	done
