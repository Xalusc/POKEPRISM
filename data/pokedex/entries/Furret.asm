	ctxt "LONG BODY" ; species name
	done
	dw 18, 325 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It lives in narrow"
	next "burrows that fit"
	next "its slim body. The"
	done
.page2
	ctxt "deeper the nests"
	next "go, the more maze-"
	next "like they become."
	done