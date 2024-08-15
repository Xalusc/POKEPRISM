UpdateItemDescription::
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	call SpeechTextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	; fallthrough

PrintItemDescription:
; Print the description for item [wCurSpecies] at de.

	ld a, [wCurSpecies]
	push de
	ld hl, ItemDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceText

ItemDescriptions:
	dw MasterballDesc
	dw UltraballDesc
	dw BrightpowderDesc
	dw GreatballDesc
	dw PokeballDesc
	dw CoalDesc
	dw BicycleDesc
	dw MoonStoneDesc
	dw AntidoteDesc
	dw BurnHealDesc
	dw IceHealDesc
	dw AwakeningDesc
	dw ParlyzHealDesc
	dw FullRestoreDesc
	dw MaxPotionDesc
	dw HyperPotionDesc
	dw SuperPotionDesc
	dw PotionDesc
	dw EscapeRopeDesc
	dw RepelDesc
	dw MaxElixirDesc
	dw FireStoneDesc
	dw ThunderStoneDesc
	dw WaterStoneDesc
	dw PoisonGuardDesc
	dw HPUpDesc
	dw ProteinDesc
	dw IronDesc
	dw CarbosDesc
	dw LuckyPunchDesc
	dw CalciumDesc
	dw RareCandyDesc
	dw XAccuracyDesc
	dw LeafStoneDesc
	dw MetalPowderDesc
	dw NuggetDesc
	dw PokeDollDesc
	dw FullHealDesc
	dw ReviveDesc
	dw MaxReviveDesc
	dw GuardSpecDesc
	dw SuperRepelDesc
	dw MaxRepelDesc
	dw DireHitDesc
	dw BurnGuardDesc
	dw FreshWaterDesc
	dw SodaPopDesc
	dw LemonadeDesc
	dw XAttackDesc
	dw FreezeGuardDesc
	dw XDefendDesc
	dw XSpeedDesc
	dw XSpAtkDesc
	dw CoinCaseDesc
	dw ItemfinderDesc
	dw HeartScaleDesc
	dw ExpShareDesc
	dw OldRodDesc
	dw GoodRodDesc
	dw SilverLeafDesc
	dw SuperRodDesc
	dw PPUpDesc
	dw EtherDesc
	dw MaxEtherDesc
	dw ElixirDesc
	dw CageCardDesc
	dw RijonPassDesc
	dw FerryTicketDesc
	dw CageCardDesc
	dw CageCardDesc
	dw CageCardDesc
	dw MoomooMilkDesc
	dw QuickClawDesc
	dw PechaBerryDesc
	dw GoldLeafDesc
	dw SoftSandDesc
	dw SharpBeakDesc
	dw CheriBerryDesc
	dw AspearBerryDesc
	dw RawstBerryDesc
	dw PoisonBarbDesc
	dw KingsRockDesc
	dw PersimBerryDesc
	dw ChestoBerryDesc
	dw RedApricornDesc
	dw TinyMushroomDesc
	dw BigMushroomDesc
	dw SilverPowderDesc
	dw BluApricornDesc
	dw SleepGuardDesc
	dw AmuletCoinDesc
	dw YlwApricornDesc
	dw GrnApricornDesc
	dw CleanseTagDesc
	dw MysticWaterDesc
	dw TwistedSpoonDesc
	dw WhtApricornDesc
	dw BlackbeltDesc
	dw BlkApricornDesc
	dw PrzGuardDesc
	dw PnkApricornDesc
	dw BlackGlassesDesc
	dw SlowpokeTailDesc
	dw PinkBowDesc
	dw StickDesc
	dw SmokeballDesc
	dw NeverMeltIceDesc
	dw MagnetDesc
	dw LumBerryDesc
	dw PearlDesc
	dw BigPearlDesc
	dw EverStoneDesc
	dw SpellTagDesc
	dw SilverEggDesc
	dw CrystalEggDesc
	dw RubyEggDesc
	dw MiracleSeedDesc
	dw GoldEggDesc
	dw FocusBandDesc
	dw ConfuseGuardDesc
	dw EnergyPowderDesc
	dw EnergyRootDesc
	dw HealPowderDesc
	dw RevivalHerbDesc
	dw HardStoneDesc
	dw LuckyEggDesc
	dw EmeraldEggDesc
	dw PrismKeyDesc
	dw RedOrbDesc
	dw GreenOrbDesc
	dw StardustDesc
	dw StarPieceDesc
	dw MansionKeyDesc
	dw BlueOrbDesc
	dw SapphireEggDesc
	dw CuroShardDesc
	dw BedroomKeyDesc
	dw CharcoalDesc
	dw BerryJuiceDesc
	dw ScopeLensDesc
	dw MegaphoneDesc
	dw CigaretteDesc
	dw MetalCoatDesc
	dw DragonFangDesc
	dw CageCardDesc
	dw LeftoversDesc
	dw CageCardDesc
	dw EagulouBallDesc
	dw GiantRockDesc
	dw LeppaBerryDesc
	dw DragonScaleDesc
	dw BerserkGeneDesc
	dw BlueFluteDesc
	dw XSpDefDesc
	dw CageKeyDesc
	dw SacredAshDesc
	dw ReaperClothDesc
	dw GoldTokenDesc
	dw OreCaseDesc
	dw DiveballDesc
	dw FastballDesc
	dw SmelterDesc
	dw LightballDesc
	dw FriendballDesc
	dw EvioliteDesc
	dw MachoBraceDesc
	dw BurntBerryDesc
	dw HyperShareDesc
	dw SunStoneDesc
	dw SilkScarfDesc
	dw DynamiteDesc
	dw UpGradeDesc
	dw OranBerryDesc
	dw SitrusBerryDesc
	dw DawnStoneDesc
	dw GoldDustDesc
	dw ParkballDesc
	dw IronPickaxeDesc
	dw ShinyStoneDesc
	dw BrickPieceDesc
	dw RedFluteDesc
	dw YellowFluteDesc
	dw BlackFluteDesc
	dw WhiteFluteDesc
	dw GreenFluteDesc
	dw OrangeFluteDesc
	dw SootSackDesc
	dw PurpleFluteDesc
	dw ShopTicketDesc
	dw MiningPickDesc
	dw TMCaseDesc
	dw SafeGogglesDesc
	dw RedJewelDesc
	dw BlueJewelDesc
	dw BrownJewelDesc
	dw WhiteJewelDesc
	dw PrismJewelDesc
	dw BigNuggetDesc
	dw HeatRockDesc
	dw DampRockDesc
	dw SmoothRockDesc
	dw IcyRockDesc
	dw LightClayDesc
	dw ShellBellDesc
	dw KegofBeerDesc
	dw FireRingDesc
	dw GrassRingDesc
	dw WaterRingDesc
	dw ThunderRingDesc
	dw ShinyRingDesc
	dw DawnRingDesc
	dw DuskRingDesc
	dw MoonRingDesc
	dw DuskStoneDesc
	dw ExpertBeltDesc
	dw TradeStoneDesc
	dw ShinyBallDesc
	dw OreDesc
	dw BurgerDesc
	dw MuscleBandDesc
	dw FriesDesc
	dw FossilCaseDesc
	dw SilkDesc
	dw MagmarizerDesc
	dw ElectirizerDesc
	dw PrismScaleDesc
	dw DubiousDiscDesc
	dw RazorClawDesc
	dw RazorFangDesc
	dw ProtectorDesc
	dw OrngApricornDesc
	dw CyanApricornDesc
	dw GreyApricornDesc
	dw PrplApricornDesc
	dw ShnyApricornDesc
	dw WiseGlassesDesc
	dw MysteryTcktDesc
	dw OrphanCardDesc
	dw QRScannerDesc
	dw GasMaskDesc
	dw FakeIDDesc
	dw FluffyCoatDesc
	dw RoofCardDesc
	dw LabCardDesc
	dw GrappleHookDesc
	dw QuickBallDesc
	dw DuskBallDesc
	dw RepeatBallDesc
	dw TimerBallDesc
	dw MagnetPassDesc
	dw TimeMachineDesc
	dw TokenTrackerDesc
	dw PowerHerbDesc
	dw UnusedItemDesc
	dw UnusedItemDesc
	dw UnusedItemDesc

