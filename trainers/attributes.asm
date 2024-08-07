TrainerClassAttributes:

; Josiah
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Brooklyn
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rinji
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Edison
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Ayaka
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cadence
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Andre
	db LUM_BERRY, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bruce
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival1
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Mura
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Yuki
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Koji
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Daichi
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; DelinquentF
	db 0, 0 ; items
	db 17 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sora
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Champion
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Patroller
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Scientist
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Youngster
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Schoolboy
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Bird Keeper
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lass
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Cheerleader
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_SETUP + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Cooltrainerm
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerf
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Beauty
	db 0, 0 ; items
	db 22 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemaniac
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gruntf
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gentleman
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Skier
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Teacher
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sheryl
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bug Catcher
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_SETUP + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Fisher
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Swimmerm
	db 0, 0 ; items
	db 3 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Swimmerf
	db 0, 0 ; items
	db 3 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sailor
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Super Nerd
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival2
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Guitarist
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Hiker
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Biker
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Joe
	db MAX_POTION, FULL_HEAL ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Burglar
	db 0, 0 ; items
	db 22 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Firebreather
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Juggler
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Blackbelt T
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Psychic T
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Picnicker
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Camper
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sage
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Medium
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Boarder
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokefanm
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; DelinquentM
	db 0, 0 ; items
	db 17 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Twins
	db 0, 0 ; items
	db 5 ; base reward
	dw NO_AI
	dw CONTEXT_USE + SWITCH_OFTEN

; Pokefanf
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Red
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blue
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Officer
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Miner
	db 0, 0 ; items
	db 11 ; base reward
	dw AI_BASIC + AI_SETUP + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Karpman
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Arcade PC
	db 0, 0 ;items
	db 0 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lily
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lois
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sparky
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gold
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Giovanni
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Ernest
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Kris
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Kimono Girl
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bugsy
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Whitney
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sabrina
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Candela
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blanche
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Spark
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Brown
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; GuitaristF
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES
