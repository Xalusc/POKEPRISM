Sfx_PokeballsPlacedOnTable:
	channel 5, Sfx_PokeballsPlacedOnTable_Ch5

Sfx_BallWiggle:
	channel 5, Sfx_BallWiggle_Ch5

Sfx_Potion:
	channel 5, Sfx_Potion_Ch5

Sfx_FullHeal:
	channel 5, Sfx_FullHeal_Ch5

Sfx_Menu:
	channel 8, Sfx_Menu_Ch8

Sfx_ReadText2:
Sfx_ReadText:
	channel 5, Sfx_ReadText2_Ch5

Sfx_Poison:
	channel 5, Sfx_Poison_Ch5

Sfx_GotSafariBalls: ; f0956
	channel 5, Sfx_GotSafariBalls_Ch5

Sfx_BootPc: ; f0959
	channel 5, Sfx_BootPc_Ch5

Sfx_ShutDownPc: ; f095c
	channel 5, Sfx_ShutDownPc_Ch5

Sfx_ChoosePcOption: ; f095f
	channel 5, Sfx_ChoosePcOption_Ch5

Sfx_EscapeRope: ; f0962
	channel 5, Sfx_EscapeRope_Ch5

Sfx_PushButton: ; f0965
	channel 5, Sfx_PushButton_Ch5

Sfx_SecondPartOfItemfinder: ; f0968
	channel 5, Sfx_SecondPartOfItemfinder_Ch5

Sfx_WarpTo: ; f096b
	channel 5, Sfx_WarpTo_Ch5

Sfx_WarpFrom: ; f096e
	channel 5, Sfx_WarpFrom_Ch5

Sfx_ChangeDexMode: ; f0971
	channel 5, Sfx_ChangeDexMode_Ch5

Sfx_JumpOverLedge: ; f0974
	channel 5, Sfx_JumpOverLedge_Ch5

Sfx_GrassRustle: ; f0977
	channel 8, Sfx_GrassRustle_Ch8

Sfx_Fly: ; f097a
	channel 8, Sfx_Fly_Ch8

Sfx_Wrong: ; f097d
	channelcount 2
	channel 5, Sfx_Wrong_Ch5
	channel 6, Sfx_Wrong_Ch6

Sfx_Squeak: ; f0983
	channel 5, Sfx_Squeak_Ch5

Sfx_Strength: ; f0986
	channel 8, Sfx_Strength_Ch8

Sfx_Boat: ; f0989
	channelcount 2
	channel 5, Sfx_Boat_Ch5
	channel 6, Sfx_Boat_Ch6

Sfx_WallOpen: ; f098f
	channel 5, Sfx_WallOpen_Ch5

Sfx_PlacePuzzlePieceDown: ; f0992
	channel 8, Sfx_PlacePuzzlePieceDown_Ch8

Sfx_EnterDoor: ; f0995
	channel 8, Sfx_EnterDoor_Ch8

Sfx_SwitchPokemon: ; f0998
	channelcount 2
	channel 5, Sfx_SwitchPokemon_Ch5
	channel 6, Sfx_SwitchPokemon_Ch6

Sfx_Tally: ; f099e
	channelcount 2
	channel 5, Sfx_Tally_Ch5
	channel 6, Sfx_Tally_Ch6

Sfx_Transaction: ; f09a4
	channelcount 2
	channel 5, Sfx_Transaction_Ch5
	channel 6, Sfx_Transaction_Ch6

Sfx_Bump: ; f09aa
	channel 5, Sfx_Bump_Ch5

Sfx_ExitBuilding: ; f09ad
	channel 8, Sfx_ExitBuilding_Ch8

Sfx_Save: ; f09b0
	channelcount 2
	channel 5, Sfx_Save_Ch5
	channel 6, Sfx_Save_Ch6

Sfx_Save_Ch5: ; f09b6
	dutycycle $2
	sound __,  3, $f1, $0700
	sound __,  2, $e1, $0600
	sound __,  2, $e1, $0680
	sound __,  2, $e1, $06c0
	sound __,  3, $e1, $0700
	sound __,  3, $e1, $07c0
	sound __, 16, $f2, $07e0
	endchannel

Sfx_Save_Ch6: ; f09d5
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  3, $a1, $0701
	sound __,  2, $91, $0601
	sound __,  2, $91, $0681
	sound __,  2, $91, $06c1
	sound __,  3, $91, $0701
	sound __,  3, $91, $07c1
	sound __, 16, $d2, $07e1
	endchannel

Sfx_Pokeflute: ; f09f8
	channel 7, Sfx_Pokeflute_Ch7

Sfx_ElevatorEnd: ; f09fb
	channel 5, Sfx_ElevatorEnd_Ch5

Sfx_ThrowBall: ; f09fe
	channelcount 2
	channel 5, Sfx_ThrowBall_Ch5
	channel 6, Sfx_ThrowBall_Ch6

Sfx_BallPoof: ; f0a04
	channelcount 2
	channel 5, Sfx_BallPoof_Ch5
	channel 8, Sfx_BallPoof_Ch8

Sfx_Unknown3A: ; f0a0a
	channelcount 2
	channel 5, Sfx_Unknown3A_Ch5
	channel 8, Sfx_Unknown3A_Ch8

Sfx_Run: ; f0a10
	channel 8, Sfx_Run_Ch8

Sfx_SlotMachineStart: ; f0a13
	channelcount 2
	channel 5, Sfx_SlotMachineStart_Ch5
	channel 6, Sfx_SlotMachineStart_Ch6

Sfx_Call: ; f0a19
	channel 5, Sfx_Call_Ch5

Sfx_Unknown60:
	channel 8, .channel

.channel
	noise __,  7, $20, $10
	noise __,  7, $2f, $40
	noise __,  7, $4f, $41
	noise __,  7, $8f, $41
	noise __,  7, $cf, $42
	noise __,  9, $d7, $42
	noise __, 16, $e7, $43
	noise __, 16, $f2, $43
	endchannel

Sfx_Unknown61:
	channel 8, .channel

.channel
	noise __,  5, $d1, $41
	endchannel

Sfx_SwitchPockets:
	channel 8, .channel

.channel
	noise __,  5, $c1, $42
	endchannel

Sfx_Unknown63:
	channel 8, .channel

.channel
	noise __,  3, $6f, $21
	noise __,  3, $af, $31
	noise __, 16, $f2, $41
	endchannel

Sfx_Burn:
	channel 8, .channel

.channel
	noise __,  3, $d2, $32
	noise __, 16, $f2, $43
	endchannel

Sfx_TitleScreenEntrance:
	channel 8, .channel

.channel
	noise __,  3, $70, $22
	noise __,  3, $80, $23
	noise __,  3, $90, $24
	noise __,  3, $a0, $25
	noise __,  3, $b0, $26
	noise __, 16, $c2, $26
	endchannel

Sfx_Unknown66:
	channel 5, .channel

.channel
	dutycycle $2
	sound __,  2, $f2, $06a0
	sound __,  2, $f2, $06e0
	sound __,  9, $f1, $0700
	endchannel

Sfx_GetCoinFromSlots:
	channel 5, .channel

.channel
	dutycycle $2
	sound __,  3, $f1, $0700
	sound __,  9, $81, $07e0
	endchannel

Sfx_PayDay:
	channelcount 2
	channel 5, .channel_5
	channel 6, .channel_6

.channel_5
	dutycycle $3
	sound __,  6, $e1, $0700
	sound __,  3, $e1, $0780
	sound __, 16, $f1, $07c0
	endchannel

.channel_6
	dutycycle $2
	sound __,  5, $c1, $06c1
	sound __,  3, $c1, $0741
	sound __, 16, $d1, $0781
	endchannel

Sfx_Metronome:
	channel 5, .channel

.channel
	dutycycle $2
	soundinput $5f
	sound __,  5, $40, $07e0
	sound __,  5, $60, $07e0
	sound __,  5, $80, $07e0
	sound __,  9, $a0, $07e0
	sound __,  9, $a0, $07e0
	sound __,  9, $80, $07e0
	sound __,  9, $60, $07e0
	sound __,  9, $30, $07e0
	sound __, 16, $12, $07e0
	soundinput $8
	endchannel

Sfx_Peck: ; f0a3d
	channel 8, Sfx_Peck_Ch8

Sfx_Kinesis: ; f0a40
	channel 5, Sfx_Kinesis_Ch5

Sfx_Lick: ; f0a43
	channel 5, Sfx_Lick_Ch5

Sfx_Pound: ; f0a46
	channel 8, Sfx_Pound_Ch8

Sfx_MovePuzzlePiece: ; f0a49
	channel 8, Sfx_MovePuzzlePiece_Ch8

Sfx_CometPunch: ; f0a4c
	channel 8, Sfx_CometPunch_Ch8

Sfx_MegaPunch: ; f0a4f
	channel 8, Sfx_MegaPunch_Ch8

Sfx_Scratch: ; f0a52
	channel 8, Sfx_Scratch_Ch8

Sfx_Vicegrip: ; f0a55
	channel 8, Sfx_Vicegrip_Ch8

Sfx_RazorWind: ; f0a58
	channel 8, Sfx_RazorWind_Ch8

Sfx_Cut: ; f0a5b
	channel 8, Sfx_Cut_Ch8

Sfx_WingAttack: ; f0a5e
	channel 8, Sfx_WingAttack_Ch8

Sfx_Whirlwind: ; f0a61
	channel 8, Sfx_Whirlwind_Ch8

Sfx_Bind: ; f0a64
	channel 8, Sfx_Bind_Ch8

Sfx_VineWhip: ; f0a67
	channel 8, Sfx_VineWhip_Ch8

Sfx_DoubleKick: ; f0a6a
	channel 8, Sfx_DoubleKick_Ch8

Sfx_MegaKick: ; f0a6d
	channel 8, Sfx_MegaKick_Ch8

Sfx_Headbutt: ; f0a70
	channel 8, Sfx_Headbutt_Ch8

Sfx_HornAttack: ; f0a73
	channel 8, Sfx_HornAttack_Ch8

Sfx_Tackle: ; f0a76
	channel 8, Sfx_Tackle_Ch8

Sfx_PoisonSting: ; f0a79
	channel 8, Sfx_PoisonSting_Ch8

Sfx_Powder: ; f0a7c
	channel 8, Sfx_Powder_Ch8

Sfx_Doubleslap: ; f0a7f
	channel 8, Sfx_Doubleslap_Ch8

Sfx_Bite: ; f0a82
	channelcount 2
	channel 5, Sfx_Bite_Ch5
	channel 8, Sfx_Bite_Ch8

Sfx_JumpKick: ; f0a88
	channel 8, Sfx_JumpKick_Ch8

Sfx_Stomp: ; f0a8b
	channel 8, Sfx_Stomp_Ch8

Sfx_TailWhip: ; f0a8e
	channel 8, Sfx_TailWhip_Ch8

Sfx_KarateChop: ; f0a91
	channel 8, Sfx_KarateChop_Ch8

Sfx_Submission: ; f0a94
	channel 8, Sfx_Submission_Ch8

Sfx_WaterGun: ; f0a97
	channelcount 2
	channel 5, Sfx_WaterGun_Ch5
	channel 8, Sfx_WaterGun_Ch8

Sfx_SwordsDance: ; f0a9d
	channel 8, Sfx_SwordsDance_Ch8

Sfx_Thunder: ; f0aa0
	channel 8, Sfx_Thunder_Ch8

Sfx_Supersonic: ; f0aa3
	channelcount 3
	channel 5, Sfx_Supersonic_Ch5
	channel 6, Sfx_Supersonic_Ch6
	channel 8, Sfx_Supersonic_Ch8

Sfx_Leer: ; f0aac
	channelcount 3
	channel 5, Sfx_Leer_Ch5
	channel 6, Sfx_Leer_Ch6
	channel 8, Sfx_Leer_Ch8

Sfx_Ember: ; f0ab5
	channelcount 2
	channel 5, Sfx_Ember_Ch5
	channel 8, Sfx_Ember_Ch8

Sfx_Bubblebeam: ; f0abb
	channelcount 3
	channel 5, Sfx_Bubblebeam_Ch5
	channel 6, Sfx_Bubblebeam_Ch6
	channel 8, Sfx_Bubblebeam_Ch8

Sfx_HydroPump: ; f0ac4
	channelcount 2
	channel 5, Sfx_HydroPump_Ch5
	channel 8, Sfx_HydroPump_Ch8

Sfx_Surf: ; f0aca
	channelcount 3
	channel 5, Sfx_Surf_Ch5
	channel 6, Sfx_Surf_Ch6
	channel 8, Sfx_Surf_Ch8

Sfx_Psybeam: ; f0ad3
	channelcount 3
	channel 5, Sfx_Psybeam_Ch5
	channel 6, Sfx_Psybeam_Ch6
	channel 8, Sfx_Psybeam_Ch8

Sfx_Charge: ; f0adc
	channelcount 3
	channel 5, Sfx_Charge_Ch5
	channel 6, Sfx_Charge_Ch6
	channel 8, Sfx_Charge_Ch8

Sfx_Thundershock: ; f0ae5
	channelcount 3
	channel 5, Sfx_Thundershock_Ch5
	channel 6, Sfx_Thundershock_Ch6
	channel 8, Sfx_Thundershock_Ch8

Sfx_Psychic: ; f0aee
	channelcount 3
	channel 5, Sfx_Psychic_Ch5
	channel 6, Sfx_Psychic_Ch6
	channel 8, Sfx_Psychic_Ch8

Sfx_Screech: ; f0af7
	channelcount 2
	channel 5, Sfx_Screech_Ch5
	channel 6, Sfx_Screech_Ch6

Sfx_BoneClub: ; f0afd
	channelcount 2
	channel 5, Sfx_BoneClub_Ch5
	channel 6, Sfx_BoneClub_Ch6