MasterballDesc:
	ctxt "The best BALL. It"
	next "never misses."
	done

UltraballDesc:
	ctxt "A BALL with a high"
	next "rate of success."
	done

BrightpowderDesc:
	ctxt "Lowers the foe's"
	next "accuracy. (HOLD)"
	done

GreatballDesc:
	ctxt "A BALL with a de-"
	next "cent success rate."
	done

PokeballDesc:
	ctxt "An item for catch-"
	next "ing #MON."
	done

AntidoteDesc:
	ctxt "Cures poisoned"
	next "#MON."
	done

BurnHealDesc:
	ctxt "Heals burned"
	next "#MON."
	done

IceHealDesc:
	ctxt "Defrosts frozen"
	next "#MON."
	done

AwakeningDesc:
	ctxt "Awakens sleeping"
	next "#MON."
	done

ParlyzHealDesc:
	ctxt "Heals paralyzed"
	next "#MON."
	done

FullRestoreDesc:
	ctxt "Fully restores HP"
	next "& status."
	done

MaxPotionDesc:
	ctxt "Fully restores"
	next "#MON HP."
	done

HyperPotionDesc:
	ctxt "Restores #MON"
	next "HP by 200."
	done

SuperPotionDesc:
	ctxt "Restores #MON"
	next "HP by 50."
	done

