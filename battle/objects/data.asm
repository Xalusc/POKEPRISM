BattleAnimObjects:
MACRO battleanimobj
	db \1 ; flags
		; bit 7: priority
		; bit 6: y flip
		; bit 5: x flip
		; bit 0: enable enemy animation coord fixing (x = $b4 - x; see below for y)
	db \2 ; enemy animation y fix param
		; if $FF: y = y + 5 tiles
		; else:   y = value - y - (1 tile) * (is_softboiled_animation)
	db \3 ; video sequence
	db \4 ; callback
	db \5 ; palette
	db \6 ; tile offset
ENDM

; ANIM_OBJ_00
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_01
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_02
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_03
	battleanimobj $01, $90, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_04
	battleanimobj $01, $90, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_05
	battleanimobj $01, $90, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_06
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_03, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_07
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_04, BATTLEANIMFUNC_1B, 2, $01

; ANIM_OBJ_08
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_FANG
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_0A
	battleanimobj $01, $90, BATTLEANIMFRAMESET_07, BATTLEANIMFUNC_09, 2, $01

; ANIM_OBJ_EMBER
	battleanimobj $01, $aa, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_10, 4, $03

; ANIM_OBJ_DRAGON_RAGE
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_ARC_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 4, $03

; ANIM_OBJ_FLAMETHROWER
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_03, 4, $03

; ANIM_OBJ_FIRE_SPIN
	battleanimobj $01, $90, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_08, 4, $03

; ANIM_OBJ_FIRE_BLAST
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_0A, 4, $03

; ANIM_OBJ_BURNED
	battleanimobj $01, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, 4, $03

; ANIM_OBJ_BLIZZARD
	battleanimobj $01, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_08, 6, $0a

; ANIM_OBJ_12
	battleanimobj $01, $90, BATTLEANIMFRAMESET_13, BATTLEANIMFUNC_NULL, 6, $0a

; ANIM_OBJ_ICE_BEAM
	battleanimobj $01, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 6, $0a

; ANIM_OBJ_RAZOR_LEAF
	battleanimobj $21, $78, BATTLEANIMFRAMESET_16, BATTLEANIMFUNC_RAZOR_LEAF, 5, $06

; ANIM_OBJ_POKE_BALL
	battleanimobj $00, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_POKEBALL, 4, $0b

; ANIM_OBJ_POKE_BALL_BLOCKED
	battleanimobj $00, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_POKEBALL_BLOCKED, 4, $0b

; ANIM_OBJ_17
	battleanimobj $01, $90, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_NULL, 4, $08

; ANIM_OBJ_18
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_NULL, 4, $08

; ANIM_OBJ_19
	battleanimobj $01, $90, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_THROW_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 2, $0c

; ANIM_OBJ_1A
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, 2, $0c

; ANIM_OBJ_1B
	battleanimobj $01, $90, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_NULL, 2, $07

; ANIM_OBJ_BALL_POOF
	battleanimobj $01, $a0, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_NULL, 2, $07

; ANIM_OBJ_BIG_ROCK
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_07, 7, $09

; ANIM_OBJ_SMALL_ROCK
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_07, 7, $09

; ANIM_OBJ_STRENGTH
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_1B, BATTLEANIMFUNC_36, 7, $09

; ANIM_OBJ_SEISMIC_TOSS
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, 6, $21

; ANIM_OBJ_BUBBLE
	battleanimobj $01, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_0C, 6, $0d

; ANIM_OBJ_SURF
	battleanimobj $00, $00, BATTLEANIMFRAMESET_23, BATTLEANIMFUNC_0D, 6, $0d

; ANIM_OBJ_SING
	battleanimobj $01, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_0E, 2, $0e

; ANIM_OBJ_WATER_GUN
	battleanimobj $61, $80, BATTLEANIMFRAMESET_27, BATTLEANIMFUNC_0F, 6, $04

; ANIM_OBJ_HYDRO_PUMP
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_2A, BATTLEANIMFUNC_NULL, 6, $04

