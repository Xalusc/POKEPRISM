	ctxt "CONTINENT" ; species name
	done
	dw 35, 9500 ; height, weight

	db .page2 - .page1
.page1
	ctxt "This legendary"
	next "#MON is said to"
	next "represent land."
	done
.page2
	ctxt "It went to sleep"
	next "after dueling"
	next "KYOGRE."
	done