PotionDesc:
	ctxt "Restores #MON"
	next "HP by 20."
	done

EscapeRopeDesc:
	ctxt "Use for escaping"
	next "from caves, etc."
	done

RepelDesc:
	ctxt "Repels weak #-"
	next "MON for 100 steps."
	done

MaxElixirDesc:
	ctxt "Fully restores the"
	next "PP of one #MON."
	done

HPUpDesc:
	ctxt "Raises the HP of"
	next "one #MON."
	done

ProteinDesc:
	ctxt "Raises ATTACK of"
	next "one #MON."
	done

IronDesc:
	ctxt "Raises DEFENSE of"
	next "one #MON."
	done

CarbosDesc:
	ctxt "Raises SPEED of"
	next "one #MON."
	done

LuckyPunchDesc:
	ctxt "Ups critical hit"
	next "ratio of CHANSEY."
	done

CalciumDesc:
	ctxt "Ups SPECIAL stats"
	next "of one #MON."
	done

RareCandyDesc:
	ctxt "Raises level of a"
	next "#MON by one."
	done

XAccuracyDesc:
	ctxt "Raises accuracy."
	next "(1 battle)"
	done

MetalPowderDesc:
	ctxt "Raises DEFENSE of"
	next "DITTO. (HOLD)"
	done

NuggetDesc:
	ctxt "Made of pure gold."
	next "Sell high."
	done

PokeDollDesc:
	ctxt "Use to escape from"
	next "a wild #MON."
	done

FullHealDesc:
	ctxt "Eliminates all"
	next "status problems."
	done

ReviveDesc:
	ctxt "Restores a fainted"
	next "#MON to 1/2 HP."
	done

MaxReviveDesc:
	ctxt "Fully restores a"
	next "fainted #MON."
	done

GuardSpecDesc:
	ctxt "Prevents stat"
	next "reduction. (1 BTL)"
	done

SuperRepelDesc:
	ctxt "Repels weak #-"
	next "MON for 200 steps."
	done

MaxRepelDesc:
	ctxt "Repels weak #-"
	next "MON for 300 steps."
	done

DireHitDesc:
	ctxt "Ups critical hit"
	next "ratio. (1 battle)"
	done

FreshWaterDesc:
	ctxt "Restores #MON"
	next "HP by 50."
	done

