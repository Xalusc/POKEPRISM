	ctxt "BALLOON" ; species name
	done
	dw 10, 120 ; height, weight

	db .page2 - .page1
.page1
	ctxt "The rich, fluffy"
	next "fur that covers"
	next "its body feels so"
	done
.page2
	ctxt "good that anyone"
	next "who feels it can't"
	next "stop touching it."
	done
