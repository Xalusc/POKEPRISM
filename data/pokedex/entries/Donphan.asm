	text "ARMOR" ; species name
	done
	dw 11, 1200 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Because this"
	next "#MON's skin is"
	next "so tough, a normal"
	done
.page2
	ctxt "attack won't even"
	next "leave a scratch on"
	next "it."
	done
