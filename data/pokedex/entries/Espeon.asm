	text "SUN" ; species name
	done
	dw 9, 265 ; height, weight

	db .page2 - .page1
.page1
	ctxt "The tip of its"
	next "forked tail"
	next "quivers when it is"
	done
.page2
	ctxt "predicting its"
	next "opponent's next"
	next "move."
	done
