	text "BLIMP" ; species name
	done
	dw 12, 150 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It carries people"
	next "and #MON when"
	next "it flies. But"
	done
.page2
	ctxt "since it only"
	next "drifts, it can"
	next "end up anywhere."
	done
