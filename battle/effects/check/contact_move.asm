UsedContactMove:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, .moves
	jp IsInSingularArray

.moves
	db POUND
	db KARATE_CHOP
	db DOUBLESLAP
	db DRAIN_PUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db SCRATCH
	db DRAININGKISS
	db CUT
	db WING_ATTACK
	db FLY
	db BRAVE_BIRD
	db VINE_WHIP
	db STOMP
	db DOUBLE_KICK
	db FLARE_BLITZ
	db HEADBUTT
	db AQUA_JET
	db HI_JUMP_KICK
	db TACKLE
	db BODY_SLAM
	db WRAP
	db TAKE_DOWN
	db DOUBLE_EDGE
	db BITE
	db IRON_HEAD
	db PECK
	db DRILL_PECK
	db ZEN_HEADBUTT
	db COUNTER
	db SEISMIC_TOSS
	db STRENGTH
	db DIG
	db QUICK_ATTACK
	db RAGE
	db HEAD_SMASH
	db ASTONISH
	db LICK
	db THUNDER_FANG
	db WATERFALL
	db BULLET_PUNCH
	db LEECH_LIFE
	db DIZZY_PUNCH
	db WILD_CHARGE
	db X_SCISSOR
	db NIGHT_SLASH
	db METEOR_MASH
	db DRAGON_CLAW
	db SLASH
	db STRUGGLE
	db SHADOW_CLAW
	db EXTREMESPEED
	db THIEF
	db AERIAL_ACE
	db FLAME_WHEEL
	db FLAIL
	db REVERSAL
	db MACH_PUNCH
	db FEINT_ATTACK
	db GHOST_HAMMER
	db PLAY_ROUGH
	db OUTRAGE
	db ROLLOUT
	db SPARK
	db FURY_CUTTER
	db STEEL_WING
	db RETURN
	db FRUSTRATION
	db DYNAMICPUNCH
	db MEGAHORN
	db PURSUIT
	db RAPID_SPIN
	db IRON_TAIL
	db METAL_CLAW
	db CROSS_CHOP
	db CRUNCH
	db ROCK_SMASH
	db POISON_JAB
	db -1
