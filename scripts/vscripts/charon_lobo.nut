::LOBO <-
{
	// store SpawnEntity(Group)FromTable tables in my namespace to reduce insanity.
	breaktime_relays =
	{
		[0] =
		{
			logic_relay =
			{
				targetname = "break1_relay"
				StartDisabled = false

				// call_gate_uncap mimic, except bot spawning is paused for 80 secs
				"OnTrigger#1"  : "cap_a_relay,CancelPending,,0,-1"
				"OnTrigger#2"  : "cap_b_relay,CancelPending,,0,-1"
				"OnTrigger#3"  : "pop_interface,PauseBotSpawning,,0,-1"
				"OnTrigger#4"  : "bomb_timer,Disable,,0,-1"
				"OnTrigger#5"  : "bomb_counter,SetValueNoFire,0,0,-1"
				"OnTrigger#6"  : "gate_counter,GetValue,,0.1,-1"
				"OnTrigger#7"  : "nav_interface,RecomputeBlockers,,3,-1"
				"OnTrigger#8"  : "nav_interface,RecomputeBlockers,,4,-1"
				"OnTrigger#9"  : "pop_interface,UnpauseBotSpawning,,80,-1"

				// break start logic
				"OnTrigger#10" : "station_open,Trigger,,0.1,-1"
				"OnTrigger#11" : "bombpath_a_holograms,Enable,,0.25,-1"
				"OnTrigger#12" : "bombpath_generic_holograms,Enable,,0.25,-1"
				"OnTrigger#13" : "bombpath_path1_holograms,Enable,,0.25,-1"
				"OnTrigger#14" : "spacedoor_shortcut_1,Open,,0.3,-1"
				"OnTrigger#15" : "spacedoor_shortcut_2,Open,,0.3,-1"
				"OnTrigger#23" : "intel,ForceResetSilent,,1,-1"

				// change bomb attributes
				"OnTrigger#16" : "intel,SetReturnTime,40,0.25,-1"

				// break end logic
				"OnTrigger#17" : "station_close,Trigger,,80,-1"
				"OnTrigger#18" : "bombpath_a_holograms,Disable,,80.25,-1"
				"OnTrigger#19" : "bombpath_generic_holograms,Disable,,80.25,-1"
				"OnTrigger#20" : "bombpath_path1_holograms,Disable,,80.25,-1"
				"OnTrigger#21" : "spacedoor_shortcut_1,Close,,80.3,-1"
				"OnTrigger#22" : "spacedoor_shortcut_2,Close,,80.3,-1"
			}
		},
		[1] =
		{
			logic_relay =
			{
				targetname = "break2_relay"
				StartDisabled = false

				// call_gate_uncap mimic, except bot spawning is paused for 60 secs
				"OnTrigger#1"  : "cap_a_relay,CancelPending,,0,-1"
				"OnTrigger#2"  : "cap_b_relay,CancelPending,,0,-1"
				"OnTrigger#3"  : "pop_interface,PauseBotSpawning,,0,-1"
				"OnTrigger#4"  : "bomb_timer,Disable,,0,-1"
				"OnTrigger#5"  : "bomb_counter,SetValueNoFire,0,0,-1"
				"OnTrigger#6"  : "gate_counter,GetValue,,0.1,-1"
				"OnTrigger#7"  : "nav_interface,RecomputeBlockers,,3,-1"
				"OnTrigger#8"  : "nav_interface,RecomputeBlockers,,4,-1"
				"OnTrigger#9"  : "pop_interface,UnpauseBotSpawning,,60,-1"

				// break start logic
				"OnTrigger#10" : "station_open,Trigger,,0.1,-1"
				"OnTrigger#11" : "bombpath_main_holograms,Enable,,0.25,-1"
				"OnTrigger#12" : "bombpath_generic_holograms,Enable,,0.25,-1"
				"OnTrigger#13" : "bombpath_path1_holograms,Enable,,0.25,-1"
				"OnTrigger#14" : "spacedoor_shortcut_1,Open,,0.3,-1"
				"OnTrigger#15" : "spacedoor_shortcut_2,Open,,0.3,-1"
				"OnTrigger#23" : "intel,ForceResetSilent,,1,-1"

				// change bomb attributes
				"OnTrigger#16" : "intel,SetReturnTime,45,0.25,-1"

				// break end logic
				"OnTrigger#17" : "station_close,Trigger,,60,-1"
				"OnTrigger#18" : "bombpath_main_holograms,Disable,,60.25,-1"
				"OnTrigger#19" : "bombpath_generic_holograms,Disable,,60.25,-1"
				"OnTrigger#20" : "bombpath_path1_holograms,Disable,,60.25,-1"
				"OnTrigger#21" : "spacedoor_shortcut_1,Close,,60.3,-1"
				"OnTrigger#22" : "spacedoor_shortcut_2,Close,,60.3,-1"
			}
		},
		[2] =
		{
			logic_relay =
			{
				targetname = "boss2_pre_relay"
				StartDisabled = false

				// call_gate_uncap mimic (10 sec)
				"OnTrigger#1"  : "cap_a_relay,CancelPending,,0,-1"
				"OnTrigger#2"  : "cap_b_relay,CancelPending,,0,-1"
				"OnTrigger#3"  : "pop_interface,PauseBotSpawning,,0,-1"
				"OnTrigger#4"  : "bomb_timer,Disable,,0,-1"
				"OnTrigger#5"  : "bomb_counter,SetValueNoFire,0,0,-1"
				"OnTrigger#6"  : "gate_counter,GetValue,,0.1,-1"
				"OnTrigger#7"  : "nav_interface,RecomputeBlockers,,3,-1"
				"OnTrigger#8"  : "nav_interface,RecomputeBlockers,,4,-1"
				"OnTrigger#9"  : "pop_interface,UnpauseBotSpawning,,10,-1"

				// path holograms
				"OnTrigger#10" : "bombpath_a_holograms,Enable,,0.25,-1"
				"OnTrigger#11" : "bombpath_generic_holograms,Enable,,0.25,-1"
				"OnTrigger#12" : "bombpath_path1_holograms,Enable,,0.25,-1"
				"OnTrigger#13" : "bombpath_a_holograms,Disable,,10.25,-1"
				"OnTrigger#14" : "bombpath_generic_holograms,Disable,,10.25,-1"
				"OnTrigger#15" : "bombpath_path1_holograms,Disable,,10.25,-1"
			}
		},
		[3] =
		{
			logic_relay =
			{
				targetname = "boss3_pre_single_relay"
				StartDisabled = false

				// call_gate_uncap mimic (15 sec)
				"OnTrigger#1"  : "cap_a_relay,CancelPending,,0,-1"
				"OnTrigger#2"  : "cap_b_relay,CancelPending,,0,-1"
				"OnTrigger#3"  : "pop_interface,PauseBotSpawning,,0,-1"
				"OnTrigger#4"  : "bomb_timer,Disable,,0,-1"
				"OnTrigger#5"  : "bomb_counter,SetValueNoFire,0,0,-1"
				"OnTrigger#6"  : "gate_counter,GetValue,,0.1,-1"
				"OnTrigger#7"  : "nav_interface,RecomputeBlockers,,3,-1"
				"OnTrigger#8"  : "nav_interface,RecomputeBlockers,,4,-1"
				"OnTrigger#9"  : "pop_interface,UnpauseBotSpawning,,15,-1"

				// path holograms
				"OnTrigger#10" : "bombpath_main_holograms,Enable,,0.25,-1"
				"OnTrigger#11" : "bombpath_generic_holograms,Enable,,0.25,-1"
				"OnTrigger#12" : "bombpath_path1_holograms,Enable,,0.25,-1"
				"OnTrigger#13" : "bombpath_main_holograms,Disable,,15.25,-1"
				"OnTrigger#14" : "bombpath_generic_holograms,Disable,,15.25,-1"
				"OnTrigger#15" : "bombpath_path1_holograms,Disable,,15.25,-1"
			}
		},
		[4] =
		{
			logic_relay =
			{
				targetname = "boss3_pre_double_relay"
				StartDisabled = false

				// double call_gate_uncap mimic (15 sec)
				"OnTrigger#1"  : "cap_a_relay,CancelPending,,0,-1"
				"OnTrigger#2"  : "cap_b_relay,CancelPending,,0,-1"
				"OnTrigger#3"  : "pop_interface,PauseBotSpawning,,0,-1"
				"OnTrigger#4"  : "bomb_timer,Disable,,0,-1"
				"OnTrigger#5"  : "bomb_counter,SetValueNoFire,0,0,-1"
				"OnTrigger#6"  : "gate_counter,GetValue,,0.1,-1"
				"OnTrigger#7"  : "gate_counter,GetValue,,2.1,-1"
				"OnTrigger#8"  : "nav_interface,RecomputeBlockers,,5,-1"
				"OnTrigger#9"  : "nav_interface,RecomputeBlockers,,6,-1"
				"OnTrigger#10" : "pop_interface,UnpauseBotSpawning,,15,-1"

				// shortcut doors
				"OnTrigger#11" : "spacedoor_shortcut_1,Open,,0.3,-1"
				"OnTrigger#12" : "spacedoor_shortcut_2,Open,,0.3,-1"
				"OnTrigger#13" : "spacedoor_shortcut_1,Close,,15.3,-1"
				"OnTrigger#14" : "spacedoor_shortcut_2,Close,,15.3,-1"

				// holograms
				"OnTrigger#15" : "bombpath_main_holograms,Enable,,0.25,-1"
				"OnTrigger#16" : "bombpath_generic_holograms,Enable,,0.25,-1"
				"OnTrigger#17" : "bombpath_path1_holograms,Enable,,0.25,-1"
				"OnTrigger#18" : "bombpath_main_holograms,Disable,,15.25,-1"
				"OnTrigger#19" : "bombpath_generic_holograms,Disable,,15.25,-1"
				"OnTrigger#20" : "bombpath_path1_holograms,Disable,,15.25,-1"
			}
		}
	}

	boss_text =
	{
		[0] =
		{
			game_text =
			{
				targetname = "boss_title"
				spawnflags = SF_ENVTEXT_ALLPLAYERS
				channel = 1
				message = "OLD BURIED TERRORS\n\n"
				x = -1
				y = -1
				effect = 2 // scan out
				color = "255 255 255"
				color2 = "237 43 43"
				fadein = 0.035
				holdtime = 3.75
				fadeout = 0.5
			}
		},
		[1] =
		{
			game_text =
			{
				targetname = "boss_name"
				spawnflags = SF_ENVTEXT_ALLPLAYERS
				channel = 2
				message = "THE CARPET BOMBER"
				x = -1
				y = -1
				effect = 2 // scan out
				color = "255 255 255"
				color2 = "237 43 43"
				fadein = 0.035
				holdtime = 3.75
				fadeout = 0.5
			}
		},
		[2] =
		{
			game_text =
			{
				targetname = "boss_hp"
				spawnflags = SF_ENVTEXT_ALLPLAYERS
				channel = 3
				message = "\n\n15000 HP"
				x = -1
				y = -1
				effect = 2 // scan out
				color = "255 255 255"
				color2 = "237 43 43"
				fadein = 0.035
				holdtime = 3.75
				fadeout = 0.5
			}
		}
	}

	tranquility_setup =
	{
		[0] =
		{
			prop_dynamic =
			{
				targetname = "tranquility1_bp"
				// origin is defined outside
				angles = QAngle()
				model = "models/buildables/dispenser_blueprint.mdl"
				DefaultAnim = "idle"
				disablereceiveshadows = true
				disableshadows = true
			}
		},
		[1] =
		{
			info_particle_system =
			{
				targetname = "tranquility1_ready_particles"
				// origin is defined outside
				effect_name = "bot_recent_teleport_blue"
				start_active = false
			}
		},
		[2] =
		{
			info_particle_system =
			{
				targetname = "tranquility1_active_particles"
				// origin is defined outside

				effect_name = "teleporter_mvm_bot_persist"
				start_active = false
			}
		},
		[3] =
		{
			tf_glow =
			{
				targetname = "tranquility1_glow"
				target = "BigNet" // to not make this guy off itself on spawn
				GlowColor = "125 168 196 255"
			}
		},
		[4] =
		{
			prop_dynamic =
			{
				targetname = "tranquility2_bp"
				// origin is defined outside
				angles = QAngle()
				model = "models/buildables/dispenser_blueprint.mdl"
				DefaultAnim = "idle"
				disablereceiveshadows = true
				disableshadows = true
			}
		},
		[5] =
		{
			info_particle_system =
			{
				targetname = "tranquility2_ready_particles"
				// origin is defined outside
				effect_name = "bot_recent_teleport_blue"
				start_active = false
			}
		},
		[6] =
		{
			info_particle_system =
			{
				targetname = "tranquility2_active_particles"
				// origin is defined outside

				effect_name = "teleporter_mvm_bot_persist"
				start_active = false
			}
		},
		[7] =
		{
			tf_glow =
			{
				targetname = "tranquility2_glow"
				target = "BigNet"
				GlowColor = "125 168 196 255"
			}
		}
	}

	// slick:
	// tranquility1_origin = Vector(-634, 298, 0)
	// tranquility2_origin = Vector(-691, -316, 0)

	// charon:
	tranquility1_origin = Vector(3275, -207, -575)
	tranquility2_origin = Vector(2772, -392, -311)

	is_tranquility_on_hold = false
	is_first_kotg_spawned  = false

	hMinicrit_dummy = SpawnEntityFromTable("logic_relay", { targetname = "minicrit_dummy" })

	// by fellen
	KillAllBotsOnMap = function()
	{
		for (local p; p = FindByClassname(p, "player");)
		{
			if (p.GetTeam() == TF_TEAM_PVE_INVADERS)
			{
				p.SetIsMiniBoss(false) // Suppress giant death sound spam.
				p.SetHealth(0) // Allow killing through uber.
				p.TakeDamage(0.9, 0, null)
			}
		}
	}

	DisplayIndicatorCircle = function(ent, scale, duration, follow_ent)
	{
		local indicator = SpawnEntityFromTable("prop_dynamic",
		{
			model = "models/props_mvm/indicator/indicator_circle_long.mdl" // radius = 16 hu
			origin = ent.GetOrigin()
			DefaultAnim = "start"
			skin = 1
			solid = 0
			modelscale = scale
			disablereceiveshadows = true
			disableshadows = true
		})

		if (follow_ent)
		{
			indicator.ValidateScriptScope()
			local scope = indicator.GetScriptScope()
			scope.FollowEntity <- function()
			{
				self.SetLocalOrigin(ent.GetOrigin())
			}
			PopExtUtil.AddThinkToEnt(indicator, "FollowEntity")
		}

		EntFireByHandle(indicator, "SetAnimation", "end", duration, null, null)
		EntFireByHandle(indicator, "SetDefaultAnimation", "end", duration, null, null) // do i need this? idk it just works
		EntFireByHandle(indicator, "Kill", null, duration + 0.8, null, null)
	}

	// https://developer.valvesoftware.com/wiki/Team_Fortress_2/Scripting/VScript_Examples#Giving_a_taunt
	ForceTaunt = function(player, taunt_id)
	{
		local weapon = Entities.CreateByClassname("tf_weapon_bat")
		local active_weapon = player.GetActiveWeapon()
		player.StopTaunt(true) // both are needed to fully clear the taunt
		player.RemoveCond(7)
		weapon.DispatchSpawn()
		NetProps.SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", taunt_id)
		NetProps.SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
		NetProps.SetPropBool(weapon, "m_bForcePurgeFixedupStrings", true)
		NetProps.SetPropEntity(player, "m_hActiveWeapon", weapon)
		NetProps.SetPropInt(player, "m_iFOV", 0) // fix sniper rifles
		player.HandleTauntCommand(0)
		NetProps.SetPropEntity(player, "m_hActiveWeapon", active_weapon)
		weapon.Kill()
	}

	// taken from popext
	CastHealingSpellbook = function(bot)
	{
		local spellbook = PopExtUtil.GetItemInSlot(bot, SLOT_PDA)

		SetPropInt(spellbook, "m_iSelectedSpellIndex", SPELL_OVERHEAL)
		SetPropInt(spellbook, "m_iSpellCharges", INT_MAX)
		try
		{
			bot.Weapon_Switch(spellbook)
			spellbook.AddAttribute("disable weapon switch", 1, 1)
			spellbook.ReapplyProvision()
		} catch(e) printl("can't find spellbook!")

		EntFireByHandle(spellbook, "RunScriptCode", "self.RemoveAttribute(`disable weapon switch`)", 1, null, null)
		EntFireByHandle(spellbook, "RunScriptCode", "self.ReapplyProvision()", 1, null, null)
	}

	// from TankExt, by lite
	IsPlayerStealthedOrDisguised = function(hPlayer)
	{
		if(!hPlayer.IsPlayer()) return false
		return (hPlayer.IsStealthed() || hPlayer.InCond(TF_COND_DISGUISED)) &&
		!hPlayer.InCond(TF_COND_BURNING) &&
		!hPlayer.InCond(TF_COND_URINE) &&
		!hPlayer.InCond(TF_COND_STEALTHED_BLINK) &&
		!hPlayer.InCond(TF_COND_BLEEDING)
	}

	// thanks to ptyx
	PlaySoundFromEntity = function(ent, arg_soundname, range = 99999)
	{
		local hEnt = ent
		if (typeof ent == "string") hEnt = FindByName(null, ent)

		local arg_soundlevel = (40 + (20 * log10(range / 36.0))).tointeger()

		PrecacheSound(arg_soundname)
		EmitSoundEx(
		{
			sound_name = arg_soundname
			entity = hEnt
			sound_level = arg_soundlevel
			filter_type = RECIPIENT_FILTER_GLOBAL
		})
	}

	PlaySoundAtOrigin = function(arg_origin, arg_soundname, range = 99999)
	{
		local arg_soundlevel = (40 + (20 * log10(range / 36.0))).tointeger()

		PrecacheSound(arg_soundname)
		EmitSoundEx(
		{
			sound_name = arg_soundname
			origin = arg_origin
			sound_level = arg_soundlevel
			filter_type = RECIPIENT_FILTER_GLOBAL
		})
	}

	PlaySoundToEveryone = function(arg_soundname)
	{
		PrecacheSound(arg_soundname)
		EmitSoundEx({ sound_name = arg_soundname })
	}

	CastTranquilityAbility = function(bot, cast_count)
	{
		this.PlaySoundToEveryone("oz_terror_sfx/tranquility.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/tranquility.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/tranquility.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/tranquility.mp3")
		bot.AddCondEx(TF_COND_RADIUSHEAL_ON_DAMAGE, 9999, null)

		if (cast_count == 1)
		{
			EntFire("tranquility1_bp", "TurnOff")
			EntFire("tranquility1_ready_particles", "Stop")

			EntFire("tranquility1_active_particles", "Start")

			local arg_origin = this.tranquility1_origin

			local disp1 = SpawnEntityFromTable("obj_dispenser",
			{
				targetname = "tranquility1_dispenser"
				origin = arg_origin
				angles = QAngle()
				TeamNum = 3
				defaultupgrade = 2
				SolidToPlayer = 1

				"OnDestroyed#1" : "kotg,RunScriptCode,LOBO.RemoveTranquilityEffect(self),0,-1"

				"OnDestroyed#2" : "tranquility1_active_particles,Stop,,0,-1"
				"OnDestroyed#3" : "tranquility1_glowRunScriptCodeSetPropEntity(self, `m_hTarget`, LOBO.hBigNet)0-1"
				"OnDestroyed#4" : "tranquility1_beam,Kill,,0,-1"

				"OnDestroyed#5" : "tranquility1_bp,TurnOn,,0,-1"
			})
			EntFire("tranquility1_dispenser", "SetHealth", "864")

			local glow1 = FindByName(null, "tranquility1_glow")
			SetPropEntity(glow1, "m_hTarget", disp1)

			// this is actually the hardest thing to script in this entire mission, can you believe this?
			local beam1 = SpawnEntityFromTable("env_beam",
			{
				targetname = "tranquility1_beam"
				origin = arg_origin
				spawnflags = 1
				rendercolor = "0 66 255"
				life = 0
				BoltWidth = 6
				TextureScroll = 30
				LightningStart = "tranquility1_beam"
				LightningEnd = "BigNet"
				texture = "sprites/laserbeam.vmt"
			})
			SetPropEntityArray(beam1, "m_hAttachEntity", bot, 1)
		}
		else if (cast_count == 2)
		{
			EntFire("tranquility2_bp", "TurnOff")
			EntFire("tranquility2_ready_particles", "Stop")

			EntFire("tranquility2_active_particles", "Start")

			local arg_origin = this.tranquility2_origin

			local disp2 = SpawnEntityFromTable("obj_dispenser",
			{
				targetname = "tranquility2_dispenser"
				origin = arg_origin
				angles = QAngle()
				TeamNum = 3
				defaultupgrade = 2
				SolidToPlayer = 1

				"OnDestroyed#1" : "kotg,RunScriptCode,LOBO.RemoveTranquilityEffect(self),0,-1"

				"OnDestroyed#2" : "tranquility2_active_particles,Stop,,0,-1"
				"OnDestroyed#3" : "tranquility2_glowRunScriptCodeSetPropEntity(self, `m_hTarget`, LOBO.hBigNet)0-1"
				"OnDestroyed#4" : "tranquility2_beam,Kill,,0,-1"

				"OnDestroyed#5" : "tranquility2_bp,TurnOn,,0,-1"
			})
			EntFire("tranquility2_dispenser", "SetHealth", "864")

			local glow2 = FindByName(null, "tranquility2_glow")
			SetPropEntity(glow2, "m_hTarget", disp2)

			local beam2 = SpawnEntityFromTable("env_beam",
			{
				targetname = "tranquility2_beam"
				origin = arg_origin
				spawnflags = 1
				rendercolor = "0 66 255"
				life = 0
				BoltWidth = 6
				TextureScroll = 30
				LightningStart = "tranquility2_beam"
				LightningEnd = "BigNet"
				texture = "sprites/laserbeam.vmt"
			})
			SetPropEntityArray(beam2, "m_hAttachEntity", bot, 1)
		}
	}

	RemoveTranquilityEffect = function(bot)
	{
		if (!bot.IsAlive()) return

		local disp1 = FindByName(null, "tranquility1_dispenser")
		local disp2 = FindByName(null, "tranquility2_dispenser")

		if (!(disp1 == null && disp2 == null)) return
		bot.RemoveCondEx(TF_COND_RADIUSHEAL_ON_DAMAGE, true)
		EntFire("amputator_particle", "Stop")
		EntFire("amputator_particle", "Kill", null, 3)
	}

	KillTranquilityDispensers = function(c)
	{
		if (c == 0 || c == 1) EntFire("tranquility1_dispenser", "RemoveHealth", 9999)
		if (c == 0 || c == 2) EntFire("tranquility2_dispenser", "RemoveHealth", 9999)
	}

	// thanks to ocet247, seel, ficool and mince (holy shit just thank everyone idc)
	CastStarfallAbility = function(bot, max_victims)
	{
		local victims = []
		local victims_distance_to_bot = {}
		local bot_origin = bot.GetOrigin()
		for (local player; player = FindByClassnameWithin(player, "player", bot_origin, 1200);)
		{
			if (player.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue
			victims.append(player)
			victims_distance_to_bot[player] <- (player.GetOrigin() - bot_origin).Length()
		}

		victims.sort(@(a,b) (victims_distance_to_bot[a] <=> victims_distance_to_bot[b]))

		local true_victims = max_victims >= victims.len() ? victims : victims.slice(0, max_victims) // ran out of names

		this.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
		this.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
		foreach (player in true_victims)
		{
			this.DisplayIndicatorCircle(player, 6.5, 3, false)

			SpawnEntityFromTable("info_particle_system",
			{
				targetname = "starfall_particle"
				effect_name = "eyeboss_doorway_vortex"
				start_active = true
				origin = player.GetOrigin()
			})
			SpawnEntityFromTable("info_particle_system",
			{
				targetname = "starfall_particle"
				effect_name = "eyeboss_vortex_blue"
				start_active = true
				origin = player.GetOrigin()
			})

			local scope = player.GetScriptScope()
			scope.starfall_effect_origin <- player.GetOrigin()
			scope.starfall_caster <- bot

			EntFireByHandle(player, "RunScriptCode", @"
				DispatchParticleEffect(`powerup_supernova_explode_blue`, starfall_effect_origin, Vector())

				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3`)
				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3`)
				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundAtOrigin(starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3`)

				for (local player; player = FindByClassnameWithin(player, `player`, starfall_effect_origin, 230);)
				{
					if (player.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue

					player.TakeDamage(50, DMG_MELEE, starfall_caster)

					local unitvec_direction = player.GetOrigin() - starfall_effect_origin
					unitvec_direction.z >= 0 ? unitvec_direction.z += 75 : unitvec_direction.z -= 75
					unitvec_direction *= 1 / unitvec_direction.Length()

					player.SetAbsVelocity(unitvec_direction * 1000)
				}

				for (local building; building = FindByClassnameWithin(building, `obj_*`, starfall_effect_origin, 230);)
				{
					if (building.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue

					building.TakeDamage(200, DMG_MELEE, starfall_caster)
				}

				EntFire(`starfall_particle`, `Stop`)

				delete starfall_effect_origin
				delete starfall_caster
			", 3, null, null)

			EntFire("starfall_particle", "Kill", null, 6)
		}
	}

	gateb_captured = false

	divider_death_origin = Vector()

	// provide a script handle reference to some dummy ents, for convenience.
	hBigNet = FindByName(null, "BigNet")

	// Phantasms guide us and lead us to further discoveries.
	insight_id =
	{
		"[U:1:1027064487]" : null
		"[U:1:195643820]"  : null
		"[U:1:1075756146]" : null
	}

	InitialiseInsight = function()
	{
		local player_array = PopExtUtil.HumanArray
		foreach (idx, player in player_array)
		{
			if (GetPropString(player, "m_szNetworkIDString") in this.insight_id)
			player_array.remove(idx)
		}

		if (player_array.len() == 0) return
		local lucky = RandomInt(0, player_array.len() - 1)
		this.insight_id[GetPropString(player_array[lucky], "m_szNetworkIDString")] <- null
	}

	PlayBossOnSpawnSFX = function()
	{
		PrecacheSound("mvm/mvm_tele_deliver.wav")
		PrecacheSound("oz_terror_sfx/keimou_in.mp3")

		foreach (player in PopExtUtil.PlayerArray)
		{
			if (player.GetTeam() == TF_TEAM_PVE_DEFENDERS && GetPropString(player, "m_szNetworkIDString") in this.insight_id)
			{
				ClientPrint(player, 3, "\x0733979EYou hear whispers from another world...")
				local param =
				{
					sound_name = "oz_terror_sfx/keimou_in.mp3"
					entity = player
					filter_type = RECIPIENT_FILTER_SINGLE_PLAYER
				}
				EmitSoundEx(param)
			}
			else
			{
				EmitSoundEx(
				{
					sound_name = "mvm/mvm_tele_deliver.wav"
					entity = player
					filter_type = RECIPIENT_FILTER_SINGLE_PLAYER
				})
			}
		}
	}

	boss2_death_count = 0

	FeedConfrontationEndInsight = function(is_last_boss = false)
	{
		PrecacheSound("oz_terror_sfx/keimou_out.mp3")

		foreach (player in PopExtUtil.HumanArray)
		{
			if (!(GetPropString(player, "m_szNetworkIDString") in this.insight_id)) continue

			is_last_boss
			? ClientPrint(player, 3, "\x0733979EThe confrontation just now gave you much insight. You feel closer to the Great Ones of the Cosmos.")
			: ClientPrint(player, 3, "\x0733979EThe confrontation just now gave you insight.")

			local param =
			{
				sound_name = "oz_terror_sfx/keimou_out.mp3"
				entity = player
				filter_type = RECIPIENT_FILTER_SINGLE_PLAYER
			}
			EmitSoundEx(param)
		}
	}

	// just for safety.
	PrecacheAssets = function()
	{
		PrecacheSound("oz_terror_sfx/tranquility.mp3")
		PrecacheSound("oz_terror_sfx/starfallcaster1.mp3")
		PrecacheSound("oz_terror_sfx/warstompbirth1.wav")
		PrecacheSound("oz_terror_sfx/thunderclapcaster.mp3")
		PrecacheSound("oz_terror_sfx/howlofterror.mp3")
		PrecacheSound("oz_terror_sfx/keimou_in.mp3")
		PrecacheSound("oz_terror_sfx/keimou_out.mp3")
		PrecacheModel("models/props_mvm/indicator/indicator_circle_long.mdl")
	}

	OnGameEvent_player_disconnect = function(params)
	{
		if (params.networkid in this.insight_id)
		{
			EntFire("BigNet", "RunScriptCode", "LOBO.InitialiseInsight()", 1)
		}
	}

	// this provides accurate bools LOBO.gatea/b_captured for various in-wave logic.
	OnGameEvent_teamplay_point_captured = function(params)
	{
		local team = params.team
		if (team != TF_TEAM_PVE_INVADERS) return

		// part 3 has not started, any gate capture must be a gate b cap
		if (!("gatea_captured" in this))
		{
			gateb_captured = true
			EntFire("tranquility1_ready_particles", "Stop")
			EntFire("tranquility2_ready_particles", "Stop")
			return
		}

		if (!gatea_captured)
		{
			gatea_captured = true
			return
		}

		EntFire("tranquility1_ready_particles", "Stop")
		EntFire("tranquility2_ready_particles", "Stop")
		gateb_captured = true
	}

	OnScriptHook_OnTakeDamage = function(params)
	{
		if (params.inflictor != this.hMinicrit_dummy) return

		params.crit_type = 1
	}

	Cleanup = function() { if ("LOBO" in getroottable()) delete ::LOBO }
	OnGameEvent_recalculate_holidays = function(_) { if (GetRoundState() == GR_STATE_PREROUND) Cleanup() }
	OnGameEvent_mvm_wave_complete = function(_) { Cleanup() }
}
__CollectGameEventCallbacks(LOBO)

// ty mince
LOBO.tranquility_setup[0].prop_dynamic.origin <- LOBO.tranquility1_origin
LOBO.tranquility_setup[1].info_particle_system.origin <- LOBO.tranquility1_origin
LOBO.tranquility_setup[2].info_particle_system.origin <- LOBO.tranquility1_origin

LOBO.tranquility_setup[4].prop_dynamic.origin <- LOBO.tranquility2_origin
LOBO.tranquility_setup[5].info_particle_system.origin <- LOBO.tranquility2_origin
LOBO.tranquility_setup[6].info_particle_system.origin <- LOBO.tranquility2_origin

// precache stuff for safety
LOBO.PrecacheAssets()

SpawnEntityGroupFromTable(LOBO.breaktime_relays)
SpawnEntityGroupFromTable(LOBO.boss_text)
SpawnEntityGroupFromTable(LOBO.tranquility_setup)

// you can use the popext tools, or write from scratch. its your choice. theres no real recipe really.
PopExt.AddRobotTag("lobo_mangler", { OnSpawn = function(bot, tag)
{
	local scope = bot.GetScriptScope()
	local mangler = PopExtUtil.GetItemInSlot(bot, SLOT_PRIMARY)
	local banner = PopExtUtil.HasItemInLoadout(bot, "tf_weapon_buff_item")

	scope.ManglerThink <- function() // i think to charge my mangler
	{
		// in the spawn room, try to use the banner if there is one
		if (bot.InCond(TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED) && banner != null)
		{
			bot.Weapon_Switch(banner)
			banner.PrimaryAttack()
			return
		}
		// no banner: do nothing
		if (bot.InCond(TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED) && banner == null) return

		if (bot.InCond(TF_COND_MVM_BOT_STUN_RADIOWAVE)) return
		mangler.SecondaryAttack()
	}
	PopExtUtil.AddThinkToEnt(bot, "ManglerThink")
}})

PopExt.AddRobotTag("lobo_boss1",
{
	OnSpawn = function(bot, tag)
	{
		EntFire("boss_title", "Display")
		EntFire("boss_name", "Display", null, 0.83) // 18*0.035 + 0.2
		EntFire("boss_hp", "Display", null, 0.83 + 0.865) // (17+2)*0.035 + 0.2
		SINS.ChangeClassIcon(bot, "demo_clusterbomb_hyper_lite")

		local scope = bot.GetScriptScope()
		local first_delay = Time() + 19 // 19
		local cooldown = 13.5
		local cooldown_time = Time()

		bot.AddCustomAttribute("gesture speed increase", 1.28, -1)

		local warstomp_particle1 = SpawnEntityFromTable("info_particle_system",
		{
			targetname = "warstomp_particle"
			effect_name = "eyeboss_doorway_vortex"
			start_active = false
			origin = bot.GetOrigin()
		})
		warstomp_particle1.ValidateScriptScope()
		warstomp_particle1.GetScriptScope().FollowBoss <- function()
		{
			self.SetLocalOrigin(bot.GetOrigin())
		}
		_AddThinkToEnt(warstomp_particle1, "FollowBoss")

		local warstomp_particle2 = SpawnEntityFromTable("info_particle_system",
		{
			targetname = "warstomp_particle"
			effect_name = "eyeboss_vortex_blue"
			start_active = false
			origin = bot.GetOrigin()
		})
		warstomp_particle2.ValidateScriptScope()
		warstomp_particle2.GetScriptScope().FollowBoss <- function()
		{
			self.SetLocalOrigin(bot.GetOrigin())
		}
		_AddThinkToEnt(warstomp_particle2, "FollowBoss")

		PopExtUtil.PressButton(bot, IN_RELOAD)
		scope.wep <- PopExtUtil.GetItemInSlot(bot, SLOT_PRIMARY)

		scope.WeaponFireThink <- function()
		{
			if (bot.InCond(TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED))
			{
				PopExtUtil.ReleaseButton(bot, IN_ATTACK)
				return
			}

			if (wep.Clip1() == wep.GetMaxClip1())
			{
				PopExtUtil.PressButton(bot, IN_ATTACK)
				return
			}

			if (wep.Clip1() == 0)
			{
				PopExtUtil.ReleaseButton(bot, IN_ATTACK)
				return
			}
		}
		PopExtUtil.AddThinkToEnt(bot, "WeaponFireThink")

		scope.WarStompThink <- function()
		{
			if (Time() < first_delay || Time() < cooldown_time) return

			LOBO.DisplayIndicatorCircle(bot, 9, 3, true)
			EntFire("warstomp_particle", "Start")

			local botmodel = "models/bots/demo_boss/bot_demo_boss.mdl"
			LOBO.ForceTaunt(bot, ID_TAUNT_ROAR_OWAR)
			bot.SetCustomModelWithClassAnimations("models/player/demo.mdl")
			PopExtUtil.PlayerRobotModel(bot, botmodel)
			PlayerThinkTable.BotModelThink = function()
			{
				if (Time() > self.GetTauntRemoveTime())
				{
					if (wearable != null) wearable.Destroy()

					SetPropInt(self, "m_clrRender", 0xFFFFFF)
					SetPropInt(self, "m_nRenderMode", kRenderNormal)
					self.SetCustomModelWithClassAnimations(botmodel)

					delete PlayerThinkTable.BotModelThink
				}
			}

			// play similiar sound to starfall on cast as an "audio tutorial".
			LOBO.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/starfallcaster1.mp3")

			// why isnt the find radius 16 * modelscale???
			// it actually is about 16 * 2.21 * modelscale, WTF?????
			EntFireByHandle(bot, "RunScriptCode", @"
				local origin = self.GetOrigin()

				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/thunderclapcaster.mp3`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/thunderclapcaster.mp3`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/thunderclapcaster.mp3`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/warstompbirth1.wav`)
				LOBO.PlaySoundFromEntity(self, `oz_terror_sfx/thunderclapcaster.mp3`)

				for (local player; player = FindByClassnameWithin(player, `player`, origin, 318);)
				{
					if (player.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue

					player.TakeDamage(50, DMG_MELEE, self)

					local unitvec_direction = player.GetOrigin() - origin
					unitvec_direction.z >= 0 ? unitvec_direction.z += 75 : unitvec_direction.z -= 75
					unitvec_direction *= 1 / unitvec_direction.Length()

					player.SetAbsVelocity(unitvec_direction * 1000)
				}

				for (local building; building = FindByClassnameWithin(building, `obj_*`, origin, 318);)
				{
					if (building.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue

					building.TakeDamage(200, DMG_MELEE, self)
				}

				EntFire(`warstomp_particle`, `Stop`)
				DispatchParticleEffect(`powerup_supernova_explode_blue`, origin, Vector())
			", 3, null, null)

			EntFireByHandle(bot, "RunScriptCode", "self.StopTaunt(true)", 4, null, null)

			cooldown_time = Time() + cooldown
		}
		PopExtUtil.AddThinkToEnt(bot, "WarStompThink")
	}

	OnDeath = function(bot, params)
	{
		for (local p; p = FindByName(p, "warstomp_particle");) p.Kill()
		LOBO.FeedConfrontationEndInsight()
	}
})

PopExt.AddRobotTag("lobo_boss2",
{
	OnSpawn = function(bot, tag)
	{
		EntFire("boss_name", "AddOutput", "message THE DIVIDER")
		EntFire("boss_hp", "AddOutput", "message \n\n27000 HP")
		EntFire("boss_title", "Display")
		EntFire("boss_name", "Display", null, 0.83) // 18*0.035 + 0.2
		EntFire("boss_hp", "Display", null, 0.83 + 0.655) // (11+2)*0.035 + 0.2
		SINS.ChangeClassIcon(bot, "soldier_barrage_homing_hyper")

		bot.AddCondEx(TF_COND_SODAPOPPER_HYPE, 9999, null)

		local scope = bot.GetScriptScope()

		scope.is_resisting_damage <- false

		scope.ApplyHomingToRocketThink <- function()
		{
			for (local rocket; rocket = FindByClassname(rocket, "tf_projectile_rocket");)
			{
				if (rocket.GetOwner() != bot) continue

				rocket.ValidateScriptScope()
				local rocket_scope = rocket.GetScriptScope()
				if ("is_homing" in rocket_scope) continue
				rocket_scope.is_homing <- true
				rocket_scope.HomingParams <-
				{
					Target                = null
					RocketSpeed           = 0.25
					TurnPower             = 0.1
					MaxAimError           = 80
					AimTime               = -1
					AimTimeStart          = 0
					Acceleration          = 0
					AccelerationTime      = -1
					AccelerationTimeStart = 0
				}
				IncludeScript("charon_homingprojectiles", rocket_scope)
			}
		}
		PopExtUtil.AddThinkToEnt(bot, "ApplyHomingToRocketThink")

		scope.SplitThink <- function()
		{
			if (bot.GetHealth() > bot.GetMaxHealth() * 0.5) return

			bot.AddCondEx(TF_COND_MVM_BOT_STUN_RADIOWAVE, 99, null)
			is_resisting_damage = true

			EntFireByHandle(bot, "RunScriptCode", @"
				local origin = self.GetOrigin()

				DispatchParticleEffect(`drg_wrenchmotron_teleport`, origin, Vector())
				DispatchParticleEffect(`drg_wrenchmotron_impact`, origin, Vector())

				LOBO.divider_death_origin = origin
				self.TakeDamage(99999999, DMG_MELEE, PopExtUtil.Worldspawn)
			", 3, null, null)

			delete PlayerThinkTable.SplitThink
		}
		PopExtUtil.AddThinkToEnt(bot, "SplitThink")
	}

	OnTakeDamage = function(bot, params)
	{
		if (bot.GetScriptScope().is_resisting_damage) params.damage *= 0.2
	}
})

PopExt.AddRobotTag("lobo_boss2components",
{
	OnSpawn = function(bot, tag)
	{
		if (bot.HasBotTag("lobo_boss2teleportfirst"))
			bot.SetAbsOrigin(LOBO.divider_death_origin)
		else
			EntFireByHandle(bot, "RunScriptCode", "self.SetAbsOrigin(LOBO.divider_death_origin)", 3*SINGLE_TICK, null, null)
	}

	OnDeath = function(bot, params)
	{
		LOBO.boss2_death_count++
		if (LOBO.boss2_death_count == 3) LOBO.FeedConfrontationEndInsight()
	}
})

PopExt.AddRobotTag("lobo_boss2b",
{
	OnSpawn = function(bot, tag)
	{
		bot.AddCondEx(TF_COND_SODAPOPPER_HYPE, 9999, null)

		EntFireByHandle(bot, "RunScriptCode", "LOBO.CastHealingSpellbook(self)", 1, null, null)

		bot.GetScriptScope().ApplyHomingToRayThink <- function()
		{
			for (local ray; ray = FindByClassname(ray, "tf_projectile_energy_ring");)
			{
				if (ray.GetOwner() != bot) continue

				ray.ValidateScriptScope()
				local ray_scope = ray.GetScriptScope()
				if ("is_homing" in ray_scope) continue
				ray_scope.is_homing <- true
				ray_scope.HomingParams <-
				{
					Target                = null
					RocketSpeed           = 0.2
					TurnPower             = 0.1
					MaxAimError           = 80
					AimTime               = -1
					AimTimeStart          = 0
					Acceleration          = 0
					AccelerationTime      = -1
					AccelerationTimeStart = 0
				}
				IncludeScript("charon_homingprojectiles", ray_scope)
			}
		}
		PopExtUtil.AddThinkToEnt(bot, "ApplyHomingToRayThink")
	}
})

PopExt.AddRobotTag("lobo_boss3",
{
	OnSpawn = function(bot, tag)
	{
		bot.KeyValueFromString("targetname", "kotg")
		EntFire("boss_title", "AddOutput", "message TERROR SOURCE\n\n")
		EntFire("boss_name", "AddOutput", "message THE NEXUS")
		EntFire("boss_hp", "AddOutput", "message \n\n54000 HP")
		EntFire("boss_title", "Display")
		EntFire("boss_name", "Display", null, 0.655) // 13*0.035 + 0.2
		EntFire("boss_hp", "Display", null, 0.655 + 0.585) // (9+2)*0.035 + 0.2
		SINS.ChangeClassIcon(bot, "soldier_bison_spammer_hyper_giant")

		EntFire("boss_title", "Kill", null, 10)
		EntFire("boss_name", "Kill", null, 10)
		EntFire("boss_hp", "Kill", null, 10)

		local scope = bot.GetScriptScope()
		scope.tranquility_cast_count <- 0

		local time_atspawn = Time()

		// old functionality: cast at 42 and 76 secs post spawn
		scope.TranquilityThink <- function()
		{
			if (bot.GetHealth() < bot.GetMaxHealth() * 0.6666 && tranquility_cast_count == 0)
			{
				tranquility_cast_count++
				LOBO.CastTranquilityAbility(bot, tranquility_cast_count)
			}
			else if (bot.GetHealth() < bot.GetMaxHealth() * 0.3333 && tranquility_cast_count == 1)
			{
				tranquility_cast_count++
				LOBO.CastTranquilityAbility(bot, tranquility_cast_count)
			}
		}
		PopExtUtil.AddThinkToEnt(bot, "TranquilityThink")

		scope.FrenzyThink <- function()
		{
			if (!(bot.GetHealth() < bot.GetMaxHealth() * 0.35)) return

			ClientPrint(null, 3, "\x0799CCFFThe Nexus is entering \x07FFFF66frenzy mode\x0799CCFF, shooting rockets instead of lasers!")
			SINS.ChangeClassIcon(bot, "soldier_spammer_giant")

			LOBO.PlaySoundToEveryone("oz_terror_sfx/howlofterror.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/howlofterror.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/howlofterror.mp3")
			LOBO.PlaySoundToEveryone("oz_terror_sfx/howlofterror.mp3")

			bot.SetCustomModelWithClassAnimations("models/bots/heavy/bot_heavy.mdl")
			bot.HandleTauntCommand(0)
			PlayerThinkTable.RevertModelThink <- function()
			{
				if (Time() > self.GetTauntRemoveTime())
				{
					SetPropInt(self, "m_clrRender", 0xFFFFFF)
					SetPropInt(self, "m_nRenderMode", kRenderNormal)
					self.SetCustomModelWithClassAnimations("models/bots/heavy_boss/bot_heavy_boss.mdl")

					local disp1 = FindByName(null, "tranquility1_dispenser")
					local disp2 = FindByName(null, "tranquility2_dispenser")
					if (!(disp1 == null && disp2 == null))
					{
						EntFireByHandle(self, "RunScriptCode", "self.AddCondEx(TF_COND_RADIUSHEAL_ON_DAMAGE, 9999, null)", 0.1, null, null)
						local amputator_particle = SpawnEntityFromTable("info_particle_system",
						{
							targetname = "amputator_particle"
							effect_name = "medic_radiusheal_blue_spiral"
							start_active = true
						})
						amputator_particle.ValidateScriptScope()
						amputator_particle.GetScriptScope().FollowBoss <- function()
						{
							self.SetLocalOrigin(bot.GetOrigin())
						}
						_AddThinkToEnt(amputator_particle, "FollowBoss")
					}

					delete PlayerThinkTable.RevertModelThink
				}
			}

			local frenzy_particle = SpawnEntityFromTable("info_particle_system",
			{
				targetname = "frenzy_particle"
				effect_name = "eyeboss_team_blue"
				start_active = true
			})
			frenzy_particle.ValidateScriptScope()
			frenzy_particle.GetScriptScope().FollowBoss <- function()
			{
				self.SetLocalOrigin(bot.GetOrigin() + Vector(0, 0, 75))
			}
			_AddThinkToEnt(frenzy_particle, "FollowBoss")

			local wep = PopExtUtil.GetItemInSlot(bot, SLOT_PRIMARY)
			wep.AddAttribute("override projectile type", 2, -1) // fires rockets
			wep.AddAttribute("fire rate penalty", 4, -1)
			// reset
			wep.AddAttribute("energy weapon penetration", 0, -1)
			wep.AddAttribute("dmg bonus vs buildings", 1, -1)

			delete PlayerThinkTable.FrenzyThink
		}
		PopExtUtil.AddThinkToEnt(bot, "FrenzyThink")

		local first_delay = Time() + 13 // 13
		local cooldown = 10
		local cooldown_time = Time()

		scope.StarfallThink <- function()
		{
			if (Time() < first_delay || Time() < cooldown_time) return

			LOBO.CastStarfallAbility(bot, 2)

			cooldown_time = Time() + cooldown
		}
		PopExtUtil.AddThinkToEnt(bot, "StarfallThink")
	}

	OnDeath = function(bot, params)
	{
		LOBO.KillTranquilityDispensers(0)
		EntFire("frenzy_particle", "Stop")
		EntFire("frenzy_particle", "Kill", null, 3)
		LOBO.FeedConfrontationEndInsight(true)
	}
})

PopExt.AddRobotTag("lobo_kotg1",
{
	OnSpawn = function(bot, tag)
	{
		if (LOBO.is_first_kotg_spawned || LOBO.is_tranquility_on_hold || LOBO.gateb_captured) return
		bot.KeyValueFromString("targetname", "kotg")
	}

	OnTakeDamagePost = function(bot, params)
	{
		if (LOBO.is_tranquility_on_hold || LOBO.gateb_captured) return
		LOBO.is_tranquility_on_hold = true
		LOBO.CastTranquilityAbility(bot, 1)
	}

	OnDeath = function(bot, params)
	{
		if (GetPropString(bot, "m_iName") == "kotg")
		{
			LOBO.KillTranquilityDispensers(1)
			bot.KeyValueFromString("targetname", "__obsolete")
		}
	}
})

PopExt.AddRobotTag("lobo_kotg2",
{
	OnSpawn = function(bot, tag)
	{
		if (LOBO.is_first_kotg_spawned || LOBO.is_tranquility_on_hold || LOBO.gateb_captured) return
		bot.KeyValueFromString("targetname", "kotg")
	}

	OnTakeDamagePost = function(bot, params)
	{
		if (LOBO.is_tranquility_on_hold || LOBO.gateb_captured) return
		LOBO.is_tranquility_on_hold = true
		LOBO.CastTranquilityAbility(bot, 2)
	}

	OnDeath = function(bot, params)
	{
		if (GetPropString(bot, "m_iName") == "kotg")
		{
			LOBO.KillTranquilityDispensers(2)
			bot.KeyValueFromString("targetname", "__obsolete")
		}
	}
})
