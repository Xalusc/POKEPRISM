	ctxt "IRON ARMOR" ; species name
	done
	dw 21, 3600 ; height, weight

	db .page2 - .page1
.page1
	ctxt "You can tell its"
	next "age by the length"
	next "of its iron horns."
	done
.page2
	ctxt "It claims an"
	next "entire mountain"
	next "as its territory."
	done