; ANIM_OBJ_POWDER
	battleanimobj $01, $40, BATTLEANIMFRAMESET_2B, BATTLEANIMFUNC_11, 5, $0f

; ANIM_OBJ_27
	battleanimobj $61, $98, BATTLEANIMFRAMESET_2C, BATTLEANIMFUNC_NULL, 3, $10

; ANIM_OBJ_28
	battleanimobj $61, $98, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, 3, $10

; ANIM_OBJ_ICE_BUILDUP
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_2E, BATTLEANIMFUNC_NULL, 6, $0a

; ANIM_OBJ_FROZEN
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_2F, BATTLEANIMFUNC_NULL, 6, $0a

; ANIM_OBJ_MASTER_BALL_SPARKLE
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_14, 7, $11

; ANIM_OBJ_RECOVER
	battleanimobj $01, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_14, 3, $0d

; ANIM_OBJ_2D
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_2E
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_2F
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_THUNDER_WAVE
	battleanimobj $21, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_15, 3, $05

; ANIM_OBJ_31
	battleanimobj $21, $90, BATTLEANIMFRAMESET_36, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_LIGHTNING_BOLT
	battleanimobj $21, $90, BATTLEANIMFRAMESET_37, BATTLEANIMFUNC_03, 2, $08

; ANIM_OBJ_33
	battleanimobj $21, $90, BATTLEANIMFRAMESET_38, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_34
	battleanimobj $21, $90, BATTLEANIMFRAMESET_39, BATTLEANIMFUNC_03, 2, $08

; ANIM_OBJ_CLAMP
	battleanimobj $21, $90, BATTLEANIMFRAMESET_3A, BATTLEANIMFUNC_16, 2, $02

; ANIM_OBJ_BITE
	battleanimobj $01, $90, BATTLEANIMFRAMESET_3C, BATTLEANIMFUNC_17, 2, $02

; ANIM_OBJ_37
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_38
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_39
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_3A
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_3B
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_42, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_3C
	battleanimobj $01, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_18, 5, $12

; ANIM_OBJ_3D
	battleanimobj $01, $88, BATTLEANIMFRAMESET_44, BATTLEANIMFUNC_NULL, 5, $12

; ANIM_OBJ_GUST
	battleanimobj $21, $b8, BATTLEANIMFRAMESET_45, BATTLEANIMFUNC_19, 2, $13

; ANIM_OBJ_3F
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_46, BATTLEANIMFUNC_NULL, 2, $14

; ANIM_OBJ_40
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_47, BATTLEANIMFUNC_NULL, 2, $14

; ANIM_OBJ_41
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_48, BATTLEANIMFUNC_1A, 2, $14

; ANIM_OBJ_42
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_49, BATTLEANIMFUNC_1A, 2, $14

; ANIM_OBJ_43
	battleanimobj $21, $98, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 2, $14

; ANIM_OBJ_44
	battleanimobj $21, $80, BATTLEANIMFRAMESET_4B, BATTLEANIMFUNC_NULL, 3, $11

; ANIM_OBJ_ABSORB
	battleanimobj $01, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, 5, $12

; ANIM_OBJ_EGG
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_4D, BATTLEANIMFUNC_1D, 2, $15

; ANIM_OBJ_47
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_RAISE_BY_PARAM, 3, $11

; ANIM_OBJ_48
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_52, BATTLEANIMFUNC_1F, 5, $16

; ANIM_OBJ_49
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_54, BATTLEANIMFUNC_1F, 5, $16

; ANIM_OBJ_LEECH_SEED
	battleanimobj $21, $68, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_LEECH_SEED, 5, $06

; ANIM_OBJ_4B
	battleanimobj $21, $90, BATTLEANIMFRAMESET_59, BATTLEANIMFUNC_21, 2, $0e

; ANIM_OBJ_WAVE
	battleanimobj $21, $90, BATTLEANIMFRAMESET_5C, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 2, $17