SodaPopDesc:
	ctxt "Restores #MON"
	next "HP by 60."
	done

LemonadeDesc:
	ctxt "Restores #MON"
	next "HP by 80."
	done

XAttackDesc:
	ctxt "Raises ATTACK."
	next "(1 battle)"
	done

XDefendDesc:
	ctxt "Raises DEFENSE."
	next "(1 battle)"
	done

XSpeedDesc:
	ctxt "Raises SPEED."
	next "(1 battle)"
	done

XSpAtkDesc:
	ctxt "Raises SPECIAL"
	next "ATTACK. (1 battle)"
	done

XSpDefDesc:
	ctxt "Raises SPECIAL"
	next "DEFENSE. (1 BTL)"
	done

CoinCaseDesc:
	ctxt "HOLDs up to 9,999"
	next "game coins."
	done

ExpShareDesc:
	ctxt "Shares battle EXP."
	next "Points. (HOLD)"
	done

OldRodDesc:
	ctxt "Use by water to"
	next "fish for #MON."
	done

GoodRodDesc:
	ctxt "A good rod for"
	next "catching #MON."
	done

SilverLeafDesc:
	ctxt "A strange, silver-"
	next "colored leaf."
	done

SuperRodDesc:
	ctxt "The best rod for"
	next "catching #MON."
	done

PPUpDesc:
	ctxt "Raises max PP of"
	next "a selected move."
	done

EtherDesc:
	ctxt "Restores PP of one"
	next "move by 10."
	done

MaxEtherDesc:
	ctxt "Fully restores PP"
	next "of one move."
	done

ElixirDesc:
	ctxt "Restores PP of all"
	next "moves by 10."
	done

MagnetPassDesc:
	ctxt "A pass for the"
	next "MAGNET TRAIN."
	done

MoomooMilkDesc:
	ctxt "Restores #MON"
	next "HP by 100."
	done

QuickClawDesc:
	ctxt "Raises 1st strike"
	next "ratio. (HOLD)"
	done

PechaBerryDesc:
	ctxt "A self-cure for"
	next "poison. (HOLD)"
	done

GoldLeafDesc:
	ctxt "A strange, gold-"
	next "colored leaf."
	done

SoftSandDesc:
	ctxt "Powers up ground-"
	next "type moves. (HOLD)"
	done

SharpBeakDesc:
	ctxt "Powers up flying-"
	next "type moves. (HOLD)"
	done

CheriBerryDesc:
	ctxt "A self-cure for"
	next "paralysis. (HOLD)"
	done

AspearBerryDesc:
	ctxt "A self-cure for"
	next "freezing. (HOLD)"
	done

RawstBerryDesc:
	ctxt "A self-heal for a"
	next "burn. (HOLD)"
	done

PoisonBarbDesc:
	ctxt "Powers up poison-"
	next "type moves. (HOLD)"
	done

KingsRockDesc:
	ctxt "May make the foe"
	next "flinch. (HOLD)"
	done

PersimBerryDesc:
	ctxt "A self-cure for"
	next "confusion. (HOLD)"
	done

ChestoBerryDesc:
	ctxt "A self-awakening"
	next "for sleep. (HOLD)"
	done

RedApricornDesc:
	ctxt "A red APRICORN."
	done

TinyMushroomDesc:
	ctxt "An ordinary mush-"
	next "room. Sell low."
	done

BigMushroomDesc:
	ctxt "A rare mushroom."
	next "Sell high."
	done

SilverPowderDesc:
	ctxt "Powers up bug-type"
	next "moves. (HOLD)"
	done

BluApricornDesc:
	ctxt "A blue APRICORN."
	done

AmuletCoinDesc:
	ctxt "Doubles monetary"
	next "earnings. (HOLD)"
	done

YlwApricornDesc:
	ctxt "A yellow APRICORN."
	done

GrnApricornDesc:
	ctxt "A green APRICORN."
	done

CleanseTagDesc:
	ctxt "Helps repel wild"
	next "#MON. (HOLD)"
	done