Sfx_Sharpen: ; f0b03
	channelcount 2
	channel 5, Sfx_Sharpen_Ch5
	channel 6, Sfx_Sharpen_Ch6

Sfx_EggBomb: ; f0b09
	channelcount 3
	channel 5, Sfx_EggBomb_Ch5
	channel 6, Sfx_EggBomb_Ch6
	channel 8, Sfx_EggBomb_Ch8

Sfx_Sing: ; f0b12
	channelcount 2
	channel 5, Sfx_Sing_Ch5
	channel 6, Sfx_Sing_Ch6

Sfx_HyperBeam:
	channelcount 3
	channel 5, .channel_5
	channel 6, .channel_6
	channel 8, .channel_8

.channel_5
	dutycycle $0
	sound __,  3, $f1, $0780
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $0790
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07a0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07b0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07c0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07d0
.channel_5_loop
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07e0
	loopchannel 12, .channel_5_loop
	sound __, 16, $f1, $0700
	endchannel

.channel_6
	sound_duty 3, 0, 3, 2
	sound __,  3, $f1, $0781
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $0791
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07a1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07b1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07c1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07d1
.channel_6_loop
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07e1
	loopchannel 12, .channel_6_loop
	sound __, 16, $f1, $0701
	endchannel

.channel_8
	noise __,  2, $d1, $49
	noise __,  2, $d1, $29
	loopchannel 26, .channel_8
	endchannel

Sfx_Shine: ; f0b21
	channel 5, Sfx_Shine_Ch5

Sfx_Unknown5F: ; f0b24
	channelcount 3
	channel 5, Sfx_Unknown5F_Ch5
	channel 6, Sfx_Unknown5F_Ch6
Sfx_Sandstorm: ; f0b2a
	channel 8, Sfx_Sandstorm_Ch8

Sfx_HangUp: ; f0b2d
	channel 5, Sfx_HangUp_Ch5

Sfx_NoSignal: ; f0b30
	channel 5, Sfx_NoSignal_Ch5

Sfx_Elevator:
	channelcount 4
	channel 5, .channel_5
	channel 6, .channel_6_7
	channel 7, .channel_6_7
	channel 8, .channel_8

.channel_5
	dutycycle $2
	soundinput $5a
.loop
	sound __,  3, $f1, $0300
	loopchannel 48, .loop
	soundinput $8
	dutycycle $2
	sound __, 16, $f3, $0730
	sound __,  9, $65, $0730
	sound __, 16, $f4, $0700
	sound __, 16, $74, $0700
	sound __, 16, $44, $0700
	sound __, 16, $24, $0700
	endchannel

.channel_6_7
	sound F_,  1, $0, 0
	sound E_,  4, $0, 0
	endchannel

.channel_8
	noise F_,  1, $0, $0
	noise E_,  4, $0, $0
	endchannel

Sfx_DexFanfare5079: ; f0b3f
Sfx_LevelUp: ; f0b3f
	channelcount 4
	channel 5, Sfx_DexFanfare5079_Ch5
	channel 6, Sfx_DexFanfare5079_Ch6
	channel 7, Sfx_DexFanfare5079_Ch7
	channel 8, Sfx_DexFanfare5079_Ch8

Sfx_DexFanfare5079_Ch5: ; f0b4b
Sfx_LevelUp_Ch5: ; f0b4b
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $8, $b1
	octave 3
	note B_, 2
	note B_, 2
	note B_, 2
	intensity $b3
	octave 4
	note G#, 12
	endchannel

Sfx_DexFanfare5079_Ch6: ; f0b5f
Sfx_LevelUp_Ch6: ; f0b5f
	togglesfx
	dutycycle $2
	notetype $8, $c1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	intensity $c3
	note B_, 12
	endchannel

Sfx_DexFanfare5079_Ch7: ; f0b6d
Sfx_LevelUp_Ch7: ; f0b6d
	togglesfx
	notetype $8, $25
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 5
	note E_, 5
	intensity $35
	note E_, 3
	note __, 4
	endchannel

Sfx_DexFanfare5079_Ch8: ; f0b7f
Sfx_LevelUp_Ch8: ; f0b7f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 12
	endchannel

Sfx_KeyItem: ; f0b86
	channelcount 4
	channel 5, Sfx_KeyItem_Ch5
	channel 6, Sfx_KeyItem_Ch6
	channel 7, Sfx_KeyItem_Ch7
	channel 8, Sfx_KeyItem_Ch8

Sfx_KeyItem_Ch5: ; f0b92
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $6, $b1
	octave 3
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 4
	octave 4
	note E_, 4
	intensity $b3
	note G#, 16
	endchannel

Sfx_KeyItem_Ch6: ; f0ba8
	togglesfx
	dutycycle $2
	notetype $6, $c1
	octave 4
	note E_, 4
	note E_, 2
	note E_, 2
	note E_, 4
	note G#, 4
	intensity $c3
	note B_, 16
	endchannel

Sfx_KeyItem_Ch7: ; f0bb8
	togglesfx
	notetype $6, $25
	octave 4
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 5
	note E_, 8
	intensity $35
	note E_, 4
	note __, 4
	endchannel

Sfx_KeyItem_Ch8: ; f0bce
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	endchannel

Sfx_DexFanfare2049: ; f0bd5
	channelcount 4
	channel 5, Sfx_DexFanfare2049_Ch5
	channel 6, Sfx_DexFanfare2049_Ch6
	channel 7, Sfx_DexFanfare2049_Ch7
	channel 8, Sfx_DexFanfare2049_Ch8

Sfx_DexFanfare2049_Ch5: ; f0be1
	togglesfx
	tempo 104
	volume $77
	dutycycle $2
	notetype $c, $88
	octave 3
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A#, 2
	note __, 2
	note A_, 2
	note __, 6
	endchannel

Sfx_DexFanfare2049_Ch6: ; f0bfe
	togglesfx
	dutycycle $2
	notetype $c, $c1
	octave 5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 8
	endchannel

Sfx_DexFanfare2049_Ch7: ; f0c13
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 6
	endchannel

Sfx_DexFanfare2049_Ch8: ; f0c27
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel

Sfx_Item: ; f0c2f
	channelcount 4
	channel 5, Sfx_Item_Ch5
	channel 6, Sfx_Item_Ch6
	channel 7, Sfx_Item_Ch7
	channel 8, Sfx_Item_Ch8

Sfx_Item_Ch5: ; f0c3b
	togglesfx
	tempo 108
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b2
	octave 4
	note C_, 6
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note G_, 4
	note G_, 4
	note F_, 12
	note __, 12
	endchannel

Sfx_Item_Ch6: ; f0c54
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $8, $c3
	octave 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A_, 12
	note __, 12
	endchannel

Sfx_Item_Ch7: ; f0c68
	togglesfx
	notetype $8, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 6
	intensity $35
	note F_, 4
	note __, 14
	endchannel

Sfx_Item_Ch8: ; f0c81
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel

Sfx_CaughtMon: ; f0c89
	channelcount 4
	channel 5, Sfx_CaughtMon_Ch5
	channel 6, Sfx_CaughtMon_Ch6
	channel 7, Sfx_CaughtMon_Ch7
	channel 8, Sfx_CaughtMon_Ch8

Sfx_CaughtMon_Ch5: ; f0c95
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b3
	octave 4
	note C_, 6
	octave 3
	note A_, 6
	note F_, 12
	intensity $b1
	octave 4
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note G_, 2
	intensity $b3
	note F_, 12
	endchannel

Sfx_CaughtMon_Ch6: ; f0cb5
	togglesfx
	dutycycle $2
	vibrato $8, $27
	notetype $8, $c3
	octave 4
	note A_, 6
	note F_, 6
	note C_, 12
	intensity $c1
	note A#, 2
	note A#, 2
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	intensity $c3
	note A_, 12
	endchannel

Sfx_CaughtMon_Ch7: ; f0cce
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 12
	note C_, 6
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note G_, 6
	note A#, 6
	note A_, 6
	intensity $35
	note A_, 3
	note __, 3
	endchannel

Sfx_CaughtMon_Ch8: ; f0ce2
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel

Sfx_DexFanfare80109: ; f0cea
	channelcount 4
	channel 5, Sfx_DexFanfare80109_Ch5
	channel 6, Sfx_DexFanfare80109_Ch6
	channel 7, Sfx_DexFanfare80109_Ch7
	channel 8, Sfx_DexFanfare80109_Ch8

Sfx_DexFanfare80109_Ch5: ; f0cf6
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	octave 3
	note A#, 2
	note A#, 1
	note A#, 1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	note F_, 2
	note F_, 1
	note F_, 1
	intensity $a5
	note A#, 16
	endchannel

Sfx_DexFanfare80109_Ch6: ; f0d17
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note G_, 2
	note G_, 1
	note G_, 1
	note D#, 2
	note D#, 1
	note D#, 1
	note G#, 2
	note G#, 1
	note G#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	octave 5
	note D#, 16
	endchannel

Sfx_DexFanfare80109_Ch7: ; f0d32
	togglesfx
	notetype $c, $25
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	note C_, 2
	note D_, 1
	note __, 1
	octave 3
	note A#, 2
	note D#, 4
	intensity $35
	note D#, 3
	note __, 9
	endchannel

Sfx_DexFanfare80109_Ch8: ; f0d4e
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel

Sfx_Fanfare2:
	channelcount 3
	channel 5, .channel_5
	channel 6, .channel_6
	channel 8, .channel_8

.channel_5
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	tone $0001
	dutycycle $3
	notetype $6, $b5
	octave 3
	note G#, 4
	notetype $4, $b2
	note F_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	octave 4
	note C_, 4
	note C_, 2
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel

.channel_6
	togglesfx
	dutycycle $2
	notetype $6, $c5
	octave 4
	note C#, 6
	notetype $4, $c1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $4, $c2
	note D#, 2
	note C#, 2
	note D#, 2
	note E_, 4
	note E_, 2
	notetype $4, $c6
	note F_, 12
	endchannel

.channel_8
	togglesfx
	notetype $6
	note C_, 1
	octave 5
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	notetype $4
	note C_, 1
	note C#, 2
	note __, 2
	note C#, 2
	note D#, 2
	note __, 2
	note F_, 2
	note G#, 6
	endchannel

UnknownSfx:
	channelcount 4
	channel 5, .channel_5
	channel 6, .channel_6
	channel 7, .channel_7
	channel 8, .channel_8

.channel_5
	togglesfx
	tempo 124
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note F_, 2
	note F_, 1
	note F_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note E_, 2
	note G_, 1
	note G_, 1
	note C_, 2
	note E_, 1
	note E_, 1
	intensity $a5
	note F_, 16
	endchannel

.channel_6
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note A_, 2
	note A_, 1
	note A_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	octave 5
	note C_, 2
	note C_, 1
	note C_, 1
	octave 4
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	note A_, 16
	endchannel

.channel_7
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 8
	note C_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	note A_, 4
	intensity $35
	note A_, 3
	note __, 9
	endchannel

.channel_8
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel

Sfx_Fanfare:
	channelcount 3
	channel 5, .channel_5
	channel 6, .channel_6
	channel 8, .channel_8

.channel_5
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	dutycycle $3
	tone $0001
	notetype $6, $b3
	octave 3
	note F_, 4
	note C#, 4
	note F#, 4
	note D#, 4
	note G#, 4
	note F_, 4
	note A#, 4
	note F#, 4
	notetype $4, $b3
	note A#, 4
	note B_, 4
	octave 4
	note C_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel

.channel_6
	togglesfx
	dutycycle $2
	notetype $6, $c4
	octave 4
	note C#, 4
	notetype $4, $c4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note D#, 6
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F_, 6
	note F_, 2
	note C#, 2
	note F_, 2
	note F#, 6
	note F#, 2
	note D#, 2
	note F#, 2
	note C#, 4
	note D#, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G#, 4
	notetype $4, $c6
	note F#, 12
	endchannel

.channel_8
	togglesfx
	notetype $6
	note C_, 1
	octave 4
	note A#, 4
	note __, 4
	note B_, 4
	note __, 4
	octave 5
	note C#, 4
	note __, 4
	note D#, 4
	note __, 4
	notetype $4
	note C_, 1
	note F_, 4
	note D#, 4
	note C#, 4
	note A#, 4
	note G#, 4
	note F_, 4
	note F#, 6
	endchannel

Sfx_RegisterPhoneNumber: ; f0dc7
	channelcount 4
	channel 5, Sfx_RegisterPhoneNumber_Ch5
	channel 6, Sfx_RegisterPhoneNumber_Ch6
	channel 7, Sfx_RegisterPhoneNumber_Ch7
	channel 8, Sfx_RegisterPhoneNumber_Ch8

Sfx_RegisterPhoneNumber_Ch5: ; f0dd3
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	notetype $c, $a2
	note __, 2
	octave 3
	note C_, 4
	note G#, 4
	octave 4
	note C_, 2
	octave 3
	note F_, 1
	note G#, 2
	note C_, 1
	note F_, 2
	note A#, 3
	octave 4
	note C#, 3
	note C_, 2
	note __, 8
	endchannel

Sfx_RegisterPhoneNumber_Ch6: ; f0df0
	togglesfx
	dutycycle $3
	notetype $c, $c2
	note __, 2
	octave 4
	note D#, 2
	note C#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note __, 1
	note G#, 3
	octave 5
	note C_, 2
	note D#, 3
	octave 4
	note G_, 3
	note G#, 2
	note __, 8
	endchannel

Sfx_RegisterPhoneNumber_Ch7: ; f0e08
	togglesfx
	notetype $c, $25
	note __, 2
	octave 3
	note D#, 7
	note __, 1
	note G#, 2
	note __, 1
	note C_, 2
	note __, 1
	note G#, 2
	note G_, 2
	note __, 1
	note A#, 3
	note G#, 2
	note __, 8
	endchannel

Sfx_RegisterPhoneNumber_Ch8: ; f0e1c
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 2
	note __, 16
	note __, 16
	endchannel

Sfx_3RdPlace: ; f0e26
	channelcount 3
	channel 5, Sfx_3RdPlace_Ch5
	channel 6, Sfx_3RdPlace_Ch6
	channel 7, Sfx_3RdPlace_Ch7

Sfx_3RdPlace_Ch5: ; f0e2f
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $c, $a4
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note D_, 6
	endchannel

Sfx_3RdPlace_Ch6: ; f0e45
	togglesfx
	dutycycle $2
	notetype $c, $b4
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	note G_, 6
	endchannel

Sfx_3RdPlace_Ch7: ; f0e56
	togglesfx
	notetype $c, $25
	octave 3
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note B_, 6
	endchannel

Sfx_GetEggFromDaycareLady: ; f0e66
Sfx_GetEggFromDaycareMan: ; f0e66
	channelcount 4
	channel 5, Sfx_GetEggFromDaycareLady_Ch5
	channel 6, Sfx_GetEggFromDaycareLady_Ch6
	channel 7, Sfx_GetEggFromDaycareLady_Ch7
	channel 8, Sfx_GetEggFromDaycareLady_Ch8

Sfx_GetEggFromDaycareLady_Ch5: ; f0e72
Sfx_GetEggFromDaycareMan_Ch5: ; f0e72
	togglesfx
	tempo 120
	volume $77
	vibrato $12, $34
	dutycycle $2
	notetype $8, $a1
	note __, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	intensity $a2
	note F_, 6
	intensity $a1
	dutycycle $3
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	intensity $a4
	note F_, 9
	note __, 9
	endchannel

	togglesfx

Sfx_GetEggFromDaycareLady_Ch6: ; f0e9b
Sfx_GetEggFromDaycareMan_Ch6: ; f0e9b
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c2
	note __, 2
	octave 4
	note F_, 2
	note __, 2
	note A_, 2
	intensity $c1
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $c2
	octave 5
	note C_, 6
	intensity $c1
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $c4
	note A_, 9
	note __, 9
	endchannel

	togglesfx

Sfx_GetEggFromDaycareLady_Ch7: ; f0ebe
Sfx_GetEggFromDaycareMan_Ch7: ; f0ebe
	togglesfx
	notetype $8, $25
	note __, 2
	octave 3
	note C_, 6
	octave 2
	note A#, 6
	octave 3
	note C_, 2
	note F_, 2
	note G_, 2
	note A#, 6
	note A_, 9
	note __, 9
	endchannel

	togglesfx

Sfx_GetEggFromDaycareLady_Ch8: ; f0ed0
Sfx_GetEggFromDaycareMan_Ch8: ; f0ed0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note __, 2
	notetype $c
	note __, 16
	note __, 12
	endchannel

	togglesfx

Sfx_MoveDeleted: ; f0edc
	channelcount 4
	channel 5, Sfx_MoveDeleted_Ch5
	channel 6, Sfx_MoveDeleted_Ch6
	channel 7, Sfx_MoveDeleted_Ch7
	channel 8, Sfx_MoveDeleted_Ch8

Sfx_MoveDeleted_Ch5: ; f0ee8
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $44
	notetype $c, $a4
	note __, 8
	octave 2
	note G_, 1
	note __, 2
	note C#, 1
	note E_, 1
	note D#, 1
	note E_, 4
	intensity $a1
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note G#, 2
	note B_, 2
	intensity $a6
	octave 3
	note D_, 10
	note __, 6
	endchannel

	togglesfx

Sfx_MoveDeleted_Ch6: ; f0f0d
	togglesfx
	dutycycle $3
	vibrato $c, $44
	notetype $c, $74
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F_, 1
	note G#, 1
	intensity $94
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	intensity $b4
	octave 3
	note C#, 1
	note __, 2
	octave 2
	note A#, 1
	octave 3
	note C#, 4
	note __, 2
	intensity $b1
	note C#, 2
	note D#, 2
	note E_, 2
	intensity $b6
	note F_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_MoveDeleted_Ch7: ; f0f37
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 8
	note A_, 8
	note A#, 2
	note __, 4
	note A#, 1
	note __, 1
	note A#, 8
	note __, 4
	octave 3
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 2
	notetype $c, $20
	note B_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_MoveDeleted_Ch8: ; f0f53
	togglesfx
	sfxtogglenoise $3
	notetype $c
	note F_, 8
	note __, 16
	note __, 16
	note __, 6
	endchannel

	togglesfx

Sfx_2ndPlace: ; f0f5e
	channelcount 4
	channel 5, Sfx_2ndPlace_Ch5
	channel 6, Sfx_2ndPlace_Ch6
	channel 7, Sfx_2ndPlace_Ch7
	channel 8, Sfx_2ndPlace_Ch8

Sfx_2ndPlace_Ch5: ; f0f6a
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $34
	notetype $8, $a1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $a7
	note B_, 12
	note __, 6
	endchannel

	togglesfx

Sfx_2ndPlace_Ch6: ; f0f92
	togglesfx
	dutycycle $2
	notetype $8, $b1
	octave 4
	note G_, 2
	note G_, 2
	note G_, 2
	note A_, 4
	note B_, 2
	intensity $b4
	octave 5
	note C_, 12
	intensity $b1
	note C_, 2
	note C_, 2
	note C_, 2
	intensity $b7
	note D_, 12
	note __, 6
	endchannel

	togglesfx

Sfx_2ndPlace_Ch7: ; f0fad
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note G_, 12
	note __, 6
	endchannel

	togglesfx

Sfx_2ndPlace_Ch8: ; f0fd2
	togglesfx
	sfxtogglenoise $3
	notetype $8
Sfx_2ndPlace_branch_f0fd7: ; f0fd7
	note C#, 1
	loopchannel 6, Sfx_2ndPlace_branch_f0fd7
	note B_, 12
	note B_, 12
	note B_, 12
	note __, 6
	endchannel

	togglesfx

Sfx_1stPlace: ; f0fe2
	channelcount 4
	channel 5, Sfx_1stPlace_Ch5
	channel 6, Sfx_1stPlace_Ch6
	channel 7, Sfx_1stPlace_Ch7
	channel 8, Sfx_1stPlace_Ch8

Sfx_1stPlace_Ch5: ; f0fee
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	vibrato $c, $34
	notetype $c, $a1
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	intensity $91
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note A#, 1
	intensity $81
	octave 5
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note D_, 1
	intensity $a1
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $a7
	note A_, 10
	note __, 6
	endchannel

	togglesfx

Sfx_1stPlace_Ch6: ; f1020
	togglesfx
	dutycycle $3
	vibrato $c, $34
	notetype $c, $c1
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	intensity $b6
	octave 4
	note D_, 12
	intensity $c1
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	intensity $b7
	note D_, 10
	note __, 6
	endchannel

	togglesfx

Sfx_1stPlace_Ch7: ; f103d
	togglesfx
	notetype $c, $25
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 6
	note F_, 6
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 10
	note __, 6
	endchannel

	togglesfx

Sfx_1stPlace_Ch8: ; f1054
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note D_, 4
	note D_, 4
	note B_, 12
	note B_, 10
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	notetype $c
	note B_, 10
	note __, 6
	endchannel

	togglesfx

Sfx_ChooseACard:
	channelcount 4
	channel 5, Sfx_ChooseACard_Ch5
	channel 6, Sfx_ChooseACard_Ch6
	channel 7, Sfx_ChooseACard_Ch7
	channel 8, Sfx_ChooseACard_Ch8

Sfx_ChooseACard_Ch5: ; f1075
	togglesfx
	tempo 152
	volume $77
	dutycycle $3
	notetype $6, $a4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note C#, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note D_, 4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note E_, 4
	intensity $71
	octave 3
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	intensity $91
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note D#, 1
	intensity $a4
	note E_, 4
	note __, 12
	endchannel

	togglesfx

Sfx_ChooseACard_Ch6: ; f10a9
	togglesfx
	dutycycle $3
	notetype $6, $b4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note F_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note G_, 4
	note G#, 8
	note A_, 4
	note __, 12
	endchannel

	togglesfx

Sfx_ChooseACard_Ch7: ; f10c9
	togglesfx
	notetype $6, $25
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 2
	note A_, 4
	note __, 12
	endchannel

	togglesfx

Sfx_ChooseACard_Ch8: ; f10ec
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note B_, 16
	endchannel

	togglesfx

Sfx_GetTm: ; f1104
	channelcount 4
	channel 5, Sfx_GetTm_Ch5
	channel 6, Sfx_GetTm_Ch6
	channel 7, Sfx_GetTm_Ch7
	channel 8, Sfx_GetTm_Ch8

Sfx_GetTm_Ch5: ; f1110
	togglesfx
	tempo 144
	volume $77
	dutycycle $3
	vibrato $8, $24
	notetype $c, $a3
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note G_, 6
	intensity $b1
	note E_, 2
	note F#, 2
	note G_, 2
	intensity $a5
	note F#, 8
	note __, 6
	endchannel

	togglesfx

Sfx_GetTm_Ch6: ; f1131
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $c, $b3
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	note G_, 1
	note B_, 6
	intensity $c1
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	intensity $b5
	note D_, 8
	note __, 6
	endchannel

	togglesfx

Sfx_GetTm_Ch7: ; f114c
	togglesfx
	notetype $6, $25
	octave 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note C_, 4
	octave 2
	note A_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_GetTm_Ch8: ; f116a
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note C#, 2
	note D_, 2
	note B_, 8
	note D_, 4
	note C#, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note D_, 2
	note B_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_GetBadge: ; f117d
	channelcount 4
	channel 5, Sfx_GetBadge_Ch5
	channel 6, Sfx_GetBadge_Ch6
	channel 7, Sfx_GetBadge_Ch7
	channel 8, Sfx_GetBadge_Ch8

Sfx_GetBadge_Ch5: ; f1189
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	vibrato $8, $24
	notetype $6, $92
	octave 4
	note F_, 3
	callchannel Sfx_GetBadge_branch_f11aa
	note A#, 3
	forceoctave $2
	callchannel Sfx_GetBadge_branch_f11aa
	forceoctave $0
	intensity $a7
	note A_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_GetBadge_branch_f11aa: ; f11aa
	note __, 5
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	endchannel

Sfx_GetBadge_Ch6: ; f11be
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $6, $b5
	octave 5
	note C#, 3
	note __, 3
	octave 4
	note G#, 1
	note __, 1
	note G#, 8
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 1
	intensity $95
	octave 5
	note C_, 1
	intensity $b5
	note C#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 3
	note __, 3
	octave 4
	note A#, 1
	note __, 1
	note A#, 8
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 1
	intensity $95
	octave 5
	note D_, 1
	intensity $b5
	note D#, 8
	note F_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_GetBadge_Ch7: ; f11f5
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 3
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note C#, 8
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	note G#, 2
	note G_, 3
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	note D#, 8
	note A#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D#, 2
	note F_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_GetBadge_Ch8: ; f121b
	togglesfx
	sfxtogglenoise $4
	notetype $6
Sfx_GetBadge_branch_f1220: ; f1220
	note B_, 12
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_GetBadge_branch_f1220
	note B_, 16
	note __, 6
	endchannel

	togglesfx

Sfx_QuitSlots: ; f1236
	channelcount 4
	channel 5, Sfx_QuitSlots_Ch5
	channel 6, Sfx_QuitSlots_Ch6
	channel 7, Sfx_QuitSlots_Ch7
	channel 8, Sfx_QuitSlots_Ch8

Sfx_QuitSlots_Ch5: ; f1242
	togglesfx
	tempo 144
	volume $77
	dutycycle $2
	notetype $8, $82
	octave 3
	note G#, 2
	note __, 4
	note C#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note G#, 2
	octave 4
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	note G#, 2
	note F#, 2
	intensity $97
	note G#, 14
	note __, 6
	endchannel

	togglesfx

Sfx_QuitSlots_Ch6: ; f1266
	togglesfx
	dutycycle $2
	notetype $8, $b3
	note __, 3
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note G#, 4
	note A#, 2
	intensity $c1
	note B_, 4
	note A#, 2
	note G#, 4
	note F_, 2
	note F#, 4
	note F_, 2
	note D#, 4
	intensity $b7
	note F_, 14
	note __, 6
	endchannel

	togglesfx

Sfx_QuitSlots_Ch7: ; f1283
	togglesfx
	notetype $8, $25
	octave 3
	note C#, 2
	note __, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note G#, 2
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note G#, 2
	note B_, 2
	octave 3
	note D_, 2
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note __, 2
	note C#, 14
	note __, 6
	endchannel

	togglesfx

Sfx_QuitSlots_Ch8: ; f12a1
	togglesfx
	sfxtogglenoise $3
	notetype $8
	note D#, 6
	note D_, 4
	note D#, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note B_, 14
	note __, 6
	endchannel

	togglesfx

Sfx_Protect: ; f12b4
	channelcount 2
	channel 5, Sfx_Protect_Ch5
	channel 8, Sfx_Protect_Ch8

Sfx_Protect_Ch5: ; f12ba
	togglesfx
	notetype $1, $f1
	dutycycle $0
Sfx_Protect_branch_f12c0: ; f12c0
	octave 5
	note F_, 5
	note A_, 5
	octave 6
	note C_, 5
	note E_, 5
	octave 5
	note F#, 5
	note A#, 5
	octave 6
	note C#, 5
	note E_, 5
	loopchannel 3, Sfx_Protect_branch_f12c0
	intensity $c1
	octave 5
	note F_, 5
	note A_, 5
	intensity $91
	octave 6
	note C_, 5
	note E_, 5
	intensity $71
	octave 5
	note F#, 5
	note A#, 5
	intensity $51
	octave 6
	note C#, 5
	note E_, 5
	endchannel

Sfx_Protect_Ch8: ; f12e5
Sfx_Protect_branch_f12e5: ; f12e5
	noise __, 10, $9e, $0
	noise __, 10, $be, $11
	loopchannel 6, Sfx_Protect_branch_f12e5
	noise __, 10, $a7, $0
	noise C_,  1, $75, $11
	endchannel

Sfx_Sketch: ; f12f6
	channel 5, Sfx_Sketch_Ch5

Sfx_Sketch_Ch5: ; f12f9
	dutycycle $1
	soundinput $a5
Sfx_Sketch_branch_f12fd: ; f12fd
	sound __,  3, $f1, $06e0
	sound __, 14, $af, $05b0
	sound __,  5, $0, 0
	sound __, 10, $f4, $0718
	loopchannel 3, Sfx_Sketch_branch_f12fd
	soundinput $8
	endchannel

Sfx_RainDance: ; f1314
	channel 8, Sfx_RainDance_Ch8

Sfx_RainDance_Ch8: ; f1317
Sfx_RainDance_branch_f1317: ; f1317
	noise __, 12, $7d, $50
	noise __,  7, $7d, $4f
	noise __, 12, $7f, $47
	noise __, 16, $6e, $22
	loopchannel 3, Sfx_RainDance_branch_f1317
	noise __,  7, $6d, $50
	noise __,  6, $5d, $4f
	noise __,  6, $4f, $47
	noise __, 11, $32, $46
	endchannel

Sfx_Aeroblast: ; f1334
	channelcount 2
	channel 5, Sfx_Aeroblast_Ch5
	channel 8, Sfx_Aeroblast_Ch8

Sfx_Aeroblast_Ch5: ; f133a
	sound_duty 2, 0, 3, 3
	soundinput $f5
	sound C_, 13, $f8, $0580
	soundinput $8
	endchannel

Sfx_Aeroblast_Ch8: ; f1345
	noise __,  5, $f8, $6c
	noise __,  5, $c8, $5c
	noise __,  5, $78, $5b
	noise C_,  1, $31, $5a
	endchannel

Sfx_Spark: ; f1352
	channel 8, Sfx_Spark_Ch8

Sfx_Spark_Ch8: ; f1355
Sfx_Spark_branch_f1355: ; f1355
	noise __,  5, $f8, $5d
	noise __,  5, $d8, $6f
	loopchannel 2, Sfx_Spark_branch_f1355
	endchannel

Sfx_Curse: ; f1360
	channelcount 2
	channel 5, Sfx_Curse_Ch5
	channel 8, Sfx_Curse_Ch8

Sfx_Curse_Ch5: ; f1366
	dutycycle $3
	sound __,  5, $f2, $0483
	sound __,  5, $f2, $0511
	sound __,  5, $f2, $0589
	sound __,  5, $f2, $05ed
	endchannel

Sfx_Curse_Ch8: ; f1379
	noise C_,  5, $9a, $9
	endchannel

Sfx_Rage: ; f137d
	channelcount 2
	channel 5, Sfx_Rage_Ch5
	channel 8, Sfx_Rage_Ch8

Sfx_Rage_Ch5: ; f1383
	dutycycle $0
	sound __,  4, $d1, $07b0
	sound __,  4, $d1, $07c2
	sound C_,  9, $d2, $07d5
	endchannel

Sfx_Rage_Ch8: ; f1392
	noise __,  4, $f4, $1a
	noise __,  4, $f4, $19
	noise C_,  9, $f2, $18
	endchannel

Sfx_Thief:
	channel 8, .channel

.channel
	noise __,  1, $0, $0
	noise __,  5, $e1, $12
	noise __,  1, $0, $0
	noise __,  3, $b1, $22
	loopchannel 2, .channel
	endchannel

Sfx_Thief2: ; f13b0
	channel 5, Sfx_Thief2_Ch5

Sfx_Thief2_Ch5: ; f13b3
	togglesfx
	notetype $2, $f4
	dutycycle $0
	octave 4
	note C#, 3
	note A#, 3
	intensity $d2
	note C#, 3
	note A#, 3
	intensity $b1
	note C_, 3
	note A_, 3
	intensity $81
	note C_, 3
	note A_, 3
	togglesfx
	endchannel

Sfx_SpiderWeb: ; f13ca
	channelcount 2
	channel 5, Sfx_SpiderWeb_Ch5
	channel 8, Sfx_SpiderWeb_Ch8

Sfx_SpiderWeb_Ch5: ; f13d0
	dutycycle $0
	sound C#,  1, $7f, $0720
	soundinput $95
	sound __,  5, $f8, $0620
	sound __,  5, $e8, $0630
	sound __,  5, $d8, $0640
	sound __,  5, $95, $0620
	sound __,  5, $73, $0630
	sound __,  5, $51, $0640
	soundinput $8
	endchannel

Sfx_SpiderWeb_Ch8: ; f13f3
	noise C#,  1, $ef, $0
	endchannel

Sfx_MindReader: ; f13f7
	channelcount 2
	channel 5, Sfx_MindReader_Ch5
	channel 8, Sfx_MindReader_Ch8

Sfx_MindReader_Ch5: ; f13fd
	togglesfx
	dutycycle $2
	notetype $2, $f1
	octave 5
	note C_, 3
	intensity $41
	note C_, 3
	intensity $f1
	note C#, 3
	intensity $41
	note C#, 3
	intensity $f1
	note D_, 3
	intensity $41
	note D_, 3
	togglesfx
	endchannel

Sfx_MindReader_Ch8: ; f1416
	noise C_,  2, $af, $19
	noise C_,  3, $af, $18
	endchannel

Sfx_Nightmare:
	channel 5, .channel

.channel
	dutycycle $0
	soundinput $34
.loop
	sound __,  4, $ba, $0631
	sound __,  3, $0, 0
	sound __,  4, $f8, $0621
	sound __,  3, $0, 0
	sound __,  4, $f8, $0611
	sound __,  3, $0, 0
	sound __,  4, $e8, $0601
	sound __,  3, $0, 0
	sound __,  4, $e8, $05f1
	sound __,  3, $0, 0
	loopchannel 2, .loop
	soundinput $8
	endchannel

Sfx_Snore:
	channel 8, .channel

.channel
	noise __,  3, $ea, $4b
	noise __,  3, $ea, $5b
	noise __,  3, $0, $0
	noise __,  5, $ee, $47
	noise __,  5, $ee, $46
	noise __,  5, $ee, $45
	endchannel

Sfx_SweetKiss:
	channel 5, .channel

.channel
	dutycycle $2
.loop
	sound __,  3, $c1, $07c8
	sound __,  3, $d1, $07da
	loopchannel 2, .loop
	sound C_, 11, $f1, $07e2
	endchannel

Sfx_SweetKiss2: ; f147f
	channel 5, Sfx_SweetKiss2_Ch5

Sfx_SweetKiss2_Ch5: ; f1482
	dutycycle $0
	soundinput $97
	sound __,  3, $f4, $0772
	sound __,  5, $0, 0
	sound __,  3, $c4, $0772
	sound __,  5, $0, 0
	sound __,  3, $b4, $0772
	sound __,  5, $0, 0
	sound __,  3, $a1, $0772
	soundinput $8
	endchannel

Sfx_BellyDrum: ; f14a5
	channelcount 2
	channel 5, Sfx_BellyDrum_Ch5
	channel 8, Sfx_BellyDrum_Ch8

Sfx_BellyDrum_Ch5: ; f14ab
	dutycycle $2
	soundinput $ac
	sound __, 13, $f1, $05a3
	soundinput $8
	endchannel

Sfx_BellyDrum_Ch8: ; f14b6
	noise __, 13, $b1, $6c
	endchannel

Sfx_Unknown7F: ; f14ba
	channel 5, Sfx_Unknown7F_Ch5

Sfx_Unknown7F_Ch5: ; f14bd
	dutycycle $2
	soundinput $95
	sound __,  3, $c9, $03b3
	sound __,  6, $f8, $0463
	sound __,  5, $d1, $0543
	soundinput $8
	endchannel

Sfx_SludgeBomb: ; f14d0
	channelcount 2
	channel 5, Sfx_SludgeBomb_Ch5
	channel 8, Sfx_SludgeBomb_Ch8

Sfx_SludgeBomb_Ch5: ; f14d6
	dutycycle $2
	soundinput $c5
	sound __,  4, $f8, $0581
	sound __,  2, $0, 0
	soundinput $cb
	sound C_,  1, $f2, $05d1
	soundinput $8
	endchannel

Sfx_SludgeBomb_Ch8: ; f14eb
	noise __,  4, $e2, $6e
	noise __,  2, $0, $0
	noise C_,  1, $e2, $6d
	endchannel

Sfx_Foresight: ; f14f5
	channel 5, Sfx_Foresight_Ch5

Sfx_Foresight_Ch5: ; f14f8
	sound __,  4, $f4, $07b5
	sound __,  4, $f5, $07c8
	sound __,  9, $f4, $07da
	sound __,  3, $0, 0
	sound __,  9, $c1, $07da
	sound __,  3, $0, 0
	sound __,  9, $91, $07da
	endchannel

Sfx_Spite: ; f1515
	channel 5, Sfx_Spite_Ch5

Sfx_Spite_Ch5: ; f1518
	togglesfx
	vibrato $0, $12
	dutycycle $3
	soundinput $fd
	notetype $3, $f8
	octave 3
	note F_, 3
	note G#, 3
	note B_, 3
	note E_, 3
	note G_, 3
	note A#, 3
	intensity $bf
	note D#, 3
	note F#, 3
	note A_, 3
	intensity $5f
	note D_, 3
	intensity $2f
	note F_, 3
	note G#, 3
	soundinput $8
	togglesfx
	endchannel

Sfx_Outrage: ; f153a
	channel 8, Sfx_Outrage_Ch8

Sfx_Outrage_Ch8: ; f153d
	noise __, 12, $ea, $6c
	noise __, 12, $ea, $6b
	noise __, 12, $ea, $6a
	noise __, 12, $ea, $69
	noise __, 12, $e1, $59
	endchannel

Sfx_PerishSong: ; f154d
	channelcount 2
	channel 5, Sfx_PerishSong_Ch5
	channel 6, Sfx_PerishSong_Ch6

Sfx_PerishSong_Ch5: ; f1553
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note A_, 9
	note G#, 9
	togglesfx
	endchannel

Sfx_PerishSong_Ch6: ; f1561
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note C_, 9
	octave 3
	note B_, 9
	togglesfx
	endchannel

Sfx_GigaDrain: ; f1570
	channelcount 2
	channel 5, Sfx_GigaDrain_Ch5
	channel 8, Sfx_GigaDrain_Ch8

Sfx_GigaDrain_Ch5: ; f1576
	dutycycle $2
	soundinput $97
	sound __,  5, $f8, $0680
	sound C_,  5, $f8, $0680
	sound C_,  5, $c8, $0660
	sound C_,  5, $a8, $0670
	sound C_,  5, $88, $0680
	sound C_,  5, $f8, $0561
	sound C_,  5, $c8, $0541
	sound C_,  5, $a8, $0521
	sound C_,  5, $88, $0511
	soundinput $8
	endchannel

Sfx_GigaDrain_Ch8: ; f15a1
	noise __,  5, $c8, $44
	noise C_,  5, $c8, $50
	noise C_,  5, $c8, $52
	noise C_,  5, $c8, $54
	noise C_,  5, $c8, $56
	noise D#,  1, $c7, $57
	endchannel

Sfx_Attract: ; f15b4
	channel 5, Sfx_Attract_Ch5

Sfx_Attract_Ch5: ; f15b7
	dutycycle $0
	soundinput $77
	sound __,  5, $a9, $06f0
	sound __, 13, $f8, $0720
	soundinput $7f
	sound __,  9, $f1, $0740
	soundinput $8
	endchannel

Sfx_Kinesis2: ; f15cc
	channel 5, Sfx_Kinesis2_Ch5

Sfx_Kinesis2_Ch5: ; f15cf
	dutycycle $0
	sound __,  3, $f3, $0796
	sound __,  3, $23, $0796
	sound C_,  5, $f1, $07c4
	endchannel

Sfx_ZapCannon: ; f15de
	channel 8, Sfx_ZapCannon_Ch8

Sfx_ZapCannon_Ch8: ; f15e1
Sfx_ZapCannon_branch_f15e1: ; f15e1
	noise __,  3, $e1, $49
	noise __,  1, $0, $0
	loopchannel 8, Sfx_ZapCannon_branch_f15e1
	noise __,  9, $e1, $49
	endchannel

Sfx_MeanLook: ; f15ef
	channel 5, Sfx_MeanLook_Ch5

Sfx_MeanLook_Ch5: ; f15f2
	soundinput $77
	dutycycle $3
	sound __,  3, $f8, $0720
Sfx_MeanLook_branch_f15fa: ; f15fa
	sound __,  2, $88, $0660
	sound __,  3, $f8, $0790
	loopchannel 5, Sfx_MeanLook_branch_f15fa
	sound __, 13, $f8, $0700
	sound __, 13, $c8, $0720
	sound __, 13, $a8, $0700
	sound __, 13, $78, $0720
	sound __, 13, $48, $0700
	sound __, 13, $28, $0720
	soundinput $8
	endchannel

Sfx_HealBell: ; f1621
	channel 5, Sfx_HealBell_Ch5

Sfx_HealBell_Ch5: ; f1624
	dutycycle $1
	sound __,  2, $f1, $07da
	sound __,  2, $d1, $07d9
	sound __,  2, $f1, $07da
	sound __,  9, $d1, $07db
	endchannel

