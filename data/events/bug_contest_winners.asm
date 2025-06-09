BugContestantPointers:
	table_width 2
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp
	assert_table_length NUM_BUG_CONTESTANTS + 1

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw KAKUNA,     300
	dbw METAPOD,    285
	dbw YANMA,      346

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw BUTTERFREE, 286
	dbw HERACROSS,  391
	dbw CATERPIE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw SCYTHER,    367
	dbw BUTTERFREE, 299
	dbw PINSIR,     378

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw SHUCKLE,    354
	dbw VENONAT,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BENNY
	dbw BUTTERFREE, 318
	dbw WEEDLE,     295
	dbw PARASECT,   355

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw PINSIR,     366
	dbw VENONAT,    329
	dbw KAKUNA,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw SPINARAK,   281
	dbw METAPOD,    301
	dbw VENOMOTH,   364

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw ARIADOS,    372
	dbw SCIZOR,     436

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw WEEDLE,     270
	dbw PINSIR,     282
	dbw CATERPIE,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw VENONAT,    267
	dbw PARAS,      254
	dbw LEDIAN,     379
