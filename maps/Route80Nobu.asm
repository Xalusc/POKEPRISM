Route80Nobu_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route80Nobu_Nobu:
	faceplayer
	opentext
	checkevent EVENT_VARANEOUS_REVIVED
	sif false
		jumptext .before_varaneous_revives_text
	checkevent EVENT_NOBU_EXPLAINS_PROTECTORS
	sif true
		jumptext .already_explained_text
	writetext .explanation_text_1
	writetext .explanation_text_2
	writetext .explanation_text_3
	writetext .explanation_text_4
	writetext .explanation_text_5
	writetext .explanation_text_6
	writetext .explanation_text_7
	writetext .explanation_text_8
	setevent EVENT_NOBU_EXPLAINS_PROTECTORS
	jumptext .after_explanation_text

.before_varaneous_revives_text
	ctxt "Get moving!"

	para "Go back to the"
	line "path where you"
	para "found me, and"
	line "put a stop to"
	cont "the awakening."

	para "There's no time"
	line "for us to lose!"
	done

.explanation_text_1
	ctxt "We're in a bad"
	line "situation, and we"
	cont "need your help."

	para "You see, LANCE is"
	line "the reincarnation"
	cont "of the MESSENGER."
	sdone

.explanation_text_2
	ctxt "<...>Hmm, who the"
	line "MESSENGER was?"

	para "Well<...> allow me"
	line "to start from the"
	cont "very beginning."

	para "Thousands of years"
	line "ago, NALJO was an"
	para "isolated region,"
	line "which was the wish"
	cont "of the GUARDIANS."

	para "VARANEOUS created"
	line "NALJO as an image"
	para "of its own ideal"
	line "environment."

	para "It desired to have"
	line "community with a"
	cont "high value system,"
	para "where all humans"
	line "and #MON were"
	para "free from all the"
	line "troubles brewing"
	cont "outside of NALJO."

	para "Each GUARDIAN was"
	line "handed an island"
	cont "to rule over."

	para "While they ruled"
	line "very differently,"
	para "the agreement was"
	line "that the rest of"
	para "the world was not"
	line "to interfere with"
	cont "the NALJO natives."

	para "Where instead of"
	line "fighting over"
	cont "our differences,"
	para "everyone would now"
	line "work together to"
	cont "solve problems."
	sdone

.explanation_text_3
	ctxt "The names of the"
	line "4 GUARDIANS were"

	para "VARANEOUS,"

	para "RAIWATO,"

	para "LIBABEEL,"

	para "and FAMBACO."

	para "Each GUARDIAN held"
	line "their own orb,"
	para "which contained"
	line "the very source"
	cont "of their powers."

	para "Of them, RAIWATO"
	line "would watch down"
	cont "upon his area,"
	para "in order to ensure"
	line "everyone was kept"
	cont "out of trouble."
	sdone

.explanation_text_4
	ctxt "FAMBACO, who was"
	line "the guardian of"
	cont "nature itself,"
	para "ensured that areas"
	line "of the region were"
	para "off limits to any"
	line "intervention."

	para "It understood the"
	line "necessity of using"
	cont "domestic #MON,"
	para "and it appreciated"
	line "the bond a human"
	para "could develop with"
	line "its #MON."

	para "Still, it wanted"
	line "nature to run its"
	para "course without any"
	line "needless meddling."
	sdone

.explanation_text_5
	ctxt "LIBABEEL, who was"
	line "the most hostile"
	cont "out of them all,"
	para "controlled the sea"
	line "surrounding NALJO."

	para "Explorers who got"
	line "close to the shore"
	para "of NALJO would be"
	line "unlikely to return"
	cont "home alive again."
	sdone

