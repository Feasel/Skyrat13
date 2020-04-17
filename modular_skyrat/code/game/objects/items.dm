/obj/item
	var/grabtext
	var/grabsound

	var/icon/mob_overlay_icon_digi = null			// accomodates digi legs, if you want to use different ones than the ones in mob_overlay_icon
	var/icon/mob_overlay_icon_muzzled = null			// muzzles/snouts
	var/icon/mob_overlay_icon_taur = null			// general sprite for all taurs, aka hooved, nagas and canine, if you don't want to specialize
	var/icon/mob_overlay_icon_hoovedtaur = null		// and specific taur subtypes if you do
	var/icon/mob_overlay_icon_naga = null
	var/icon/mob_overlay_icon_caninetaur = null

/obj/item/pickup(mob/living/user)
	. = ..()
	if(grabtext)
		var/t = replacetext(grabtext,"user","[user]")
		t = replacetext(t,"src","[src.name]")
		user.visible_message("<span class='danger'>[t]</span>")
	if(grabsound)
		playsound(src,grabsound,50,1)
