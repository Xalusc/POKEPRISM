	text "WORM" ; species name
	done
	dw 3, 29 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It crawls into"
	next "foliage where it"
	next "camouflages itself"
	done
.page2
	ctxt "among leaves that"
	next "are the same color"
	next "as its body."
	done
