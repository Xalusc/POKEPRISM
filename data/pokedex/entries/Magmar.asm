	ctxt "SPITFIRE" ; species name
	done
	dw 13, 445 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It moves more"
	next "frequently in hot"
	next "areas. It can heal"
	done
.page2
	ctxt "itself by dipping"
	next "its wound into"
	next "lava."
	done