Sfx_Return: ; f1637
	channel 5, Sfx_Return_Ch5

Sfx_Return_Ch5: ; f163a
	dutycycle $0
Sfx_Return_branch_f163c: ; f163c
	soundinput $bf
	sound __,  9, $f1, $0759
	soundinput $57
	sound __,  9, $f1, $0759
	sound C_,  1, $0, 0
	loopchannel 2, Sfx_Return_branch_f163c
	soundinput $8
	endchannel

Sfx_ExpBar:
	channel 5, .channel

.channel
	dutycycle $2
	soundinput $d7
	sound __,  9, $e1, $0750
	soundinput $e7
	sound __,  9, $48, $06e0
	sound __,  9, $58, $06f8
	sound __,  9, $68, $0710
	sound __,  9, $78, $0728
	sound __,  9, $88, $0740
	sound __,  9, $98, $0758
	sound C_,  1, $a8, $0770
	soundinput $8
	endchannel

Sfx_MilkDrink: ; f167f
	channel 5, Sfx_MilkDrink_Ch5

Sfx_MilkDrink_Ch5: ; f1682
	dutycycle $2
Sfx_MilkDrink_branch_f1684: ; f1684
	soundinput $a4
	sound __,  3, $ea, $04e0
	sound __, 14, $f7, $0290
	soundinput $9e
	sound __,  5, $c9, $05e1
	sound __,  3, $0, 0
	loopchannel 6, Sfx_MilkDrink_branch_f1684
	soundinput $8
	endchannel

Sfx_Present: ; f169f
	channel 5, Sfx_Present_Ch5

Sfx_Present_Ch5: ; f16a2
	dutycycle $2
	soundinput $d6
Sfx_Present_branch_f16a6: ; f16a6
	sound __,  3, $f1, $0740
	sound __,  2, $0, 0
	loopchannel 3, Sfx_Present_branch_f16a6
	sound C_,  1, $f1, $0780
	soundinput $8
	endchannel

Sfx_MorningSun: ; f16b9
	channel 5, Sfx_MorningSun_Ch5

Sfx_MorningSun_Ch5: ; f16bc
	dutycycle $3
Sfx_MorningSun_branch_f16be: ; f16be
	sound __,  3, $f1, $07e4
	sound __,  3, $f1, $07e0
	sound __,  6, $f2, $07e7
	loopchannel 3, Sfx_MorningSun_branch_f16be
	sound __,  2, $0, 0
	sound __,  9, $c2, $07e7
	sound __,  2, $0, 0
	sound __,  9, $82, $07e7
	endchannel

Sfx_Moonlight: ; f16df
	channel 5, Sfx_Moonlight_Ch5

Sfx_Moonlight_Ch5: ; f16e2
	dutycycle $2
Sfx_Moonlight_branch_f16e4: ; f16e4
	sound __,  2, $f8, $07d0
	sound __,  5, $f1, $07e0
	loopchannel 2, Sfx_Moonlight_branch_f16e4
	sound C_,  1, $f1, $07e0
	sound C_,  1, $d1, $07e0
	sound C_,  1, $81, $07e0
	endchannel

Sfx_Encore: ; f16fd
	channelcount 2
	channel 5, Sfx_Encore_Ch5
	channel 8, Sfx_Encore_Ch8

Sfx_Encore_Ch5: ; f1703
	dutycycle $2
	soundinput $ce
	sound C_,  1, $0, 0
Sfx_Encore_branch_f170b: ; f170b
	sound __,  3, $f8, $0774
	sound C#,  5, $0, 0
	loopchannel 2, Sfx_Encore_branch_f170b
	soundinput $8
	endchannel

Sfx_Encore_Ch8: ; f171a
	noise D_,  1, $1f, $36
	noise D_,  1, $76, $36
	endchannel

Sfx_BeatUp: ; f1721
	channel 8, Sfx_BeatUp_Ch8

Sfx_BeatUp_Ch8: ; f1724
	noise __,  3, $e8, $69
	noise __,  7, $d8, $24
	noise __,  3, $e8, $6c
	noise __,  5, $c8, $46
	noise __,  7, $d1, $24
	endchannel

Sfx_SweetScent: ; f1734
	channel 5, Sfx_SweetScent_Ch5

Sfx_SweetScent_Ch5: ; f1737
	dutycycle $2
	soundinput $96
	sound __,  7, $f8, $0760
	sound __,  7, $e8, $0720
	soundinput $df
	sound C_,  7, $f1, $0730
	soundinput $8
	endchannel

Sfx_BatonPass: ; f174c
	channelcount 2
	channel 5, Sfx_BatonPass_Ch5
	channel 8, Sfx_BatonPass_Ch8

Sfx_BatonPass_Ch5: ; f1752
	dutycycle $2
	soundinput $f7
	sound C#,  1, $f2, $0680
	sound __,  2, $f1, $0760
	sound C#,  1, $0, 0
	sound __,  2, $f1, $0760
	sound C_, 11, $0, 0
	sound __,  2, $f1, $0760
	soundinput $8
	endchannel

Sfx_BatonPass_Ch8: ; f1771
	noise C#,  1, $f2, $20
	endchannel

Sfx_EggCrack: ; f1775
	channel 5, Sfx_EggCrack_Ch5

Sfx_EggCrack_Ch5: ; f1778
	togglesfx
	notetype $1, $f1
	dutycycle $0
	octave 4
	note D#, 1
	note C_, 1
	note __, 1
	note F#, 1
	endchannel

Sfx_Evolved: ; f1784
	channel 5, Sfx_Evolved_Ch5

Sfx_Evolved_Ch5: ; f1787
	togglesfx
	notetype $1, $c1
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 3
	note G_, 3
	note B_, 3
	octave 5
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 3
	note B_, 3
	octave 7
	note C_, 16
	endchannel

Sfx_MasterBall: ; f179b
	channel 5, Sfx_MasterBall_Ch5

Sfx_MasterBall_Ch5: ; f179e
	togglesfx
	dutycycle $1
	notetype $2, $e1
	octave 6
	note B_, 2
	octave 7
	note D_, 2
	octave 6
	note B_, 2
	note G_, 2
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	intensity $c1
	note G#, 2
	note G_, 2
	note F#, 2
	intensity $91
	note F_, 2
	note E_, 2
	note D#, 2
	intensity $61
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel

Sfx_EggHatch: ; f17c0
	channel 5, Sfx_EggHatch_Ch5

Sfx_EggHatch_Ch5: ; f17c3
	togglesfx
	notetype $2, $f1
	dutycycle $2
	octave 5
	note E_, 1
	note C_, 1
	note __, 1
	note G_, 1
	note D_, 1
	intensity $e2
	note B_, 7
	intensity $82
	note B_, 7
	intensity $42
	note B_, 7
	endchannel

Sfx_GsIntroCharizardFireball:
	channel 8, .channel

.channel
	noise __,  9, $cf, $4d
	noise __,  9, $f1, $37
.loop
	noise __,  2, $f8, $4f
	noise __,  1, $c8, $26
	noise __,  2, $d8, $5f
	noise __,  1, $a8, $37
	loopchannel 12, .loop
	noise __,  4, $f8, $6f
	noise __,  5, $d8, $5f
	noise __, 13, $d8, $5c
	noise C#,  9, $d3, $4f
	endchannel

Sfx_GsIntroPokemonAppears:
	channel 8, .channel

.channel
	noise __,  2, $88, $4f
	noise __,  3, $8f, $2
	noise __,  3, $5f, $12
	noise __,  3, $3f, $22
	noise __,  1, $f8, $27
	noise __,  2, $f8, $4f
	noise __,  9, $f1, $0
	endchannel

Sfx_Flash: ; f1818
	channel 5, Sfx_Flash_Ch5

Sfx_Flash_Ch5: ; f181b
	dutycycle $1
	soundinput $ef
	sound __,  2, $40, $07e8
	sound __,  2, $60, $07e8
	sound __,  3, $80, $07e8
	sound __,  6, $a0, $07e8
	sound __,  7, $a0, $07e8
	sound __,  8, $80, $07e8
	sound __,  9, $60, $07e8
	sound __, 10, $30, $07e8
	sound __, 16, $12, $07e8
	soundinput $8
	endchannel

Sfx_GameFreakLogoGs:
	channel 5, .channel

.channel
	dutycycle $3
	soundinput $7f
	sound __,  5, $55, $07e2
	sound __,  6, $75, $07e2
	sound __,  7, $94, $07e2
	sound __,  8, $b4, $07e2
	sound __,  9, $b3, $07e2
	sound __, 10, $93, $07e2
	sound __, 11, $72, $07e2
	sound __, 11, $53, $07e2
	sound __, 11, $34, $07e2
	sound __, 11, $15, $07e2
	soundinput $8
	endchannel

Sfx_DexFanfareLessThan20: ; f1878
	channelcount 4
	channel 5, Sfx_DexFanfareLessThan20_Ch5
	channel 6, Sfx_DexFanfareLessThan20_Ch6
	channel 7, Sfx_DexFanfareLessThan20_Ch7
	channel 8, Sfx_DexFanfareLessThan20_Ch8

Sfx_DexFanfareLessThan20_Ch5: ; f1884
	togglesfx
	tempo 124
	volume $77
	notetype $8, $b1
	octave 3
	note A_, 4
	note F#, 2
	note A_, 4
	note F#, 2
	note C#, 6
	note G_, 6
	note F#, 6
	note E_, 2
	note E_, 2
	note E_, 2
	note D_, 6
	endchannel

	togglesfx

Sfx_DexFanfareLessThan20_Ch6: ; f189b
	togglesfx
	notetype $8, $c1
	octave 3
	note B_, 4
	note A_, 2
	note B_, 4
	note A_, 2
	note D#, 6
	note A#, 6
	note A_, 6
	note A_, 2
	note A_, 2
	note G_, 2
	note F#, 6
	endchannel

	togglesfx

Sfx_DexFanfareLessThan20_Ch7: ; f18ad
	togglesfx
	notetype $8, $25
	octave 4
	note D_, 6
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	note A#, 4
	note G_, 2
	octave 4
	note D#, 6
	note D_, 2
	note __, 4
	octave 3
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 2
	note __, 6
	endchannel

	togglesfx

Sfx_DexFanfareLessThan20_Ch8: ; f18c8
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C#, 6
	note __, 16
	note __, 12
	endchannel

	togglesfx

Sfx_DexFanfare140169: ; f18d2
	channelcount 4
	channel 5, Sfx_DexFanfare140169_Ch5
	channel 6, Sfx_DexFanfare140169_Ch6
	channel 7, Sfx_DexFanfare140169_Ch7
	channel 8, Sfx_DexFanfare140169_Ch8

Sfx_DexFanfare140169_Ch5: ; f18de
	togglesfx
	tempo 120
	volume $77
	dutycycle $3
	vibrato $12, $34
	notetype $6, $b1
	note __, 8
	octave 3
	note E_, 4
	note E_, 4
	note A_, 4
	octave 4
	note C#, 4
	intensity $a4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 16
	octave 2
	note B_, 8
	note __, 8
	endchannel

	togglesfx

Sfx_DexFanfare140169_Ch6: ; f1901
	togglesfx
	dutycycle $2
	vibrato $12, $34
	notetype $6, $c1
	octave 4
	note E_, 4
	note F#, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	intensity $b4
	note F#, 4
	note G_, 4
	note A_, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 16
	note G_, 8
	note __, 8
	endchannel

	togglesfx

Sfx_DexFanfare140169_Ch7: ; f191e
	togglesfx
	notetype $c, $25
	note __, 4
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 3
	note C#, 1
	note __, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 3
	octave 2
	note A_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 3
	octave 2
	note B_, 1
	note __, 1
	note G_, 4
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare140169_Ch8: ; f193f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 4
Sfx_DexFanfare140169_branch_f1945: ; f1945
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 3, Sfx_DexFanfare140169_branch_f1945
	note D_, 8
	endchannel

	togglesfx

Sfx_DexFanfare170199: ; f1951
	channelcount 4
	channel 5, Sfx_DexFanfare170199_Ch5
	channel 6, Sfx_DexFanfare170199_Ch6
	channel 7, Sfx_DexFanfare170199_Ch7
	channel 8, Sfx_DexFanfare170199_Ch8

Sfx_DexFanfare170199_Ch5: ; f195d
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b4
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 6
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $c1
	note F_, 4
	note G_, 4
	note A_, 4
	notetype $c, $a8
	note A#, 12
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare170199_Ch6: ; f1982
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c4
	octave 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 6
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	intensity $d1
	octave 4
	note D#, 4
	note D#, 4
	note D#, 4
	notetype $c, $b8
	note D_, 12
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare170199_Ch7: ; f19a3
	togglesfx
	notetype $8, $25
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 6
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	notetype $c, $25
	octave 2
	note A#, 12
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare170199_Ch8: ; f19c0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note B_, 16
	endchannel

	db $fd

Sfx_DexFanfare200229: ; f19d6
	channelcount 4
	channel 5, Sfx_DexFanfare200229_Ch5
	channel 6, Sfx_DexFanfare200229_Ch6
	channel 7, Sfx_DexFanfare200229_Ch7
	channel 8, Sfx_DexFanfare200229_Ch8

Sfx_DexFanfare200229_Ch5: ; f19e2
	togglesfx
	tempo 124
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note A#, 4
	octave 4
	note D#, 4
	note G_, 4
	notetype $c, $a8
	note F#, 12
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare200229_Ch6: ; f1a04
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	note E_, 4
	note D_, 4
	note C_, 4
	note D#, 4
	note G_, 4
	note A#, 4
	notetype $c, $b8
	note A_, 12
	note __, 4
	endchannel

	togglesfx

Sfx_DexFanfare200229_Ch7: ; f1a1f
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 4
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 6
	note __, 6
	endchannel

	togglesfx

Sfx_DexFanfare200229_Ch8: ; f1a4a
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	endchannel

	togglesfx

Sfx_DexFanfare230Plus: ; f1a66
	channelcount 4
	channel 5, Sfx_DexFanfare230Plus_Ch5
	channel 6, Sfx_DexFanfare230Plus_Ch6
	channel 7, Sfx_DexFanfare230Plus_Ch7
	channel 8, Sfx_DexFanfare230Plus_Ch8

Sfx_DexFanfare230Plus_Ch5: ; f1a72
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $a5
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 14
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A_, 2
	note G_, 2
	note F_, 10
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A#, 12
	intensity $b2
	note G_, 4
	note A_, 4
	note A#, 4
	notetype $c, $a8
	note A_, 14
	note __, 2
	endchannel

	togglesfx

Sfx_DexFanfare230Plus_Ch6: ; f1ab2
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b5
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 14
	note __, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 10
	note __, 4
	note A_, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 12
	intensity $c2
	note G_, 4
	note G_, 4
	note G_, 4
	notetype $c, $b8
	note F#, 14
	note __, 2
	endchannel

	togglesfx

Sfx_DexFanfare230Plus_Ch7: ; f1ada
	togglesfx
	notetype $8, $25
	octave 3
	note G_, 6
	note A#, 4
	note F_, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 2
	note __, 2
	note D_, 1
	note __, 1
	note D_, 6
	note A_, 4
	note F_, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note C_, 1
	note __, 1
	note C_, 6
	note G_, 4
	note D#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 4
	note G_, 4
	note D#, 4
	notetype $c, $25
	note D_, 14
	note __, 2
	endchannel

	togglesfx

Sfx_DexFanfare230Plus_Ch8: ; f1b0c
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
Sfx_DexFanfare230Plus_branch_f1b14: ; f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_DexFanfare230Plus_branch_f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
Sfx_DexFanfare230Plus_branch_f1b2b: ; f1b2b
	note C#, 1
	loopchannel 18, Sfx_DexFanfare230Plus_branch_f1b2b
	note D_, 6
	endchannel

	togglesfx

Sfx_NotVeryEffective: ; f1b33
	channel 8, Sfx_NotVeryEffective_Ch8

Sfx_NotVeryEffective_Ch8: ; f1b36
	noise __,  5, $f1, $5f
	noise __,  2, $a0, $42
	noise C_,  1, $f1, $53
	endchannel

Sfx_Damage: ; f1b40
	channel 8, Sfx_Damage_Ch8

Sfx_Damage_Ch8: ; f1b43
	noise __,  5, $f1, $5e
	noise __,  2, $a0, $12
	noise __,  5, $f0, $32
	noise C_,  1, $f1, $44
	endchannel

Sfx_SuperEffective: ; f1b50
	channel 8, Sfx_SuperEffective_Ch8

Sfx_SuperEffective_Ch8: ; f1b53
	noise __,  4, $f1, $4f
	noise __,  2, $c8, $22
	noise __,  3, $f8, $3f
	noise __,  4, $d0, $15
	noise C#,  1, $f2, $35
	endchannel

Sfx_BallBounce: ; f1b63
	channelcount 2
	channel 5, Sfx_BallBounce_Ch5
	channel 6, Sfx_BallBounce_Ch6

Sfx_BallBounce_Ch5: ; f1b69
	dutycycle $2
	sound __,  9, $e1, $0740
	sound C_,  8, $0, 0
	sound __,  9, $b1, $0740
	sound C_,  8, $0, 0
	sound __,  9, $81, $0740
	sound C_,  8, $0, 0
	sound __,  9, $51, $0740
	sound C_,  8, $0, 0
	endchannel

Sfx_BallBounce_Ch6: ; f1b8c
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  9, $b1, $0741
	sound C_,  8, $0, 0
	sound __,  9, $81, $0741
	sound C_,  8, $0, 0
	sound __,  9, $51, $0741
	sound C_,  8, $0, 0
	sound __,  9, $21, $0741
	sound C_,  8, $0, 0
	endchannel

Sfx_SweetScent2: ; f1bb3
	channelcount 2
	channel 5, Sfx_SweetScent2_Ch5
	channel 8, Sfx_SweetScent2_Ch8

Sfx_SweetScent2_Ch5: ; f1bb9
	soundinput $af
	dutycycle $1
	sound __,  7, $f8, $05f0
	sound __,  3, $f1, $0620
	sound C_,  1, $f1, $0650
	soundinput $8
	endchannel

Sfx_SweetScent2_Ch8: ; f1bcc
	noise __,  3, $e8, $22
	noise C_,  2, $aa, $0
Sfx_SweetScent2_branch_f1bd2: ; f1bd2
	noise __,  5, $d9, $10
	noise __,  9, $91, $0
	noise __,  3, $61, $7
	loopchannel 5, Sfx_SweetScent2_branch_f1bd2
	noise __,  5, $99, $0
	noise __, 11, $61, $0
	noise __,  7, $59, $0
	noise __,  3, $21, $7
	endchannel

Sfx_HitEndOfExpBar: ; f1bec
	channelcount 2
	channel 5, Sfx_HitEndOfExpBar_Ch5
	channel 6, Sfx_HitEndOfExpBar_Ch6

Sfx_HitEndOfExpBar_Ch5: ; f1bf2
	dutycycle $2
	sound __,  2, $e1, $0789
	sound __,  2, $e1, $07a2
	sound C_,  1, $e1, $07b1
	endchannel

Sfx_HitEndOfExpBar_Ch6: ; f1c01
	dutycycle $2
	sound __,  2, $e1, $07a2
	sound __,  2, $e1, $07b1
	sound C_,  1, $e1, $07c4
	endchannel

Sfx_GiveTrademon: ; f1c10
	channel 5, Sfx_GiveTrademon_Ch5

Sfx_GiveTrademon_Ch5: ; f1c13
	sound C#,  1, $0, 0
	dutycycle $1
	soundinput $a7
	sound C_, 12, $f4, $0750
	sound C_, 12, $d4, $0750
	sound C_, 12, $b4, $0750
	sound C_, 12, $94, $0750
	sound C_, 12, $74, $0750
	sound C_, 12, $54, $0750
	sound C_, 12, $34, $0750
	sound C_, 12, $14, $0750
	soundinput $8
	endchannel

Sfx_GetTrademon: ; f1c3e
	channel 5, Sfx_GetTrademon_Ch5

Sfx_GetTrademon_Ch5: ; f1c41
	sound C#,  1, $0, 0
	dutycycle $2
	soundinput $bf
	sound C_, 12, $14, $07bc
	sound C_, 12, $34, $07bc
	sound C_, 12, $54, $07bc
	sound C_, 12, $74, $07bc
	sound C_, 12, $94, $07bc
	sound C_, 12, $b4, $07bc
	sound C_, 12, $d4, $07bc
	sound C_, 12, $f4, $07bc
	soundinput $8
	endchannel

Sfx_TrainArrived: ; f1c6c
	channelcount 3
	channel 5, Sfx_TrainArrived_Ch5
	channel 6, Sfx_TrainArrived_Ch6
	channel 8, Sfx_TrainArrived_Ch8

Sfx_TrainArrived_Ch6: ; f1c75
	tone $0008
	sound __,  9, $0, 0
Sfx_TrainArrived_Ch5: ; f1c7c
	dutycycle $2
	sound __,  5, $5f, $0691
	sound __,  5, $6f, $0694
	sound __,  5, $78, $0697
	sound __,  5, $7f, $069a
	sound __,  5, $68, $06ae
	sound C_,  1, $6f, $06ab
	sound F_,  9, $65, $06a8
	endchannel

Sfx_TrainArrived_Ch8: ; f1c9b
	noise __,  6, $af, $10
	noise __,  5, $9f, $20
	noise __,  5, $8f, $21
	noise __,  5, $7f, $22
	noise __,  5, $8f, $21
	noise __,  5, $9f, $20
	noise __,  5, $9f, $10
	noise F_,  9, $a3, $0
	endchannel

Sfx_2Boops: ; f1cb4
	channel 5, Sfx_2Boops_Ch5

Sfx_2Boops_Ch5: ; f1cb7
	dutycycle $2
Sfx_2Boops_branch_f1cb9: ; f1cb9
	soundinput $79
	sound __,  2, $99, $0563
	sound __,  5, $f2, $04b5
	soundinput $43
	sound C_,  1, $f8, $05cd
	loopchannel 2, Sfx_2Boops_branch_f1cb9
	soundinput $8
	endchannel

Sfx_UnknownCB:
	channel 8, .channel

.channel
	noise __,  2, $10, $10
	noise __,  3, $20, $10
	noise __,  3, $30, $20
	noise __,  3, $40, $20
	noise __,  3, $50, $21
	noise __,  3, $60, $22
	noise __,  5, $70, $22
	noise __,  9, $80, $22
	noise __, 16, $94, $22
	endchannel

Sfx_Menu_Ch8: ; f1cd3
	noise __,  2, $e2, $33
	noise __,  9, $e1, $22
	endchannel

Sfx_Pokeflute_Ch7: ; f1cda
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
	note __, 12
	endchannel

Sfx_PlacePuzzlePieceDown_Ch8: ; f1cf8
	noise __,  3, $f7, $24
	noise __,  3, $f7, $34
	noise __,  5, $f7, $44
	noise __,  9, $f4, $55
	noise __,  9, $f1, $44
	endchannel

Sfx_EnterDoor_Ch8: ; f1d08
	noise __, 10, $f1, $44
	noise __,  9, $d1, $43
	endchannel

Sfx_SwitchPokemon_Ch5: ; f1d0f
	dutycycle $2
	sound __,  9, $e1, $0740
	endchannel

Sfx_SwitchPokemon_Ch6: ; f1d16
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  9, $b1, $0741
	endchannel

Sfx_PokeballsPlacedOnTable_Ch5: ; f1d21
	dutycycle $2
	soundinput $3a
	sound __,  5, $f2, $0200
	soundinput $22
	sound __,  9, $e2, $0200
	soundinput $8
	endchannel

Sfx_BallWiggle_Ch5: ; f1d32
	dutycycle $2
	soundinput $3a
	sound __,  5, $f2, $0400
	soundinput $22
	sound __,  9, $e2, $0400
	soundinput $8
	endchannel

Sfx_Tally_Ch5: ; f1d43
	dutycycle $2
	sound __,  5, $f1, $0780
	endchannel

Sfx_Tally_Ch6: ; f1d4a
	dutycycle $2
	sound __,  2, $8, 0
	sound __,  5, $a1, $0761
	endchannel

Sfx_Transaction_Ch5: ; f1d55
	dutycycle $2
	sound __,  5, $e1, $0700
	sound C_,  9, $f2, $07e0
	endchannel

Sfx_Transaction_Ch6: ; f1d60
	dutycycle $2
	sound __,  2, $8, 0
	sound __,  5, $91, $06c1
	sound C_,  9, $a2, $07a1
	endchannel

Sfx_Bump_Ch5: ; f1d6f
	dutycycle $2
	soundinput $5a
	sound __, 16, $f1, $0300
	soundinput $8
	endchannel

Sfx_ExitBuilding_Ch8: ; f1d7a
	noise __,  3, $f1, $54
	noise __, 13, $71, $23
	noise __,  3, $b1, $54
	noise __, 13, $61, $23
	noise __,  7, $41, $54
	endchannel

Sfx_ReadText2_Ch5: ; f1d8a
Sfx_ReadText_Ch5: ; f1d8a
	dutycycle $2
	sound __,  1, $91, $07c0
	sound __,  1, $81, $07d0
	sound __,  1, $91, $07c0
	sound __, 13, $a1, $07d0
	endchannel

Sfx_Potion_Ch5: ; f1d9d
	dutycycle $2
	soundinput $17
	sound __, 16, $f0, $04f0
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel

Sfx_Poison_Ch5: ; f1dac
Sfx_Poison_branch_f1dac: ; f1dac
	dutycycle $0
	soundinput $14
	sound __,  5, $f2, $0600
	loopchannel 4, Sfx_Poison_branch_f1dac
	sound __, 16, $f3, $0600
	soundinput $8
	endchannel

Sfx_FullHeal_Ch5: ; f1dbf
	dutycycle $2
	soundinput $14
	sound __,  5, $f2, $0600
	sound __,  5, $f2, $0600
	soundinput $17
	sound __, 16, $f2, $0600
	soundinput $8
	endchannel

Sfx_GotSafariBalls_Ch5: ; f1dd4
	dutycycle $2
	soundinput $15
	sound __, 16, $f0, $04f0
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel

Sfx_BootPc_Ch5: ; f1de3
	dutycycle $2
	sound __, 16, $f2, $07c0
	sound __, 16, $0, 0
	sound __,  4, $a1, $0780
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $0740
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $0780
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $07c0
	sound __,  9, $a1, $0700
	endchannel

Sfx_ShutDownPc_Ch5: ; f1e0e
	dutycycle $2
	sound __,  5, $f0, $0600
	sound __,  5, $f0, $0400
	sound __,  5, $f0, $0200
	sound __,  2, $0, 0
	endchannel

Sfx_ChoosePcOption_Ch5: ; f1e21
	dutycycle $2
	sound __,  7, $f0, $0700
	sound __,  5, $0, 0
	sound __,  7, $f0, $0700
	sound __,  2, $0, 0
	endchannel

Sfx_EscapeRope_Ch5: ; f1e34
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0600
	sound __, 16, $b7, $0580
	sound __, 16, $87, $0500
	sound __, 16, $47, $0480
	sound __, 16, $17, $0400
	soundinput $8
	endchannel