MysticWaterDesc:
	ctxt "Powers up water-"
	next "type moves. (HOLD)"
	done

TwistedSpoonDesc:
	ctxt "Powers up psychic-"
	next "type moves. (HOLD)"
	done

WhtApricornDesc:
	ctxt "A white APRICORN."
	done

BlackbeltDesc:
	ctxt "Boosts fighting-"
	next "type moves. (HOLD)"
	done

BlkApricornDesc:
	ctxt "A black APRICORN."
	done

PnkApricornDesc:
	ctxt "A pink APRICORN."
	done

BlackGlassesDesc:
	ctxt "Powers up dark-"
	next "type moves. (HOLD)"
	done

SlowpokeTailDesc:
	ctxt "Very tasty. Sell"
	next "high."
	done

PinkBowDesc:
	ctxt "Powers up fairy-"
	next "type moves. (HOLD)"
	done

StickDesc:
	ctxt "An ordinary stick."
	next "Sell low."
	done

SmokeballDesc:
	ctxt "Escape from wild"
	next "#MON. (HOLD)"
	done

NeverMeltIceDesc:
	ctxt "Powers up ice-type"
	next "moves. (HOLD)"
	done

MagnetDesc:
	ctxt "Boosts electric-"
	next "type moves. (HOLD)"
	done

LumBerryDesc:
	ctxt "Cures all status"
	next "problems. (HOLD)"
	done

PearlDesc:
	ctxt "A beautiful pearl."
	next "Sell low."
	done

BigPearlDesc:
	ctxt "A big, beautiful"
	next "pearl. Sell high."
	done

EverStoneDesc:
	ctxt "Stops evolution."
	next "(HOLD)"
	done

SpellTagDesc:
	ctxt "Powers up ghost-"
	next "type moves. (HOLD)"
	done

MiracleSeedDesc:
	ctxt "Powers up grass-"
	next "type moves. (HOLD)"
	done

FocusBandDesc:
	ctxt "May prevent faint-"
	next "ing. (HOLD)"
	done

EnergyPowderDesc:
	ctxt "Restores #MON"
	next "HP by 50. Bitter."
	done

EnergyRootDesc:
	ctxt "Restores #MON"
	next "HP by 200. Bitter."
	done

HealPowderDesc:
	ctxt "Cures all status"
	next "problems. Bitter."
	done

RevivalHerbDesc:
	ctxt "Revives fainted"
	next "#MON. Bitter."
	done

HardStoneDesc:
	ctxt "Powers up rock-"
	next "type moves. (HOLD)"
	done

LuckyEggDesc:
	ctxt "Earns extra EXP."
	next "points. (HOLD)"
	done

StardustDesc:
	ctxt "Pretty, red sand."
	next "Sell high."
	done

StarPieceDesc:
	ctxt "A hunk of red gem."
	next "Sell very high."
	done

CharcoalDesc:
	ctxt "Powers up fire-"
	next "type moves. (HOLD)"
	done

BerryJuiceDesc:
	ctxt "Restores #MON"
	next "HP by 20."
	done

ScopeLensDesc:
	ctxt "Raises critical"
	next "hit ratio. (HOLD)"
	done

MetalCoatDesc:
	ctxt "Powers up steel-"
	next "type moves. (HOLD)"
	done

DragonFangDesc:
	ctxt "Powers up dragon-"
	next "type moves. (HOLD)"
	done

LeftoversDesc:
	ctxt "Restores HP during"
	next "battle. (HOLD)"
	done

LeppaBerryDesc:
	ctxt "A self-restore"
	next "for PP. (HOLD)"
	done

DragonScaleDesc:
	ctxt "A rare dragon-type"
	next "item."
	done

BerserkGeneDesc:
	ctxt "Boosts ATTACK but"
	next "causes confusion."
	done

SacredAshDesc:
	ctxt "Fully revives all"
	next "fainted #MON."
	done

