	text "BECKON" ; species name
	done
	dw 16, 306 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Its body is"
	next "hollow. It is said"
	next "that those who"
	done
.page2
	ctxt "look into its body"
	next "are sucked into"
	next "the void."
	done