; ANIM_OBJ_CONFUSE_RAY
	battleanimobj $01, $90, BATTLEANIMFRAMESET_5D, BATTLEANIMFUNC_22, 3, $11

; ANIM_OBJ_4E
	battleanimobj $61, $88, BATTLEANIMFRAMESET_5F, BATTLEANIMFUNC_NULL, 3, $10

; ANIM_OBJ_4F
	battleanimobj $61, $88, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, 3, $10

; ANIM_OBJ_SCREEN
	battleanimobj $21, $88, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_NULL, 3, $18

; ANIM_OBJ_HARDEN
	battleanimobj $21, $80, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_NULL, 2, $18

; ANIM_OBJ_CHICK
	battleanimobj $21, $50, BATTLEANIMFRAMESET_61, BATTLEANIMFUNC_23, 3, $19

; ANIM_OBJ_AMNESIA
	battleanimobj $01, $80, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, 2, $19

; ANIM_OBJ_ASLEEP
	battleanimobj $01, $80, BATTLEANIMFRAMESET_66, BATTLEANIMFUNC_25, 2, $19

; ANIM_OBJ_SKULL
	battleanimobj $01, $50, BATTLEANIMFRAMESET_1C, BATTLEANIMFUNC_NULL, 2, $0c

; ANIM_OBJ_56
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_26, 7, $1a

; ANIM_OBJ_57
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_68, BATTLEANIMFUNC_NULL, 7, $1a

; ANIM_OBJ_58
	battleanimobj $21, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 2, $1a

; ANIM_OBJ_PARALYZED
	battleanimobj $21, $90, BATTLEANIMFRAMESET_6D, BATTLEANIMFUNC_28, 3, $19

; ANIM_OBJ_STRING_SHOT
	battleanimobj $21, $90, BATTLEANIMFRAMESET_6A, BATTLEANIMFUNC_27, 2, $1b

; ANIM_OBJ_HAZE
	battleanimobj $00, $00, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPIRAL_DESCENT, 2, $1c

; ANIM_OBJ_MIST
	battleanimobj $21, $48, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_SPIRAL_DESCENT, 2, $1c

; ANIM_OBJ_SMOG
	battleanimobj $21, $48, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPIRAL_DESCENT, 2, $1c

; ANIM_OBJ_POISON_GAS
	battleanimobj $21, $78, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_POISON_GAS, 2, $1c

; ANIM_OBJ_HORN
	battleanimobj $61, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_HORN, 2, $1d

; ANIM_OBJ_60
	battleanimobj $61, $90, BATTLEANIMFRAMESET_72, BATTLEANIMFUNC_2C, 2, $1d

; ANIM_OBJ_PETAL_DANCE
	battleanimobj $01, $48, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_2D, 4, $1e

; ANIM_OBJ_SLUDGE_BOMB
	battleanimobj $01, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_THROW_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 2, $15

; ANIM_OBJ_PAY_DAY
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_75, BATTLEANIMFUNC_2E, 7, $19

; ANIM_OBJ_64
	battleanimobj $21, $90, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 2, $14

; ANIM_OBJ_MIMIC
	battleanimobj $01, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_2F, 2, $11

; ANIM_OBJ_ATTRACT
	battleanimobj $01, $78, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_POISON_GAS, 4, $23

; ANIM_OBJ_BONEMERANG
	battleanimobj $01, $80, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_30, 2, $1f

; ANIM_OBJ_BONE_CLUB
	battleanimobj $01, $90, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 2, $1f

; ANIM_OBJ_BONE_RUSH
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_NULL, 2, $1f

; ANIM_OBJ_SWIFT
	battleanimobj $01, $80, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_08, 3, $23

; ANIM_OBJ_KINESIS
	battleanimobj $21, $90, BATTLEANIMFRAMESET_79, BATTLEANIMFUNC_NULL, 2, $1f

; ANIM_OBJ_FLASH
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, 3, $11

