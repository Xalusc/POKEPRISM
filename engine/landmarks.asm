GetCurrentLandmark::
	ld hl, wMapGroup ; wMapGroup is one byte before wMapNumber
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call GetWorldMapLocation
	assert SPECIAL_MAP == 0
	and a
	ret nz
	ld hl, wBackupMapGroup ; wBackupMapGroup is one byte before wBackupMapNumber
	ld a, [hli]
	ld b, a
	ld c, [hl]
	jp GetWorldMapLocation

GetLandmarkCoords::
; Return coordinates (d, e) of landmark e.
	ld a, BANK(wTownMapLandmarks)
	call StackCallInWRAMBankA
	; end of function

	set 7, e
	lb hl, 0, 0 ; Y, X
	ld bc, wTownMapLandmarks
.loop
	ld a, b
	cp HIGH(wTownMapLandmarksEnd)
	jr nz, .continue
	ld a, c
	cp LOW(wTownMapLandmarksEnd)
	jr z, .notFound
.continue
	ld a, [bc]
	cp e
	jr z, .found
	inc bc
	ld a, l
	inc l
	cp (LANDMARK_MAP_WIDTH - 1)
	jr nz, .loop
.nextRow
	inc h
	xor a
	ld l, a
	jr .loop
.found
	add hl, hl
	add hl, hl
	add hl, hl
	lb bc, $24, $14	; XXX get rid of magic values
	add hl, bc
	ld d, h
.notFound ; in the notFound code path, L = 0. these are off-screen coords
	ld e, l
	ret

GetLandmarkName::
; Copy the name of landmark e to wStringBuffer1.
	push hl
	push de
	push bc

GetLandmarkNameSkipPush::
	ld l, e
	ld h, 0
	add hl, hl
	ld de, LandmarkNames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wStringBuffer1
	ld bc, 18
	rst CopyBytes
	jr LandmarkPopOffBCDEHLAndReturn

GetLandmarkByCoords::
; Return ID of landmark (d, e) region c in e. $ff for not found landmark
	ld a, BANK(wTownMapLandmarks)
	call StackCallInWRAMBankA
	; end of function

	ld a, d ; align to grid
	and $f8
	sub $20
	ld d, a

	ld a, e
	and $f8
	sub $10
	ld e, a

	srl d
	rr e
	srl d
	rr e
	srl d
	rr e

	ld a, d
	ld hl, wTownMapLandmarks
	ld bc, LANDMARK_MAP_WIDTH
	rst AddNTimes
	xor a
	ld d, a
	add hl, de
	ld a, [hl]
	res 7, a
	ld e, a
	ret

GetLandmarkNameByCoords::
; Copy the name of landmark on (d, e) to wStringBuffer1. If no such landmark, clear buffer.
	push hl
	push de
	push bc

	ld a, "@"
	ld [wStringBuffer1], a

	ld a, [wTownMapCursorX]
	and a
	jr nz, .skip
	call GetCurrentLandmark
	ld e, a
	jr GetLandmarkNameSkipPush

.skip
	call GetLandmarkByCoords
	ld a, e
	cp $7f ; terminator
	jr nz, GetLandmarkNameSkipPush
LandmarkPopOffBCDEHLAndReturn:	; used for jr instead of jp
	jp PopOffBCDEHLAndReturn

RegionCheck::
; Checks the region the player is currently in and stores it in e
; Naljo: 0
; Rijon: 1
; Johto: 2
; Kanto: 3
; Sevii: 4
; Tunod: 5
; Mystery Zone: 6
	call GetCurrentLandmark
	ld e, REGION_MYSTERY
	cp $ff
	ret z ; landmark ID of $ff defaults to Mystery Zone
	ld e, REGION_NALJO ; 0
	ld hl, .Thresholds
.loop
	cp [hl]
	ret c
	inc e
	inc hl
	jr .loop

.Thresholds:
	db RIJON_LANDMARK
	db JOHTO_LANDMARK
	db KANTO_LANDMARK
	db SEVII_LANDMARK
	db TUNOD_LANDMARK
	db MYSTERY_LANDMARK
	db $ff

LoadTownMapLandmarks:
	ld a, BANK(wTownMapLandmarks)
	call StackCallInWRAMBankA
	; end of function

	ld a, [wTownMapRegion]
	ld e, a
	ld d, 0
	ld hl, RegionLandmarks
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, BANK(RegionLandmarks)
	ld de, wTownMapLandmarks
	jp FarDecompress

RegionLandmarks:
	dw NaljoLandmarks
	dw RijonLandmarks
	dw JohtoLandmarks
	dw KantoLandmarks
	dw SeviiLandmarks
	dw TunodLandmarks

NaljoLandmarks: INCBIN "data/landmarks/naljo.bin.lz"
RijonLandmarks: INCBIN "data/landmarks/rijon.bin.lz"
JohtoLandmarks: INCBIN "data/landmarks/johto.bin.lz"
KantoLandmarks: INCBIN "data/landmarks/kanto.bin.lz"
SeviiLandmarks: INCBIN "data/landmarks/sevii.bin.lz"
TunodLandmarks: INCBIN "data/landmarks/tunod.bin.lz"

LandmarkNames:
	dw SpecialMapName

	dw HeathVillageName
	dw Route69Name
	dw Route70Name
	dw CaperRidgeName
	dw Route71WestName
	dw Route71EastName
	dw Route72Name
	dw OxalisCityName
	dw Route73Name
	dw MoundCaveName
	dw SpurgeCityName
	dw Route74Name
	dw Route75Name
	dw LaurelCityName
	dw MagikarpCavernsName
	dw Route76Name
	dw LaurelForestName
	dw ToreniaCityName
	dw Route83Name
	dw Route77Name
	dw MilosCatacombsName
	dw PhaceliaTownName
	dw BattleTowerName
	dw Route78Name
	dw Route79Name
	dw SaxifrageIslandName
	dw Route80Name
	dw Route81Name
	dw ProvincialParkName
	dw FirelightCavernsName
	dw Route85Name
	dw NaljoRuinsName
	dw ClathriteTunnelName
	dw Route84Name
	dw PhloxTownName
	dw AcquaMinesName
	dw Route82Name
	dw AcaniaDockName
	dw Route68Name
	dw NaljoBorderName
	dw Route86Name
	dw ChampionIsleName
	dw TunnelName
	dw Route87Name
	dw FarawayIslandName
	dw SpecialMapName
	dw SpecialMapName
	dw SpecialMapName

	dw SeashoreCityName
	dw Route53Name
	dw GravelTownName
	dw MersonCaveName
	dw Route54Name
	dw MersonCityName
	dw Route55Name
	dw RijonUnderground
	dw Route52Name
	dw HaywardCityName
	dw Route64Name
	dw Route51Name
	dw Route50Name
	dw Route49Name
	dw OwsauriCityName
	dw Route66Name
	dw Route48Name
	dw Route63Name
	dw SilkTunnelName
	dw MoragaTownName
	dw Route60Name
	dw JaeruCityName
	dw Route59Name
	dw SilphWarehouseName
	dw BotanCityName
	dw HauntedForestName
	dw PowerPlantName
	dw Route58Name
	dw CastroValleyName
	dw CastroMansionName
	dw CastroForestName
	dw Route62Name
	dw Route61Name
	dw Route57Name
	dw Route56Name
	dw EagulouCityName
	dw EagulouParkName
	dw Route65Name
	dw RijonLeagueName
	dw Route67Name
	dw MtBoulderName
	dw SenecaCavernsName
	dw SouthRijonGateName

	dw Route47Name
	dw IlexForestName
	dw AzaleaTownName
	dw Route34Name
	dw GoldenrodCityName
	dw GoldenrodCapeName

	dw SaffronCityName

	dw EmberBrookName
	dw MtEmberName
	dw KindleRoadName
	dw OneIslandName
	dw TreasureBeachName
	dw TreasureCoveName

	dw TunodWaterwayName
	dw SouthSoutherlyName
	dw SoutherlyCityName
	dw EspoClearingName
	dw EspoForestName
	dw OlcanChineName
	dw OlcanIsleName

	dw MysteryZoneName

SpecialMapName:      db "SPECIAL@"

