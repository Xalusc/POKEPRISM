	text "DOPEY" ; species name
	done
	dw 12, 360 ; height, weight

	db .page2 - .page1
.page1
	ctxt "It is always so"
	next "absent-minded that"
	next "it won't react,"
	done
.page2
	ctxt "even if its"
	next "flavorful tail is"
	next "bitten."
	done