Sfx_PushButton_Ch5: ; f1e4f
	dutycycle $2
	sound __,  5, $0, 0
	sound __,  3, $f1, $0680
	sound __,  2, $0, 0
	sound __,  5, $f1, $0780
	sound __,  5, $0, 0
	endchannel

Sfx_SecondPartOfItemfinder_Ch5: ; f1e66
	dutycycle $2
	soundinput $2c
	sound __,  5, $f2, $0500
	soundinput $22
	sound __,  3, $f1, $0500
	soundinput $8
	sound __,  2, $0, 0
	endchannel

Sfx_WarpTo_Ch5: ; f1e7b
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0500
	sound __, 16, $b7, $0580
	sound __, 16, $87, $0600
	sound __, 16, $47, $0680
	sound __, 16, $17, $0700
	soundinput $8
	endchannel

Sfx_WarpFrom_Ch5: ; f1e96
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0700
	sound __, 16, $b7, $0680
	sound __, 16, $87, $0600
	sound __, 16, $47, $0580
	sound __, 16, $17, $0500
	soundinput $8
	endchannel

Sfx_ChangeDexMode_Ch5: ; f1eb1
	dutycycle $1
	soundinput $16
	sound __, 16, $d2, $0500
	soundinput $8
	endchannel

Sfx_JumpOverLedge_Ch5: ; f1ebc
	dutycycle $2
	soundinput $95
	sound __, 16, $f2, $0400
	soundinput $8
	endchannel

Sfx_GrassRustle_Ch8: ; f1ec7
	noise __,  3, $f1, $32
	noise __,  3, $0, $0
	noise __,  3, $f1, $22
	noise __,  2, $0, $0
	endchannel

Sfx_Fly_Ch8: ; f1ed4
	noise __,  3, $f1, $12
	noise __,  3, $0, $0
	noise __,  3, $a1, $12
	noise __,  3, $0, $0
	noise __,  3, $d1, $12
	noise __,  3, $0, $0
	noise __,  3, $81, $12
	noise __,  3, $0, $0
	noise __,  3, $b1, $12
	noise __,  3, $0, $0
	noise __,  3, $61, $12
	noise __,  3, $0, $0
	noise __,  3, $91, $12
	noise __,  3, $0, $0
	noise __,  3, $41, $12
	noise __,  3, $0, $0
	endchannel

Sfx_Wrong_Ch5: ; f1f05
	dutycycle $3
	soundinput $5a
	sound __,  5, $f0, $0500
	soundinput $8
	sound __,  5, $0, 0
	sound __, 16, $f0, $0500
	sound __,  2, $0, 0
	endchannel

Sfx_Wrong_Ch6: ; f1f1c
	dutycycle $3
	sound __,  5, $f0, $0401
	sound __,  5, $0, 0
	sound __, 16, $f0, $0401
	sound __,  2, $0, 0
	endchannel

Sfx_Squeak_Ch5: ; f1f2f
	dutycycle $0
	soundinput $17
	sound __, 16, $d2, $0700
	soundinput $8
	endchannel

Sfx_Strength_Ch8: ; f1f3a
	noise __,  5, $a2, $23
	noise __,  9, $f1, $34
	noise __, 16, $0, $0
	noise __,  3, $f7, $24
	noise __,  3, $f7, $34
	noise __,  5, $f7, $44
	noise __,  9, $f4, $55
	noise __,  9, $f1, $44
	endchannel

Sfx_Boat_Ch5: ; f1f53
	dutycycle $2
	sound __, 16, $f0, $0500
	sound __,  5, $0, 0
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f2, $0500
	endchannel

Sfx_Boat_Ch6: ; f1f72
	dutycycle $3
	sound __, 16, $f0, $0482
	sound __,  5, $0, 0
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f2, $0482
	endchannel

Sfx_WallOpen_Ch5: ; f1f91
	dutycycle $1
	soundinput $3a
	sound __,  5, $f2, $0500
	soundinput $22
	sound __,  5, $e2, $0500
	soundinput $3a
	sound __,  5, $f2, $0700
	soundinput $22
	sound __, 16, $e2, $0700
	soundinput $8
	endchannel

Sfx_ElevatorEnd_Ch5: ; f1fae
	dutycycle $2
	sound __, 16, $f3, $0730
	sound __,  9, $65, $0730
	sound __, 16, $f4, $0700
	sound __, 16, $74, $0700
	sound __, 16, $44, $0700
	sound __, 16, $24, $0700
	endchannel

Sfx_ThrowBall_Ch5: ; f1fc9
	dutycycle $2
	soundinput $2f
	sound __, 16, $f2, $0780
	endchannel

Sfx_ThrowBall_Ch6: ; f1fd2
	dutycycle $2
	sound __, 16, $c2, $0782
	endchannel

Sfx_Shine_Ch5: ; f1fd9
	dutycycle $0
	sound __,  1, $d2, $0700
	sound __,  1, $d2, $0740
	sound __,  1, $d2, $0780
	sound __,  1, $d2, $07c0
	sound __, 11, $e1, $07e0
	sound __,  2, $0, 0
	endchannel

Sfx_BallPoof_Ch5: ; f1ff4
	dutycycle $2
	soundinput $16
	sound __, 16, $f2, $0400
	soundinput $8
	endchannel

Sfx_BallPoof_Ch8: ; f1fff
	noise __, 16, $a2, $22
	endchannel

Sfx_Unknown3A_Ch5: ; f2003
	sound __, 16, $d1, $0200
	soundinput $8
	endchannel

Sfx_Unknown3A_Ch8: ; f200a
	noise __,  5, $f5, $33
	noise __,  9, $f4, $22
	noise __, 16, $f2, $21
	endchannel

Sfx_Run_Ch8: ; f2014
	noise __,  3, $61, $23
	noise __,  3, $a1, $33
	noise __,  3, $c1, $33
	noise __,  3, $51, $11
	noise __,  3, $f1, $33
	noise __,  3, $41, $11
	noise __,  3, $c1, $33
	noise __,  3, $31, $11
	noise __,  3, $81, $33
	noise __,  3, $31, $11
	noise __,  9, $41, $33
	endchannel

Sfx_SlotMachineStart_Ch5: ; f2036
	dutycycle $2
	soundinput $44
	sound __, 16, $f0, $04f0
	soundinput $17
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel

Sfx_SlotMachineStart_Ch6: ; f2047
	dutycycle $2
	sound __, 16, $92, $0600
	sound __, 16, $92, $0782
	endchannel

Sfx_Call_Ch5: ; f2052
	soundinput $67
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	soundinput $8
	sound __,  5, $0, 0
	endchannel

Sfx_Peck_Ch8: ; f206f
	noise __,  3, $a1, $12
	endchannel

Sfx_Kinesis_Ch5: ; f2073
	dutycycle $1
	soundinput $af
	sound __, 16, $f2, $0780
	soundinput $8
	endchannel

Sfx_Lick_Ch5: ; f207e
	dutycycle $1
	soundinput $97
	sound __, 16, $f2, $0500
	soundinput $8
	endchannel

Sfx_Pound_Ch8: ; f2089
	noise __,  3, $a1, $22
	endchannel

Sfx_MovePuzzlePiece_Ch8: ; f208d
	noise __,  9, $f1, $54
	endchannel

Sfx_CometPunch_Ch8: ; f2091
	noise __, 16, $8f, $11
	noise __,  5, $ff, $12
	noise __, 11, $f1, $55
	endchannel

Sfx_MegaPunch_Ch8: ; f209b
	noise __, 16, $8f, $34
	noise __,  9, $f2, $35
	noise __, 11, $f1, $55
	endchannel

Sfx_Scratch_Ch8: ; f20a5
	noise __, 16, $9f, $23
	noise __,  9, $f1, $21
	endchannel

Sfx_Vicegrip_Ch8: ; f20ac
	noise __,  3, $e1, $4b
	noise __, 11, $f1, $44
	noise __,  3, $e1, $3a
	noise __,  7, $f1, $34
	endchannel

Sfx_RazorWind_Ch8: ; f20b9
	noise __,  3, $f4, $44
	noise __,  3, $f4, $14
	noise __, 16, $f1, $32
	endchannel

Sfx_Cut_Ch8: ; f20c3
	noise __,  5, $8f, $55
	noise __,  3, $f4, $44
	noise __,  9, $f4, $22
	noise __, 16, $f2, $21
	endchannel

Sfx_WingAttack_Ch8: ; f20d0
Sfx_WingAttack_branch_f20d0: ; f20d0
	noise __,  9, $4f, $23
	noise __,  5, $c4, $22
	noise __,  7, $f2, $23
	loopchannel 4, Sfx_WingAttack_branch_f20d0
	endchannel

Sfx_Whirlwind_Ch8: ; f20de
	noise __,  9, $4f, $33
	noise __,  5, $c4, $22
	noise __,  7, $f2, $23
	noise __, 16, $f2, $22
	endchannel

Sfx_Bind_Ch8: ; f20eb
	noise __,  9, $ff, $32
	noise __,  9, $f4, $43
	noise __,  9, $f2, $54
	noise __,  9, $f1, $65
	endchannel

Sfx_VineWhip_Ch8: ; f20f8
	noise __,  2, $c2, $33
	noise __,  3, $f2, $21
	noise __,  2, $e2, $33
	noise __,  2, $c2, $32
	noise __,  2, $92, $12
	noise __,  2, $b2, $31
	noise __, 13, $91, $10
	noise __,  9, $f2, $41
	endchannel

Sfx_DoubleKick_Ch8: ; f2111
	noise __,  2, $94, $23
	noise __,  2, $b4, $22
	noise __,  9, $f1, $44
	endchannel

Sfx_MegaKick_Ch8: ; f211b
	noise __,  3, $94, $33
	noise __,  5, $b4, $22
	noise __,  5, $f1, $44
	noise __,  9, $f1, $55
	endchannel

Sfx_Headbutt_Ch8: ; f2128
	noise __,  5, $ff, $55
	noise __,  9, $f1, $65
	endchannel

Sfx_HornAttack_Ch8: ; f212f
	noise __,  3, $84, $43
	noise __,  3, $c4, $22
	noise __,  9, $f2, $34
	endchannel

Sfx_Tackle_Ch8: ; f2139
	noise __,  5, $f1, $34
	noise __, 16, $f2, $64
	endchannel

Sfx_PoisonSting_Ch8: ; f2140
	noise __,  3, $f1, $22
	noise __, 16, $f2, $12
	endchannel

Sfx_Powder_Ch8: ; f2147
	noise __,  3, $c2, $1
	noise __, 16, $f4, $1
	noise __, 16, $f2, $1
	endchannel

Sfx_Doubleslap_Ch8: ; f2151
	noise __,  9, $f1, $32
	noise __,  9, $f1, $33
	endchannel

Sfx_Bite_Ch5: ; f2158
	dutycycle $0
	soundinput $3a
	sound __,  5, $f2, $0200
	soundinput $22
	sound __,  9, $e2, $0200
	soundinput $8
	endchannel

Sfx_Bite_Ch8: ; f2169
	noise __,  1, $d1, $42
	noise __,  5, $a1, $32
	noise __,  1, $d1, $22
	noise __,  7, $a1, $32
	endchannel

Sfx_JumpKick_Ch8: ; f2176
	noise __,  4, $92, $31
	noise __,  4, $b2, $32
	noise __,  4, $c2, $33
	noise __,  9, $f1, $54
	endchannel

Sfx_Stomp_Ch8: ; f2183
	noise __, 13, $f1, $54
	noise __,  9, $f1, $64
	endchannel

Sfx_TailWhip_Ch8: ; f218a
	noise __,  3, $f1, $33
	noise __,  3, $c1, $32
	noise __,  3, $a1, $31
	noise __, 16, $82, $32
	noise __,  9, $f1, $34
	endchannel

Sfx_KarateChop_Ch8: ; f219a
	noise __,  3, $d2, $32
	noise __, 16, $f2, $43
	endchannel

Sfx_Submission_Ch8: ; f21a1
	noise __,  3, $f2, $43
	noise __,  5, $b5, $32
	noise __, 10, $86, $31
	noise __,  8, $64, $0
	noise __, 16, $f2, $55
	endchannel

Sfx_WaterGun_Ch5: ; f21b1
	dutycycle $1
	soundinput $97
	sound __, 16, $f2, $0700
	soundinput $8
	endchannel

Sfx_WaterGun_Ch8: ; f21bc
	noise __, 16, $3f, $22
	noise __, 16, $f2, $21
	endchannel

Sfx_SwordsDance_Ch8: ; f21c3
	noise __, 16, $4f, $41
	noise __,  9, $8f, $41
	noise __,  9, $cf, $41
	noise __,  9, $f2, $42
	noise __, 16, $f2, $41
	endchannel

Sfx_Thunder_Ch8: ; f21d3
	noise __, 11, $ff, $50
	noise __, 16, $ff, $51
	noise __,  9, $f2, $51
	noise __,  7, $ff, $52
	noise __,  7, $ff, $53
	noise __,  9, $ff, $54
	noise __, 16, $f2, $54
	endchannel

Sfx_Supersonic_Ch5: ; f21e9
	dutycycle $2
	sound __, 16, $3f, $07c0
.loop
	sound __, 16, $df, $07c0
	loopchannel 4, .loop
	sound __, 16, $d1, $07c0
	endchannel

Sfx_Supersonic_Ch6: ; f21fc
	sound_duty 3, 0, 3, 2
	sound __, 16, $2f, $07c8
.loop
	sound __, 16, $cf, $07c7
	loopchannel 4, .loop
	sound __, 16, $c1, $07c8
	endchannel

Sfx_Supersonic_Ch8: ; f220f
Sfx_Supersonic_branch_f220f: ; f220f
	noise __,  4, $97, $12
	noise __,  4, $a1, $11
	loopchannel 10, Sfx_Supersonic_branch_f220f
	endchannel