CaperRidgeName:      db "CAPER RIDGE@"
OxalisCityName:      db "OXALIS CITY@"
SpurgeCityName:      db "SPURGE CITY@"
HeathVillageName:    db "HEATH VILLAGE@"
LaurelCityName:      db "LAUREL CITY@"
ToreniaCityName:     db "TORENIA CITY@"
PhaceliaTownName:    db "PHACELIA TOWN@"
AcaniaDockName:      db "ACANIA DOCK@"
SaxifrageIslandName: db "SAXIFRAGE ISLAND@"
PhloxTownName:       db "PHLOX TOWN@"
MoundCaveName:       db "MOUND CAVE@"
MagikarpCavernsName: db "MAGIKARP CAVERNS@"
LaurelForestName:    db "LAUREL FOREST@"
MilosCatacombsName:  db "MILOS CATACOMBS@"
ProvincialParkName:  db "PROVINCIAL PARK@"
FirelightCavernsName:db "FIRELIGHT CAVERNS@"
NaljoRuinsName:      db "NALJO RUINS@"
ClathriteTunnelName: db "CLATHRITE TUNNEL@"
AcquaMinesName:      db "ACQUA MINES@"
NaljoBorderName:     db "NALJO BORDER@"
ChampionIsleName:    db "BATTLE ARCADE@"
TunnelName:          db "TUNNEL@"
BattleTowerName:     db "BATTLE TOWER@"
SeashoreCityName:    db "SEASHORE CITY@"
GravelTownName:      db "GRAVEL TOWN@"
MersonCityName:      db "MERSON CITY@"
HaywardCityName:     db "HAYWARD CITY@"
OwsauriCityName:     db "OWSAURI CITY@"
MoragaTownName:      db "MORAGA TOWN@"
JaeruCityName:       db "JAERU CITY@"
BotanCityName:       db "BOTAN CITY@"
CastroValleyName:    db "CASTRO VALLEY@"
EagulouCityName:     db "EAGULOU CITY@"
RijonLeagueName:     db "RIJON LEAGUE@"
MersonCaveName:      db "MERSON CAVE@"
RijonUnderground:    db "RIJON UNDERGROUND@"
SilkTunnelName:      db "SILK TUNNEL@"
PowerPlantName:      db "POWER PLANT@"
SilphWarehouseName:  db "SILPH WAREHOUSE@"
HauntedForestName:   db "HAUNTED FOREST@"
CastroMansionName:   db "CASTRO MANSION@"
CastroForestName:    db "CASTRO FOREST@"
RijonHideoutName:    db "RIJON HIDEOUT@"
EagulouParkName:     db "EAGULOU PARK@"
MtBoulderName:       db "MT. BOULDER@"
SenecaCavernsName:   db "SENECA CAVERNS@"

AzaleaTownName:      db "AZALEA TOWN@"
GoldenrodCityName:   db "GOLDENROD CITY@"
GoldenrodCapeName:   db "GOLDENROD CAPE@"
IlexForestName:      db "ILEX FOREST@"
SlowpokeWellName:    db "SLOWPOKE WELL@"
SaffronCityName:     db "SAFFRON CITY@"
EmberBrookName:      db "EMBER BROOK@"
MtEmberName:         db "MT. EMBER@"
KindleRoadName:      db "KINDLE ROAD@"
OneIslandName:       db "ONE ISLAND@"
TreasureBeachName:   db "TREASURE BEACH@"
TreasureCoveName:    db "TREASURE COVE@"
TunodWaterwayName:   db "TUNOD WATERWAY@"
SouthSoutherlyName:  db "SOUTH SOUTHERLY@"
SoutherlyCityName:   db "SOUTHERLY CITY@"
EspoClearingName:    db "ESPO CLEARING@"
EspoForestName:      db "ESPO FOREST@"
OlcanChineName:      db "OLCAN CHINE@"
OlcanIsleName:       db "OLCAN ISLE@"
MysteryZoneName:     db "MYSTERY ZONE@"

Route34Name:         db "ROUTE 34@"
Route47Name:         db "OLD ROUTE 47@"
Route48Name:         db "OLD ROUTE 48@"
Route49Name:         db "ROUTE 49@"
Route50Name:         db "ROUTE 50@"
Route51Name:         db "ROUTE 51@"
Route52Name:         db "ROUTE 52@"
Route53Name:         db "ROUTE 53@"
Route54Name:         db "ROUTE 54@"
Route55Name:         db "ROUTE 55@"
Route56Name:         db "ROUTE 56@"
Route57Name:         db "ROUTE 57@"
Route58Name:         db "ROUTE 58@"
Route59Name:         db "ROUTE 59@"
Route60Name:         db "ROUTE 60@"
Route61Name:         db "ROUTE 61@"
Route62Name:         db "ROUTE 62@"
Route63Name:         db "ROUTE 63@"
Route64Name:         db "ROUTE 64@"
Route65Name:         db "ROUTE 65@"
Route66Name:         db "ROUTE 66@"
Route67Name:         db "ROUTE 67@"
Route68Name:         db "ROUTE 68@"
Route69Name:         db "ROUTE 69@"
Route70Name:         db "ROUTE 70@"
Route71EastName:     db "ROUTE 71@"
Route71WestName:     db "ROUTE 71@"
Route72Name:         db "ROUTE 72@"
Route73Name:         db "ROUTE 73@"
Route74Name:         db "ROUTE 74@"
Route75Name:         db "ROUTE 75@"
Route76Name:         db "ROUTE 76@"
Route77Name:         db "ROUTE 77@"
Route78Name:         db "ROUTE 78@"
Route79Name:         db "ROUTE 79@"
Route80Name:         db "ROUTE 80@"
Route81Name:         db "ROUTE 81@"
Route82Name:         db "ROUTE 82@"
Route83Name:         db "ROUTE 83@"
Route84Name:         db "ROUTE 84@"
Route85Name:         db "ROUTE 85@"
Route86Name:         db "ROUTE 86@"
Route87Name:         db "ROUTE 87@"
FarawayIslandName:   db "FARAWAY ISLAND@"
SouthRijonGateName:  db "SOUTH RIJON GATE@"
