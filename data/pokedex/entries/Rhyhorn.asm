	text "SPIKES" ; species name
	done
	dw 10, 1150 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It can remember"
	next "only one thing at"
	next "a time. Once it"
	done
.page2
	ctxt "starts rushing, it"
	next "forgets why it"
	next "started."
	done
