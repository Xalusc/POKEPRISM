	ctxt "SCORPION" ; species name
	done
	dw 8, 120 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It lives in arid"
	next "lands. It buries"
	next "itself in sand and"
	done
.page2
	ctxt "lies in wait for"
	next "unsuspecting prey."
	done
