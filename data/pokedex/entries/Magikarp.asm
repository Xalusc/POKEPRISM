	ctxt "FISH" ; species name
	done
	dw 9, 100 ; height, weight

	db .page2 - .page1
.page1
	ctxt "This weak and"
	next "pathetic #MON"
	next "gets easily pushed"
	done
.page2
	ctxt "along rivers when"
	next "there are strong"
	next "currents."
	done