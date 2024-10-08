const_value = $f1
	const MAPSETUP_WARP
	const MAPSETUP_CONTINUE
	const MAPSETUP_RELOADMAP
	const MAPSETUP_TELEPORT
	const MAPSETUP_DOOR
	const MAPSETUP_FALL
	const MAPSETUP_CONNECTION
	const MAPSETUP_LINKRETURN
	const MAPSETUP_TRAIN
	const MAPSETUP_SUBMENU
	const MAPSETUP_BADWARP
	const MAPSETUP_FLY
	const MAPSETUP_BATTLE_TOWER
	const MAPSETUP_RELOADMAPDATA

const_value = 1
	const MAPCALLBACK_TILES
	const MAPCALLBACK_OBJECTS
	const MAPCALLBACK_CMDQUEUE
	const MAPCALLBACK_SPRITES
	const MAPCALLBACK_NEWMAP

; Command descriptions from Condensation water's scripting compendium.

MACRO mapsetupcommand
\1SetupCommand::
	dba \1
	ENDM

MACRO mapsetup
	db (\1SetupCommand - MapSetupCommands) / 3
	ENDM

mapsetup_end EQUS "db $FF"