.explanation_text_6
	ctxt "And finally, we"
	line "have VARANEOUS,"
	para "which you encoun-"
	line "tered earlier."

	para "Back in the days"
	line "when VARANEOUS was"
	cont "walking the earth,"
	para "outsiders foolish"
	line "enough to come to"
	para "our land ended up"
	line "burned to ash by"
	para "the mighty flames"
	line "of VARANEOUS."

	para "The ones choosing"
	line "the brave path of"
	cont "fleeing from it,"
	para "would end up with"
	line "charred scars of"
	para "his hateful stare"
	line "upon their backs."

	para "Not even #MON"
	line "were safe from"
	cont "VARANEOUS' wrath."
	sdone

.explanation_text_7
	ctxt "The MESSENGER had"
	line "the responsibility"
	para "to relay messages"
	line "from the GUARDIANS"
	cont "to the community."

	para "It was the only"
	line "human that these"
	cont "legends trusted,"
	para "but<...> the GUARDIANS"
	line "didn't tell him how"
	para "they were slaying"
	line "anything trying to"
	cont "enter the region."

	para "However<...>"

	para "When he discovered"
	line "this, he stole the"
	para "powerful orbs, and"
	line "hid the orbs all"
	cont "over the region."

	para "Without the orbs,"
	line "the GUARDIANS were"
	para "powerless and fell"
	line "asleep for centur-"
	cont "ies to come."

	para "But, once an orb"
	line "gets close enough"
	para "to a GUARDIAN, it"
	line "can harness its"
	cont "true power."

	para "VARANEOUS is now"
	line "awake, and it will"
	para "surely awaken the"
	line "other GUARDIANS."
	sdone

.explanation_text_8
	ctxt "The man in red"
	line "foolishly believed"
	para "that just being a"
	line "descendant would"
	cont "tame the creature."

	para "However!"

	para "You are the last"
	line "known descendant"
	cont "of the MESSENGER."

	para "Well, besides your"
	line "father, that is."

	para "Your father could"
	line "indeed save us<...>"

	para "However."

	para "Your father doesn't"
	line "realize the power"
	cont "he has over NALJO."

	para "He won't be able"
	line "to handle it."

	para "He's too obsessed"
	line "with his fame and"
	cont "fortune nowadays;"
	para "there's no luring"
	line "him out of that."

	para "As his lone child,"
	line "you are NALJO's one"
	para "hope in taming the"
	line "GUARDIANS for us."
	sdone

.after_explanation_text
	ctxt "A lighthouse lies"
	line "north, and a good"
	para "friend of mine is"
	line "watching over it."

	para "Perhaps he saw"
	line "where VARANEOUS"
	cont "went afterwards."

	para "Find a way to"
	line "head up north."
	done

.already_explained_text
	ctxt "At this point, we"
	line "can only hope that"
	para "the GUARDIANS don't"
	line "harm anybody else."
	done

Route80Nobu_Aggron:
	faceplayer
	opentext
	checkevent EVENT_RESCUED_NOBU
	sif true
		writetext .cry_text
	cry AGGRON
	sif true
		endtext
	writetext .found_aggron_text
	checkcode VAR_PARTYCOUNT
	sif =, 6
		jumptext .party_full_text
	special SpecialGiveNobusAggron
	disappear 3
	writetext .joined_party_text
	playwaitsfx SFX_FANFARE_2
	setevent EVENT_NOBUS_AGGRON_IN_PARTY
	closetextend

.cry_text
	ctxt "AGGRON: Rwar!"
	done

.found_aggron_text
	ctxt "This #MON"
	line "sounds concerned."

	para "It's tugging your"
	line "foot, expectingly<...>"

	para "Perhaps it wants"
	line "to tag along?"
	sdone

.joined_party_text
	ctxt "AGGRON joined"
	line "your party!"
	done

.party_full_text
	ctxt "It can't join you"
	line "if your party is"
	cont "already full."
	done

Route80Nobu_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 3, ROUTE_80
	warp_def $7, $4, 3, ROUTE_80

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SAGE, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route80Nobu_Nobu, EVENT_NOBU_NOT_IN_HOUSE
	person_event SPRITE_AGGRON, 2, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route80Nobu_Aggron, EVENT_NOBUS_AGGRON_IN_PARTY