Sfx_Leer_Ch5: ; f221a
Sfx_Leer_branch_f221a: ; f221a
	dutycycle $0
	sound __,  1, $f1, $07c0
	sound __,  1, $f1, $0700
	loopchannel 12, Sfx_Leer_branch_f221a
	endchannel

Sfx_Leer_Ch6: ; f2229
Sfx_Leer_branch_f2229: ; f2229
	sound_duty 3, 0, 3, 2
	sound __,  1, $e1, $07c1
	sound __,  1, $e1, $0701
	loopchannel 12, Sfx_Leer_branch_f2229
	endchannel

Sfx_Leer_Ch8: ; f2238
Sfx_Leer_branch_f2238: ; f2238
	noise __,  2, $d1, $49
	noise __,  2, $d1, $29
	loopchannel 6, Sfx_Leer_branch_f2238
	endchannel

Sfx_Ember_Ch5: ; f2243
Sfx_Ember_branch_f2243: ; f2243
	sound_duty 1, 2, 0, 3
	sound __, 12, $f3, $0120
	sound __, 10, $d3, $0150
	loopchannel 5, Sfx_Ember_branch_f2243
	sound __,  9, $e3, $0130
	sound __, 16, $c2, $0110
	endchannel

Sfx_Ember_Ch8: ; f225a
Sfx_Ember_branch_f225a: ; f225a
	noise __, 11, $f3, $35
	noise __, 15, $f6, $45
	loopchannel 4, Sfx_Ember_branch_f225a
	noise __, 13, $f4, $bc
	noise __, 13, $f5, $9c
	noise __, 16, $f4, $ac
	endchannel

Sfx_Bubblebeam_Ch5: ; f226e
Sfx_Bubblebeam_branch_f226e: ; f226e
	sound_duty 1, 2, 3, 0
	sound __,  5, $f4, $0600
	sound __,  4, $c4, $0500
	sound __,  6, $b5, $0600
	sound __, 14, $e2, $06c0
	loopchannel 3, Sfx_Bubblebeam_branch_f226e
	sound __,  9, $d1, $0600
	endchannel

Sfx_Bubblebeam_Ch6: ; f2289
Sfx_Bubblebeam_branch_f2289: ; f2289
	sound_duty 1, 3, 0, 2
	sound __,  6, $e4, $05e0
	sound __,  5, $b4, $04e0
	sound __,  7, $a5, $05e8
	sound __, 15, $d1, $06a0
	loopchannel 3, Sfx_Bubblebeam_branch_f2289
	endchannel

Sfx_Bubblebeam_Ch8: ; f22a0
Sfx_Bubblebeam_branch_f22a0: ; f22a0
	noise __,  6, $c3, $33
	noise __,  4, $92, $43
	noise __, 11, $b5, $33
	noise __, 16, $c3, $32
	loopchannel 2, Sfx_Bubblebeam_branch_f22a0
	endchannel

Sfx_HydroPump_Ch5: ; f22b1
Sfx_HydroPump_branch_f22b1: ; f22b1
	sound_duty 2, 0, 1, 3
	sound __,  4, $81, $0300
	sound __,  4, $c1, $0400
	sound __,  4, $f1, $0500
	sound __,  4, $b1, $0400
	sound __,  4, $71, $0300
	loopchannel 5, Sfx_HydroPump_branch_f22b1
	sound __,  9, $81, $0400
	endchannel

Sfx_HydroPump_Ch8: ; f22d0
Sfx_HydroPump_branch_f22d0: ; f22d0
	noise __,  4, $62, $22
	noise __,  4, $a2, $32
	noise __,  4, $d2, $33
	noise __,  4, $92, $23
	noise __,  4, $52, $12
	loopchannel 5, Sfx_HydroPump_branch_f22d0
	noise __,  9, $81, $12
	endchannel

Sfx_Surf_Ch5: ; f22e7
Sfx_Surf_branch_f22e7: ; f22e7
	sound_duty 1, 2, 3, 0
	sound __, 16, $f4, $0500
	sound __, 16, $c4, $0400
	sound __, 16, $e2, $05c0
	loopchannel 3, Sfx_Surf_branch_f22e7
	endchannel

Sfx_Surf_Ch6: ; f22fa
Sfx_Surf_branch_f22fa: ; f22fa
	sound_duty 1, 3, 0, 2
	sound __,  8, $e4, $0430
	sound __, 16, $b4, $0330
	sound __, 16, $a2, $0438
	loopchannel 4, Sfx_Surf_branch_f22fa
	endchannel

Sfx_Surf_Ch8: ; f230d
Sfx_Surf_branch_f230d: ; f230d
	noise __, 10, $f4, $44
	noise __, 10, $f2, $43
	noise __, 16, $f4, $42
	noise __, 16, $f4, $41
	loopchannel 3, Sfx_Surf_branch_f230d
	endchannel

Sfx_Psybeam_Ch5: ; f231e
Sfx_Psybeam_branch_f231e: ; f231e
	sound_duty 1, 0, 2, 2
	sound __, 11, $f1, $0640
	sound __, 11, $f3, $0680
	sound __, 11, $f2, $0620
	loopchannel 4, Sfx_Psybeam_branch_f231e
	sound __, 11, $f1, $0640
	endchannel

Sfx_Psybeam_Ch6: ; f2335
Sfx_Psybeam_branch_f2335: ; f2335
	sound_duty 3, 0, 3, 2
	sound __, 11, $f3, $0571
	sound __,  8, $e3, $0531
	sound __, 11, $f1, $0551
	loopchannel 4, Sfx_Psybeam_branch_f2335
	sound __, 11, $f1, $0571
	endchannel

Sfx_Psybeam_Ch8: ; f234c
Sfx_Psybeam_branch_f234c: ; f234c
	noise __,  3, $d1, $4a
	noise __,  3, $d2, $2a
	loopchannel 21, Sfx_Psybeam_branch_f234c
	endchannel

Sfx_Charge_Ch5: ; f2357
Sfx_Charge_branch_f2357: ; f2357
	dutycycle $0
	sound __,  3, $f1, $0200
	sound __,  4, $f1, $0700
	sound __,  5, $f1, $0500
	sound __,  6, $f1, $07f0
	loopchannel 8, Sfx_Charge_branch_f2357
	endchannel

Sfx_Charge_Ch6: ; f236e
Sfx_Charge_branch_f236e: ; f236e
	sound_duty 3, 0, 3, 2
	sound __,  3, $e1, $0302
	sound __,  4, $e1, $07f2
	sound __,  5, $e1, $0602
	sound __,  6, $e1, $0702
	loopchannel 8, Sfx_Charge_branch_f236e
	endchannel

Sfx_Charge_Ch8: ; f2385
Sfx_Charge_branch_f2385: ; f2385
	noise __,  3, $d3, $10
	noise __,  4, $d3, $11
	noise __,  3, $d2, $10
	noise __,  6, $d2, $12
	loopchannel 9, Sfx_Charge_branch_f2385
	endchannel

Sfx_Thundershock_Ch5: ; f2396
Sfx_Thundershock_branch_f2396: ; f2396
	sound_duty 3, 2, 2, 0
	sound __,  4, $f1, $07f0
	sound __,  5, $f2, $0200
	loopchannel 8, Sfx_Thundershock_branch_f2396
	endchannel

Sfx_Thundershock_Ch6: ; f23a5
.loop
	sound_duty 3, 0, 3, 2
	sound __,  5, $e2, $0202
	sound __,  5, $e1, $07e2
	loopchannel 9, .loop
	endchannel

Sfx_Thundershock_Ch8: ; f23b4
.loop
	noise __,  5, $ff, $43
	noise __,  5, $f2, $44
	loopchannel 9, .loop
	endchannel

Sfx_Psychic_Ch5: ; f23bf
	dutycycle $2
	soundinput $f7
	sound __,  9, $c4, $07bd
	sound __,  9, $c4, $07be
	sound __,  9, $c4, $07bf
	sound __,  9, $c4, $07c0
	sound __, 16, $c4, $07c1
	sound __, 16, $f2, $07c0
	soundinput $8
	endchannel

Sfx_Psychic_Ch6: ; f23de
	dutycycle $2
	sound __,  9, $c4, $0770
	sound __,  9, $c4, $0761
	sound __,  9, $c4, $0762
	sound __,  9, $c4, $0763
	sound __, 16, $c4, $0764
	sound __, 16, $f2, $0764
	endchannel

Sfx_Psychic_Ch8: ; f23f9
	noise __, 16, $3f, $14
	noise __, 16, $cf, $13
	noise __, 16, $cf, $12
	noise __, 16, $cf, $11
	noise __, 16, $cf, $10
	noise __, 16, $c2, $10
	endchannel

Sfx_Screech_Ch5: ; f240c
	dutycycle $2
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $f2, $07e0
	endchannel

Sfx_Screech_Ch6: ; f2423
	dutycycle $3
	sound __, 16, $ff, $07e2
	sound __, 16, $ff, $07e1
	sound __, 16, $ff, $07e2
	sound __, 16, $ff, $07e1
	sound __, 16, $f2, $07e2
	endchannel

Sfx_BoneClub_Ch5: ; f243a
	dutycycle $2
	soundinput $af
	sound __,  9, $f1, $0700
	soundinput $8
	endchannel

Sfx_BoneClub_Ch6: ; f2445
	dutycycle $3
	sound __,  9, $f1, $0701
	endchannel

Sfx_Sharpen_Ch5: ; f244c
	dutycycle $2
	sound __,  7, $f1, $0500
	sound __,  7, $f1, $0580
	sound __,  7, $f1, $0600
	sound __,  7, $f1, $0680
	sound __,  9, $f1, $0700
	endchannel

Sfx_Sharpen_Ch6: ; f2463
	dutycycle $3
	sound __,  7, $e1, $0510
	sound __,  7, $e1, $0590
	sound __,  7, $e1, $0610
	sound __,  7, $e1, $0690
	sound __,  9, $e1, $0710
	endchannel

Sfx_EggBomb_Ch5:
	sound_duty 1, 3, 2, 3
	sound __,  9, $ff, $03f8
	sound __, 16, $ff, $0400
	sound __, 16, $f3, $0400
	endchannel

Sfx_EggBomb_Ch6: ; f2489
	sound_duty 0, 1, 3, 2
	sound __,  9, $ef, $03c0
	sound __, 16, $ef, $03c0
	sound __, 16, $e3, $03c0
	endchannel

Sfx_EggBomb_Ch8: ; f2498
	noise __,  5, $ff, $51
	noise __,  9, $ff, $54
	noise __, 16, $ff, $55
	noise __, 16, $f3, $56
	endchannel

Sfx_Sing_Ch5: ; f24a5
	togglesfx
	vibrato $a, $24
	dutycycle $2
	notetype $a, $87
	octave 5
	note G_, 8
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel

Sfx_Sing_Ch6:
	togglesfx
	vibrato $a, $23
	dutycycle $2
	notetype $b, $67
	octave 5
	note G_, 8
	notetype $a, $67
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel

Sfx_Unknown5F_Ch5:
	sound __,  3, $f7, $0601
	sound __,  3, $f7, $0701
	loopchannel 8, Sfx_Unknown5F_Ch5
	endchannel

Sfx_Unknown5F_Ch6:
	sound __,  2, $f7, $ffff
	sound __,  3, $f7, $0602
	sound __,  3, $f7, $0702
	loopchannel 8, Sfx_Unknown5F_Ch5
	endchannel

Sfx_HangUp_Ch5:
	dutycycle $2
	sound __,  5, $b8, $077b
	sound __,  3, $21, $077b
	sound C_,  1, $0, 0
Sfx_NoSignal_Ch5:
.loop
	dutycycle $2
	sound C_,  5, $e8, $070b
	sound C_, 13, $0, 0
	loopchannel 3, .loop
	endchannel

Sfx_Sandstorm_Ch8:
.loop
	noise __,  2, $f8, $41
	noise __,  3, $9c, $24
	noise __,  1, $0, $0
	noise __,  4, $59, $16
	noise __,  3, $0, $0
	loopchannel 3, .loop
	endchannel

Sfx_StopSlot:
	channel 5, .channel

.channel
	dutycycle $2
	sound __,  2, $f8, $0760
	sound __,  5, $82, $0760
	endchannel

Sfx_GlassTing:
	channel 5, .channel

.channel
	dutycycle $2
	sound C#,  1, $d1, $07dc
	endchannel

Sfx_GlassTing2:
	channelcount 2
	channel 5, .channel_5
	channel 6, .channel_6

.channel_5
	dutycycle $2
	sound C_,  1, $f1, $07dc
	endchannel

.channel_6
	dutycycle $2
	sound C_,  1, $d1, $07dd
	endchannel

Sfx_HealPokemon:
	channelcount 4
	channel 5, .channel_5
	channel 6, .channel_6
	channel 7, .channel_7
	channel 8, .channel_8

.channel_5
	togglesfx
	sfxpriorityon
	tempo 144
	volume $77
	dutycycle $2
	tone $0001
	notetype $c, $81
	note __, 2
	slidepitchto 1, 4, __
	note B_, 2
	slidepitchto 1, 5, E_
	note B_, 2
	slidepitchto 1, 4, E_
	note E_, 2
	note __, 4
	slidepitchto 1, 3, __
	note E_, 4
	slidepitchto 1, 4, __
	note B_, 4
	sfxpriorityoff
	endchannel

.channel_6
	togglesfx
	dutycycle $2
	notetype $c, $c3
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	notetype $c, $c4
	octave 5
	note E_, 8
	endchannel

.channel_7
	togglesfx
	notetype $c, $10
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 6
	note __, 2
	endchannel

.channel_8
	togglesfx
	togglenoise $3
	notetype $c
	note __, 16
	note __, 4
	endchannel
