	ctxt "SKY HIGH" ; species name
	done
	dw 70, 2065 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It cannot be seen"
	next "from ground level"
	next "since it lives"
	done
.page2
	ctxt "far up above the"
	next "clouds in the"
	next "ozone layer."
	done