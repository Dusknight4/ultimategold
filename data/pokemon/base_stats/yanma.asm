	db YANMA ; 193

	db  75,  105,  70,  115, 129,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 75 ; catch rate
	db 197 ; base exp
	db DRAGON_SCALE, DRAGON_FANG ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
IF DEF(_GOLD)
	INCBIN "gfx/pokemon/yanma/front_gold.dimensions"
ELIF DEF(_SILVER)
	INCBIN "gfx/pokemon/yanma/front_silver.dimensions"
ENDC
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CUT, FURY_CUTTER, SHADOW_BALL, STEEL_WING, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DRAGONBREATH, SWIFT, DETECT, REST, ATTRACT, THIEF, FLASH, FLY
	; end
