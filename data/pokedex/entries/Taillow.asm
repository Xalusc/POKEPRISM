	ctxt "SWALLOW" ; species name
	done
	dw 3, 23 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It has a gutsy"
	next "spirit that makes"
	next "it bravely take on"
	done
.page2
	ctxt "tough foes. It"
	next "flies in search of"
	next "warm climates."
	done
