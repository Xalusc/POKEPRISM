	ctxt "FLASH" ; species name
	done
	dw 5, 95 ; height, weight

	db .page2 - .page1
.page1
	ctxt "The extension and"
	next "contraction of its"
	next "muscles generates"
	done
.page2
	ctxt "electricity. It"
	next "glows when in"
	next "trouble."
	done