; ANIM_OBJ_SHINY
	battleanimobj $01, $88, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, 3, $11

; ANIM_OBJ_SKY_ATTACK
	battleanimobj $21, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_32, 2, $20

; ANIM_OBJ_LICK
	battleanimobj $21, $98, BATTLEANIMFRAMESET_7C, BATTLEANIMFUNC_NULL, 2, $04

; ANIM_OBJ_WITHDRAW
	battleanimobj $21, $80, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_NULL, 2, $18

; ANIM_OBJ_71
	battleanimobj $01, $80, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_2F, 6, $0d

; ANIM_OBJ_GROWTH
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_7E, BATTLEANIMFUNC_33, 3, $12

; ANIM_OBJ_CONVERSION2
	battleanimobj $01, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_2F, 2, $08

; ANIM_OBJ_SMOKE
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_34, 2, $1c

; ANIM_OBJ_SMOKESCREEN
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_35, 2, $15

; ANIM_OBJ_SWORDS_DANCE
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_33, 2, $14

; ANIM_OBJ_SPEED_LINE
	battleanimobj $01, $88, BATTLEANIMFRAMESET_81, BATTLEANIMFUNC_37, 2, $11

; ANIM_OBJ_SHARPEN
	battleanimobj $01, $88, BATTLEANIMFRAMESET_85, BATTLEANIMFUNC_NULL, 2, $22

; ANIM_OBJ_DEFENSE_CURL
	battleanimobj $01, $88, BATTLEANIMFRAMESET_86, BATTLEANIMFUNC_NULL, 2, $22

; ANIM_OBJ_7A
	battleanimobj $01, $90, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_39, 2, $1f

; ANIM_OBJ_7B
	battleanimobj $01, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_3A, 3, $11

; ANIM_OBJ_DISABLE
	battleanimobj $21, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_NULL, 3, $05

; ANIM_OBJ_AGILITY
	battleanimobj $a1, $88, BATTLEANIMFRAMESET_88, BATTLEANIMFUNC_3B, 6, $13

; ANIM_OBJ_HEART
	battleanimobj $01, $80, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_25, 4, $23

; ANIM_OBJ_FLAME_WHEEL
	battleanimobj $01, $98, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_34, 4, $03

; ANIM_OBJ_SACRED_FIRE
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_3C, 4, $03

; ANIM_OBJ_COTTON_SPORE
	battleanimobj $21, $68, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_SPIRAL_DESCENT, 2, $1f

; ANIM_OBJ_MILK_DRINK
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_8A, BATTLEANIMFUNC_NULL, 2, $1f

; ANIM_OBJ_ANGER
	battleanimobj $21, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_NULL, 2, $1f

; ANIM_OBJ_84
	battleanimobj $21, $50, BATTLEANIMFRAMESET_8D, BATTLEANIMFUNC_NULL, 3, $1f

; ANIM_OBJ_85
	battleanimobj $01, $40, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_40, 2, $0e

; ANIM_OBJ_BATON_PASS
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_8E, BATTLEANIMFUNC_41, 4, $1f

; ANIM_OBJ_LOCK_ON
	battleanimobj $21, $88, BATTLEANIMFRAMESET_8F, BATTLEANIMFUNC_3E, 2, $1f

; ANIM_OBJ_MIND_READER
	battleanimobj $21, $88, BATTLEANIMFRAMESET_93, BATTLEANIMFUNC_3E, 2, $1f

; ANIM_OBJ_SAFEGUARD
	battleanimobj $21, $90, BATTLEANIMFRAMESET_97, BATTLEANIMFUNC_3D, 2, $1f

; ANIM_OBJ_PROTECT
	battleanimobj $21, $90, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_3D, 3, $23

; ANIM_OBJ_THIEF
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_2E, 2, $19

; ANIM_OBJ_OCTAZOOKA
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 2, $15

; ANIM_OBJ_PRESENT
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_35, 4, $19

