	text "TURTLE" ; species name
	done
	dw 10, 225 ; height, weight

	db .page2 - .page1
.page1
	ctxt "Its long, furry"
	next "tail is a symbol"
	next "of longevity,"
	done
.page2
	ctxt "making it quite"
	next "popular among"
	next "older people."
	done
