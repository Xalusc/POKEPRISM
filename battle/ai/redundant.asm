AI_Redundant:
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld e, 3
	ld hl, .Moves
	call IsInArray
	jp c, CallLocalPointer_AfterIsInArray
	xor a
	ret

.Moves
	dbw EFFECT_SLEEP,        .Sleep
	dbw EFFECT_TOXIC,        .Toxic
	dbw EFFECT_POISON,       .Poison
	dbw EFFECT_PARALYZE,     .Paralyze
	dbw EFFECT_WILL_O_WISP,  .WillOWisp
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_FOCUS_ENERGY, .FocusEnergy
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_SUBSTITUTE,   .Substitute
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_NIGHTMARE,    .Nightmare
	dbw EFFECT_SPIKES,       .Spikes
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_HAIL,         .Hail
	dbw EFFECT_TELEPORT,     .Teleport
	dbw EFFECT_MORNING_SUN,  .MorningSun
	dbw EFFECT_SYNTHESIS,    .Synthesis
	dbw EFFECT_MOONLIGHT,    .Moonlight
	dbw EFFECT_SWAGGER,      .Swagger
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	dbw EFFECT_LAVA_POOL,    .LavaPool
	dbw EFFECT_FINAL_CHANCE, .FinalChance
	db -1

.Sleep
.Toxic
.Poison
.Paralyze
.WillOWisp
	ld a, [wBattleMonStatus]
	and a
	ret

.FinalChance
	ld a, [wPlayerSubStatus2]
	bit SUBSTATUS_FINAL_CHANCE, a
	ret

.LavaPool
	ld a, [wPlayerScreens]
	bit SCREENS_LAVA_POOL, a
	ret

.LightScreen
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.FocusEnergy
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Confuse
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Transform
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Substitute
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LeechSeed
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.Disable
	ld a, [wPlayerDisableCount]
	and a
	ret

.Encore
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.SleepTalk
	ld a, [wEnemyMonStatus]
	and SLP
.InvertZero
	jr nz, .zero
	rlca
	rrca
	ret
.zero
	cp a
	ret

.MeanLook
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret nz
	ld a, [wPlayerSubStatus2]
	bit SUBSTATUS_FINAL_CHANCE, a
	ret

.Nightmare
	ld a, [wBattleMonStatus]
	and a
	jr z, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_NIGHTMARE, a
	ret

.Spikes
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	ret

.Foresight
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Attract
	callba CheckOppositeGender
	jr c, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.Safeguard
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.RainDance
	ld a, [wWeather]
	cp WEATHER_RAIN
	jr .InvertZero

.SunnyDay
	ld a, [wWeather]
	cp WEATHER_SUN
	jr .InvertZero

.Sandstorm
	ld a, [wWeather]
	cp WEATHER_SANDSTORM
	jr .InvertZero

.Hail
	ld a, [wWeather]
	cp WEATHER_HAIL
	jr .InvertZero

.DreamEater
	ld a, [wBattleMonStatus]
	and SLP
	jr .InvertZero

.Swagger
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.FutureSight
	ld a, [wEnemyFutureSightCount]
	and a
	jr .InvertZero

.Heal
.MorningSun
.Synthesis
.Moonlight
	callba AICheckEnemyMaxHP
	jr c, .Redundant
	xor a
	ret

.Teleport
.Redundant
	rlca
	ret