ReaperClothDesc:
	ctxt "A cloth radiating"
	next "spiritual energy."
	done

DiveballDesc:
	ctxt "A ball for #MON"
	next "living in water."
	done

FastballDesc:
	ctxt "A ball for catch-"
	next "ing fast #MON."
	done

LightballDesc:
	ctxt "An odd, electrical"
	next "orb. (HOLD)"
	done

FriendballDesc:
	ctxt "A ball that makes"
	next "#MON friendly."
	done

IronPickaxeDesc:
	ctxt "A rechargeable pi-"
	next "ckaxe for mining."
	done

MachoBraceDesc:
	ctxt "Promotes growth,"
	next "lowers SPD. (HOLD)"
	done

HyperShareDesc:
	ctxt "All <PK><MN> get 1/3 EXP"
	next "but no prize ¥."
	done

EvioliteDesc:
	ctxt "Boosts unevolved"
	next "#MON's defenses."
	done

SilkScarfDesc:
	ctxt "Powers up normal-"
	next "type moves. (HOLD)"
	done

UpGradeDesc:
	ctxt "A mysterious box"
	next "made by SILPH CO."
	done

OranBerryDesc:
	ctxt "A self-restore"
	next "item. (10HP, HOLD)"
	done

SitrusBerryDesc:
	ctxt "Self-restore item."
	next "(1/4 HP, HOLD)"
	done

ParkballDesc:
	ctxt "The PROVINCIAL"
	next "PARK BALL."
	done

BrickPieceDesc:
	ctxt "A rare chunk of"
	next "tile."
	done

UnusedItemDesc:
	text "b&"
	done

CoalDesc:
	ctxt "A combustible"
	next "black rock."
	done

BicycleDesc:
	ctxt "A collapsible bike"
	next "for fast movement."
	done

OreDesc:
	ctxt "May contain a"
	next "valuable metal."
	done

BurgerDesc:
	ctxt "Restores #MON"
	next "HP by 80."
	done

FriesDesc:
	ctxt "Restores #MON"
	next "HP by 30."
	done

MuscleBandDesc:
	ctxt "Boosts physical"
	next "attacks. (HOLD)"
	done

ItemfinderDesc:
	ctxt "Checks for unseen"
	next "items nearby."
	done

HeartScaleDesc:
	ctxt "A pretty, heart-"
	next "shaped scale."
	done

RijonPassDesc:
	ctxt "Grants access to"
	next "the RIJON region."
	done

FossilCaseDesc:
	ctxt "A handy case for"
	next "#MON fossils."
	done

GoldEggDesc:
SilverEggDesc:
CrystalEggDesc:
RubyEggDesc:
SapphireEggDesc:
EmeraldEggDesc:
	ctxt "A very shiny and"
	next "mysterious egg."
	done

PrismKeyDesc:
	ctxt "A rainbow-emitting"
	next "transparent key."
	done

RedOrbDesc:
	ctxt "A red, glowing"
	next "orb from HOENN."
	done

BlueOrbDesc:
	ctxt "A blue, glowing"
	next "orb from HOENN."
	done

GreenOrbDesc:
	ctxt "A green, glowing"
	next "orb from HOENN."
	done

SilkDesc:
	ctxt "Strong fiber made"
	next "by CATERPIE."
	done

MansionKeyDesc:
	ctxt "Unlocks the HAUN-"
	next "TED MANSION door."
	done

BedroomKeyDesc:
	ctxt "Unlocks HAUNTED"
	next "MANSION's bedroom."
	done

CuroShardDesc:
	ctxt "Purifies #MON"
	next "from mind control."
	done

MegaphoneDesc:
	ctxt "Powers up sound-"
	next "type moves. (HOLD)"
	done

CigaretteDesc:
	ctxt "Powers up gas-"
	next "type moves. (HOLD)"
	done

GiantRockDesc:
	ctxt "Large enough to"
	next "block moats."
	done

RedFluteDesc:
	ctxt "Cures a #MON's"
	next "infatuation."
	done

