	ctxt "STRINGSPIT" ; species name
	done
	dw 5, 85 ; height, weight

	db .page2 - .page1
.page1
	ctxt "If prey becomes"
	next "ensnared in its"
	next "nest of spun"
	done
.page2
	ctxt "string, it waits"
	next "motionlessly until"
	next "it becomes dark."
	done