; ANIM_OBJ_SPIKES
	battleanimobj $21, $70, BATTLEANIMFRAMESET_8B, BATTLEANIMFUNC_3F, 2, $1f

; ANIM_OBJ_POWDER_SNOW
	battleanimobj $01, $90, BATTLEANIMFRAMESET_15, BATTLEANIMFUNC_08, 2, $0a

; ANIM_OBJ_DRAGONBREATH
	battleanimobj $01, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 4, $03

; ANIM_OBJ_CONVERSION
	battleanimobj $01, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_42, 2, $08

; ANIM_OBJ_SPIDER_WEB
	battleanimobj $01, $90, BATTLEANIMFRAMESET_9A, BATTLEANIMFUNC_NULL, 2, $1b

; ANIM_OBJ_93
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_35, 4, $23

; ANIM_OBJ_NIGHTMARE
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_23, 2, $25

; ANIM_OBJ_IN_NIGHTMARE
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9D, BATTLEANIMFUNC_25, 2, $25

; ANIM_OBJ_LOVELY_KISS
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_NULL, 2, $25

; ANIM_OBJ_SWEET_KISS
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_NULL, 6, $25

; ANIM_OBJ_SKETCH
	battleanimobj $61, $80, BATTLEANIMFRAMESET_9F, BATTLEANIMFUNC_3A, 5, $23

; ANIM_OBJ_99
	battleanimobj $21, $80, BATTLEANIMFRAMESET_A0, BATTLEANIMFUNC_16, 2, $23

; ANIM_OBJ_9A
	battleanimobj $21, $70, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_43, 3, $23

; ANIM_OBJ_DESTINY_BOND
	battleanimobj $21, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 2, $25

; ANIM_OBJ_MORNING_SUN
	battleanimobj $21, $40, BATTLEANIMFRAMESET_A3, BATTLEANIMFUNC_44, 3, $24

; ANIM_OBJ_GLIMMER
	battleanimobj $01, $80, BATTLEANIMFRAMESET_A4, BATTLEANIMFUNC_NULL, 2, $24

; ANIM_OBJ_MOONLIGHT
	battleanimobj $01, $80, BATTLEANIMFRAMESET_A5, BATTLEANIMFUNC_NULL, 3, $24

; ANIM_OBJ_HIDDEN_POWER
	battleanimobj $01, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_45, 4, $12

; ANIM_OBJ_A0
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_A6, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_A1
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_A7, BATTLEANIMFUNC_NULL, 2, $02

; ANIM_OBJ_SANDSTORM
	battleanimobj $21, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_4A, 7, $0f

; ANIM_OBJ_ZAP_CANNON
	battleanimobj $21, $90, BATTLEANIMFRAMESET_A8, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM_AND_DISAPPEAR, 3, $05

; ANIM_OBJ_SPITE
	battleanimobj $21, $40, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_11, 2, $25

; ANIM_OBJ_CURSE
	battleanimobj $61, $90, BATTLEANIMFRAMESET_A9, BATTLEANIMFUNC_46, 2, $23

; ANIM_OBJ_PERISH_SONG
	battleanimobj $00, $00, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_47, 2, $0e

; ANIM_OBJ_FORESIGHT
	battleanimobj $01, $80, BATTLEANIMFRAMESET_AA, BATTLEANIMFUNC_NULL, 2, $24

; ANIM_OBJ_RAPID_SPIN
	battleanimobj $21, $b8, BATTLEANIMFRAMESET_AB, BATTLEANIMFUNC_48, 2, $13

; ANIM_OBJ_SWAGGER
	battleanimobj $21, $90, BATTLEANIMFRAMESET_AC, BATTLEANIMFUNC_44, 2, $13

; ANIM_OBJ_AA
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_NULL, 2, $01

; ANIM_OBJ_AB
	battleanimobj $01, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_43, 2, $0e

; ANIM_OBJ_MEAN_LOOK
	battleanimobj $01, $88, BATTLEANIMFRAMESET_AD, BATTLEANIMFUNC_NULL, 6, $17