BlueFluteDesc:
	ctxt "Awakens a sleeping"
	next "#MON."
	done

YellowFluteDesc:
	ctxt "Snaps a #MON"
	next "out of confusion."
	done

BlackFluteDesc:
	ctxt "Deters wild"
	next "#MON."
	done

WhiteFluteDesc:
	ctxt "Lures wild"
	next "#MON."
	done

GreenFluteDesc:
	ctxt "Frees #MON from"
	next "being HP drained."
	done

OrangeFluteDesc:
	ctxt "Ends all weather"
	next "effects in battle."
	done

PurpleFluteDesc:
	ctxt "Clears any active"
	next "walls in battle."
	done

ShopTicketDesc:
	ctxt "Will grant access"
	next "to a secret shop."
	done

SootSackDesc:
	ctxt "A sack used to"
	next "hold volcanic ash."
	done

GoldTokenDesc:
	ctxt "Can be exchanged"
	next "for prizes."
	done

OreCaseDesc:
	ctxt "A case for holding"
	next "smelted ores."
	done

SmelterDesc:
	ctxt "A portable smelter"
	next "for ORES and COAL."
	done

PowerHerbDesc:
	ctxt "Charges up 2-turn"
	next "moves. (HOLD)"
	done

CageKeyDesc:
	ctxt "Used to unlock"
	next "jail cells."
	done

BurntBerryDesc:
	ctxt "An ORAN BERRY that"
	next "has been burnt."
	done

MoonStoneDesc:
FireStoneDesc:
ThunderStoneDesc:
WaterStoneDesc:
LeafStoneDesc:
SunStoneDesc:
DawnStoneDesc:
ShinyStoneDesc:
DuskStoneDesc:
TradeStoneDesc:
	ctxt "Evolves certain"
	next "kinds of #MON."
	done

ExpertBeltDesc:
	ctxt "Boosts supereffec-"
	next "tive moves. (HOLD)"
	done

DynamiteDesc:
	ctxt "A highly explosive"
	next "red stick."
	done

GoldDustDesc:
	ctxt "Golden dust."
	next "Sell low."
	done

MiningPickDesc:
	ctxt "Used to mine"
	next "for items."
	done

TMCaseDesc:
	ctxt "A case that holds"
	next "TMs and HMs."
	done

SafeGogglesDesc:
	ctxt "Immunity to hail,"
	next "sand and powders."
	done

RedJewelDesc:
BrownJewelDesc:
BlueJewelDesc:
WhiteJewelDesc:
PrismJewelDesc:
	ctxt "An ancient jewel"
	next "from NALJO RUINS."
	done

BigNuggetDesc:
	ctxt "A big nugget of"
	next "pure gold."
	done

HeatRockDesc:
	ctxt "SUNNY DAY lasts"
	next "eight turns."
	done

DampRockDesc:
	ctxt "RAIN DANCE lasts"
	next "eight turns."
	done

IcyRockDesc:
	ctxt "HAIL lasts"
	next "eight turns."
	done

SmoothRockDesc:
	ctxt "SANDSTORM lasts"
	next "eight turns."
	done

LightClayDesc:
	ctxt "Barrier moves last"
	next "eight turns."
	done

ShellBellDesc:
	ctxt "Restores HP after"
	next "striking the foe."
	done

KegofBeerDesc:
	ctxt "Alcohol that was"
	next "brewed in RIJON."
	done

GrassRingDesc:
	ctxt "Boosts SPCL.DEF,"
	next "reduces DEFENSE."
	done

FireRingDesc:
	ctxt "Boosts DEFENSE,"
	next "reduces SPCL.DEF."
	done

WaterRingDesc:
	ctxt "Boosts ATTACK,"
	next "reduces evasion."
	done

ThunderRingDesc:
	ctxt "Boosts SPCL.ATK,"
	next "reduces accuracy."
	done

MoonRingDesc:
	ctxt "Boosts evasion,"
	next "reduces SPEED."
	done

