	ctxt "MEGATON" ; species name
	done
	dw 14, 3000 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Its rock-like body"
	next "is so durable,"
	next "even high-powered"
	done
.page2
	ctxt "dynamite blasts"
	next "fail to scratch"
	next "its rugged hide."
	done
