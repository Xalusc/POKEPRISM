	ctxt "FLYCATCHER" ; species name
	done
	dw 10, 64 ; height, weight

	db .page2 - .page1
.page1
	ctxt "When it's hungry,"
	next "it swings its"
	next "razor-sharp"
	done
.page2
	ctxt "leaves, slicing up"
	next "any unlucky object"
	next "nearby for food."
	done