ShinyRingDesc:
	ctxt "Boosts accuracy,"
	next "reduces evasion."
	done

DawnRingDesc:
	ctxt "Boosts SPEED,"
	next "reduces accuracy."
	done

DuskRingDesc:
	ctxt "The effect of this"
	next "ring is unknown."
	done

ShinyBallDesc:
	ctxt "The caught #MON"
	next "becomes shiny."
	done

PoisonGuardDesc:
	ctxt "User can't get"
	next "poisoned. (HOLD)"
	done

BurnGuardDesc:
	ctxt "User can't get"
	next "burned. (HOLD)"
	done

FreezeGuardDesc:
	ctxt "User can't get"
	next "frozen. (HOLD)"
	done

SleepGuardDesc:
	ctxt "User can't fall"
	next "asleep. (HOLD)"
	done

PrzGuardDesc:
	ctxt "User can't get"
	next "paralyzed. (HOLD)"
	done

ConfuseGuardDesc:
	ctxt "User can't get"
	next "confused. (HOLD)"
	done

MagmarizerDesc:
	ctxt "A box packed with"
	next "magma energy."
	done

ElectirizerDesc:
	ctxt "A box packed with"
	next "electric energy."
	done

PrismScaleDesc:
	ctxt "A shiny scale that"
	next "emits rainbows."
	done

DubiousDiscDesc:
	ctxt "Transparent device"
	next "with dubious data."
	done

RazorClawDesc:
	ctxt "Raises critical"
	next "hit ratio. (HOLD)"
	done

RazorFangDesc:
	ctxt "Can cause the foe"
	next "to flinch. (HOLD)"
	done

ProtectorDesc:
	ctxt "A stiff and heavy"
	next "protective item."
	done

OrngApricornDesc:
	ctxt "An orange"
	next "APRICORN."
	done

CyanApricornDesc:
	ctxt "A cyan APRICORN."
	done

GreyApricornDesc:
	ctxt "A grey APRICORN."
	done

PrplApricornDesc:
	ctxt "A purple APRICORN."
	done

ShnyApricornDesc:
	ctxt "A shiny APRICORN."
	done

WiseGlassesDesc:
	ctxt "Boosts special"
	next "attacks. (HOLD)"
	done

MysteryTcktDesc:
	ctxt "Lets you fly to"
	next "the MYSTERY ZONE."
	done

OrphanCardDesc:
	ctxt "Keeps track of"
	next "ORPHAN POINTS."
	done

QRScannerDesc:
	ctxt "Can decipher QR"
	next "codes."
	done

GasMaskDesc:
	ctxt "Protects from"
	next "deadly toxins."
	done

FakeIDDesc:
	ctxt "A fake NALJO"
	next "citizen ID."
	done

FluffyCoatDesc:
	ctxt "Protects you from"
	next "low temperatures."
	done

RoofCardDesc:
	ctxt "Allows access to"
	next "the prison roof."
	done

LabCardDesc:
	ctxt "Unlocks the PHLOX"
	next "LAB's door."
	done

FerryTicketDesc:
	ctxt "A ferry ticket to"
	next "ROUTE 86."
	done

GrappleHookDesc:
	ctxt "Useful for climbi-"
	next "ng up high places."
	done

QuickBallDesc:
	ctxt "Easier to catch"
	next "on the first turn."
	done

DuskBallDesc:
	ctxt "Easier to catch"
	next "in caves or dark."
	done

RepeatBallDesc:
	ctxt "Easier to catch"
	next "if in the #DEX."
	done

TimerBallDesc:
	ctxt "Easier to catch"
	next "as time goes on."
	done

CageCardDesc:
	ctxt "Opens ups a PHLOX"
	next "LAB door."
	done

EagulouBallDesc:
	ctxt "The ball for the"
	next "EAGULOU PARK."
	done

TimeMachineDesc:
	ctxt "Lets you travel"
	next "through time<...>?"
	done

TokenTrackerDesc:
	ctxt "Keeps track of"
	next "found GOLD TOKENS."
	done
