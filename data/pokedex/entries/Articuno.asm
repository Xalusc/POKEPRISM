	text "FREEZE" ; species name
	done
	dw 17, 554 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Legendary bird"
	next "#MON. As it"
	next "flies through the"
	done
.page2
	ctxt "sky, it cools the"
	next "air, causing snow"
	next "to fall."
	done