; ANIM_OBJ_AD
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_AE, BATTLEANIMFUNC_49, 2, $01

; ANIM_OBJ_AE
	battleanimobj $21, $90, BATTLEANIMFRAMESET_AF, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 3, $11

; ANIM_OBJ_RAIN
	battleanimobj $21, $00, BATTLEANIMFRAMESET_B0, BATTLEANIMFUNC_4A, 2, $04

; ANIM_OBJ_B0
	battleanimobj $00, $00, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_4B, 4, $1c

; ANIM_OBJ_PSYCH_UP
	battleanimobj $01, $88, BATTLEANIMFRAMESET_B1, BATTLEANIMFUNC_4C, 2, $19

; ANIM_OBJ_ANCIENTPOWER
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4D, 7, $09

; ANIM_OBJ_AEROBLAST
	battleanimobj $61, $98, BATTLEANIMFRAMESET_B3, BATTLEANIMFUNC_NULL, 3, $27

; ANIM_OBJ_SHADOW_BALL
	battleanimobj $61, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_ARC_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 6, $15

; ANIM_OBJ_ROCK_SMASH
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, 7, $09

; ANIM_OBJ_METALLURGY_ROCKS
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, 7, $09

; ANIM_OBJ_FLOWER
	battleanimobj $01, $90, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_08, 4, $1e

; ANIM_OBJ_COTTON
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_4F, 4, $1f

; ANIM_OBJ_PLAYERFEETFOLLOW
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B5, BATTLEANIMFUNC_NULL, 0, $28

; ANIM_OBJ_ENEMYFEETFOLLOW
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B6, BATTLEANIMFUNC_NULL, 1, $29

; ANIM_OBJ_PLAYERHEADFOLLOW
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B7, BATTLEANIMFUNC_NULL, 0, $28

; ANIM_OBJ_ENEMYHEADFOLLOW
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B8, BATTLEANIMFUNC_NULL, 1, $29

; ANIM_OBJ_GAS_YELLOW
	battleanimobj $21, $78, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_POISON_GAS, 3, $1c

; ANIM_OBJ_GAS_GREEN
	battleanimobj $21, $78, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_POISON_GAS, 5, $1c

; ANIM_OBJ_GAS_BLUE
	battleanimobj $21, $78, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_POISON_GAS, 6, $1c

; ANIM_OBJ_MOON
	battleanimobj $01, $80, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, 2, $21

; ANIM_OBJ_LAVA_POOL
	battleanimobj $21, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 3, $25

; ANIM_OBJ_BUBBLING_LAVA
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, 3, $0c

; ANIM_OBJ_ENERGY_BALL
	battleanimobj $61, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_ARC_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 5, $15

; ANIM_OBJ_HAIL
	battleanimobj $21, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_4A, 6, $0f

; ANIM_OBJ_CRYSTAL_BOLT_1
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_NULL, 6, $05

; ANIM_OBJ_CRYSTAL_BOLT_2
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_NULL, 6, $05

; ANIM_OBJ_CRYSTAL_BOLT_3
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_NULL, 6, $05

; ANIM_OBJ_BUBBLING_WATER
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, 2, $0c

; ANIM_OBJ_GAS_RED
	battleanimobj $21, $78, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_POISON_GAS, 4, $1c

; ANIM_OBJ_GHOST_FIRE_ORBIT
	battleanimobj $01, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, 6, $03

; ANIM_OBJ_GEM
	battleanimobj $01, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_MOVE_FROM_PLAYER_TO_ENEMY_BY_PARAM, 3, $0a

; ANIM_OBJ_SIGNAL_BEAM
	battleanimobj $61, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_ARC_FROM_PLAYER_TO_ENEMY_AND_DISAPPEAR, 3, $15

; ANIM_OBJ_SPRING_BUD
	battleanimobj $21, $40, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_LEECH_SEED, 5, $06
