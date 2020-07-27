/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "Anthromorphic Lizard"
	id = "lizard"
	say_mod = "hisses"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,LIPS,HORNCOLOR,WINGCOLOR)
	mutant_bodyparts = list("tail_lizard", "snout", "spines", "horns", "frills", "body_markings", "legs", "taur", "deco_wings")
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutanttongue = /obj/item/organ/tongue/lizard
	mutanttail = /obj/item/organ/tail/lizard
	coldmod = 1.5
	heatmod = 0.67
	mutant_bodyparts = list("mcolor" = "0F0", "mcolor2" = "0F0", "mcolor3" = "0F0", "tail_lizard" = "Smooth", "snout" = "Round",
							 "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None",
							  "legs" = "Digitigrade", "taur" = "None", "deco_wings" = "None")
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/lizard
	gib_types = list(/obj/effect/gibspawner/lizard, /obj/effect/gibspawner/lizard/bodypartless)
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	exotic_bloodtype = "L"
	exotic_blood_color = BLOOD_COLOR_LIZARD
	disliked_food = GRAIN | DAIRY
	liked_food = GROSS | MEAT
	inert_mutation = FIREBREATH
	//Skyrat change - blood
	bloodtypes = list("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-", "L")
	languagewhitelist = list("Draconic") //Skyrat change - species language whitelist
	//

<<<<<<< HEAD
/datum/species/lizard/after_equip_job(datum/job/J, mob/living/carbon/human/H)
	//H.grant_language(/datum/language/draconic)
	species_language_holder = /datum/language_holder/lizard
/*
/datum/species/lizard/after_equip_job(datum/job/J, mob/living/carbon/human/H)
	H.grant_language(/datum/language/draconic) SKYRAT CHANGE= We have an additional language option for this
*/
=======
	tail_type = "tail_lizard"
	wagging_type = "waggingtail_lizard"
	species_type = "lizard"

>>>>>>> 20d9c74f9f... Merge pull request #12876 from timothyteakettle/species-are-dumb
/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/*
 Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	id = "ashlizard"
	limbs_id = "lizard"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE)
	inherent_traits = list(TRAIT_CHUNKYFINGERS)
	mutantlungs = /obj/item/organ/lungs/ashwalker
	burnmod = 0.9
	brutemod = 0.9
	species_language_holder = /datum/language_holder/lizard/ash

/datum/species/lizard/ashwalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	if((C.dna.features["spines"] != "None" ) && (C.dna.features["tail_lizard"] == "None")) //tbh, it's kinda ugly for them not to have a tail yet have floating spines
		C.dna.features["tail_lizard"] = "Smooth"
		C.update_body()
	/*if(C.dna.features["legs"] != "digitigrade") //Skyrat change - comments this out cause im pretty sure this will bug them out either by update_body being called too soon or no capitalisation on the legs, and we've got a fix for this in modular_skyrat
		C.dna.features["legs"] = "digitigrade"
		for(var/obj/item/bodypart/leggie in C.bodyparts)
			if(leggie.body_zone == BODY_ZONE_L_LEG || leggie.body_zone == BODY_ZONE_R_LEG)
				leggie.update_limb(FALSE, C)*/
	return ..()
