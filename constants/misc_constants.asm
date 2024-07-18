PARTY_LENGTH EQU 6

MAX_ITEMS     EQU 40
MAX_BALLS     EQU 25
MAX_KEY_ITEMS EQU 50
MAX_PC_ITEMS  EQU 60

; strings
PLAYER_NAME_LENGTH EQU 8
BOX_NAME_LENGTH EQU 9
PKMN_NAME_LENGTH EQU 11
MOVE_NAME_LENGTH EQU 13
ITEM_NAME_LENGTH EQU 13
TRAINER_CLASS_NAME_LENGTH EQU 13
NAME_LENGTH EQU 11

; GetName types
PKMN_NAME     EQU 1
MOVE_NAME     EQU 2
ABILITY_NAME  EQU 3
ITEM_NAME     EQU 4
PARTY_OT_NAME EQU 5
ENEMY_OT_NAME EQU 6
TRAINER_NAME  EQU 7

; hp
HP_GREEN  EQU 0
HP_YELLOW EQU 1
HP_RED    EQU 2

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14

; hall of fame
HOF_MON_LENGTH = 1 + 2 + 2 + 1 + (PKMN_NAME_LENGTH - 1) ; species, id, dvs, level, nick
HOF_LENGTH = 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
NUM_HOF_TEAMS = 30

; flag manipulation
RESET_FLAG EQU 0
SET_FLAG   EQU 1
CHECK_FLAG EQU 2

; Boolean checks
FALSE EQU 0
TRUE  EQU 1

; joypad

	const_def
	const A_BUTTON_F
	const B_BUTTON_F
	const SELECT_F
	const START_F
	const D_RIGHT_F
	const D_LEFT_F
	const D_UP_F
	const D_DOWN_F

NO_INPUT   EQU %00000000
A_BUTTON   EQU 1 << A_BUTTON_F
B_BUTTON   EQU 1 << B_BUTTON_F
SELECT     EQU 1 << SELECT_F
START      EQU 1 << START_F
D_RIGHT    EQU 1 << D_RIGHT_F
D_LEFT     EQU 1 << D_LEFT_F
D_UP       EQU 1 << D_UP_F
D_DOWN     EQU 1 << D_DOWN_F

BUTTONS    EQU A_BUTTON | B_BUTTON | SELECT | START
D_PAD      EQU D_RIGHT | D_LEFT | D_UP | D_DOWN

R_DPAD     EQU %00100000
R_BUTTONS  EQU %00010000

; screen
HP_BAR_LENGTH     EQU 7
HP_BAR_LENGTH_PX  EQU HP_BAR_LENGTH * 8 * 2
EXP_BAR_LENGTH    EQU 9
EXP_BAR_LENGTH_PX EQU EXP_BAR_LENGTH * 8

SCREEN_WIDTH     EQU 20
SCREEN_HEIGHT    EQU 18
SCREEN_WIDTH_PX  EQU SCREEN_WIDTH * 8
SCREEN_HEIGHT_PX EQU SCREEN_HEIGHT * 8

BG_MAP_WIDTH  EQU 32
BG_MAP_HEIGHT EQU 32
WMISC_WIDTH   EQU 6 * 4
WMISC_HEIGHT  EQU 5 * 4

TILE_WIDTH EQU 8

; movement
STEP_SLOW          EQU 0
STEP_WALK          EQU 1
STEP_BIKE          EQU 2
STEP_LEDGE         EQU 3
STEP_ICE           EQU 4
STEP_TURN          EQU 5
STEP_BACK_LEDGE    EQU 6
STEP_WALK_IN_PLACE EQU 7
STEP_RUN           EQU 8

; ai
CONTEXT_USE_F      EQU 6
UNKNOWN_USE_F      EQU 5
ALWAYS_USE_F       EQU 4
SWITCH_SOMETIMES_F EQU 2
SWITCH_RARELY_F    EQU 1
SWITCH_OFTEN_F     EQU 0

CONTEXT_USE        EQU 1 << CONTEXT_USE_F
UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F
SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F
SPRITE_GFX_LIST_CAPACITY EQU $20

MALE   EQU 0
FEMALE EQU 1

PRINTNUM_MONEY_F        EQU 5
PRINTNUM_LEFTALIGN_F    EQU 6
PRINTNUM_LEADINGZEROS_F EQU 7

PRINTNUM_MONEY          EQU 1 << PRINTNUM_MONEY_F
PRINTNUM_LEFTALIGN      EQU 1 << PRINTNUM_LEFTALIGN_F
PRINTNUM_LEADINGZEROS   EQU 1 << PRINTNUM_LEADINGZEROS_F

RECEIVED_TM             EQU $80

const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_YOUNGCUT1         ; 09
	const HAPPINESS_YOUNGCUT2         ; 0a
	const HAPPINESS_YOUNGCUT3         ; 0b
	const HAPPINESS_OLDERCUT1         ; 0c
	const HAPPINESS_OLDERCUT2         ; 0d
	const HAPPINESS_OLDERCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_MASSAGE           ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13

	const_def
	const LINK_NULL
	const LINK_TIMECAPSULE
	const LINK_TRADECENTER
	const LINK_COLOSSEUM
	const LINK_MOBILE

SERIAL_TIMECAPSULE EQU $60
SERIAL_TRADECENTER EQU $70
SERIAL_BATTLE      EQU $80

HMENURETURN_SCRIPT EQU %10000000
HMENURETURN_ASM    EQU %11111111

NUM_MON_SUBMENU_ITEMS EQU 8

	const_def
	const PYREBADGE
	const NATUREBADGE
	const GULFBADGE
	const ELECTRONBADGE
	const MUSCLEBADGE
	const HAZEBADGE
	const RAUCOUSBADGE
	const NALJOBADGE
NUM_NALJO_BADGES EQU const_value
	const_def
	const MARINEBADGE
	const HAILBADGE
	const SPROUTBADGE
	const SPARKYBADGE
	const FISTBADGE
	const PSIBADGE
	const WHITEBADGE
	const STARBADGE
NUM_RIJON_BADGES EQU const_value
	const HIVEBADGE
	const PLAINBADGE
	const MARSHBADGE
	const BLAZEBADGE
NUM_OTHER_BADGES EQU const_value

NUM_BADGES EQU NUM_NALJO_BADGES + NUM_RIJON_BADGES + NUM_OTHER_BADGES

	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_CAVE

MAX_MONEY         EQU 9999999
MAX_COINS         EQU    9999
MAX_ASH           EQU   50000
MAX_ORPHAN_POINTS EQU    9999

LINK_PARTNER_PRISM EQU 2

	const_def
	const PACHISI_NOTHING
	const PACHISI_GRASS
	const PACHISI_WATER
	const PACHISI_CAVE
	const PACHISI_MONEY
	const PACHISI_HEAL
	const PACHISI_ITEM
	const PACHISI_MUNCHER
	const PACHISI_WARP_TORENIA_1
	const PACHISI_WARP_TORENIA_2
	const PACHISI_DEATH
	const PACHISI_DICE
	const PACHISI_RANDOM
	const PACHISI_FINISH
	const PACHISI_FORWARDS
	const PACHISI_BACKWARDS
	const PACHISI_WARP_BOTAN_ITEMS
	const PACHISI_WARP_BOTAN_SECTION_2
	const PACHISI_WARP_BOTAN_RANDOM
	const PACHISI_WARP_BOTAN_SECTION_3
	const PACHISI_WARP_BOTAN_SECTION_4

LAST_PACHISI_TILE EQU const_value - 1

PARK_MINIGAME_SPOT_COUNT EQU 13

const_value = 1

	const RTC_TIMER_SECONDS
	const RTC_TIMER_MINUTES
	const RTC_TIMER_HOURS
	const RTC_TIMER_DAYS
	const RTC_TIMER_MONTHS
	const RTC_TIMER_YEARS

	const_def
	const CRAFT_MINING
	const CRAFT_SMELTING
	const CRAFT_BALLMAKING
	const CRAFT_JEWELING

	const_def
	const VSR_MINING
	const VSR_SMELTINGORE
	const VSR_SMELTINGCOAL

	const_def
	; local variables, maps can override them freely
	const EVAR_TEMP
	const EVAR_X
	const EVAR_Y
	const EVAR_Z
	; global variables will go here
