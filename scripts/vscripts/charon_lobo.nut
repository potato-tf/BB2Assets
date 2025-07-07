try { IncludeScript( "lobo_core.nut" ) }
catch ( e ) { ClientPrint( null, 3, "\x07FFB4B4Failed to find or run script file lobo_core.nut. This mission will not function correctly. Please make sure the map is on the latest version." ) }

try { IncludeScript( "seel_ins.nut", __root ) }
catch ( e ) { ClientPrint( null, 3, "\x07FFB4B4Failed to find or run script file seel_ins.nut. Some information on the wave bar will be lost. Please make sure the map is on the latest version." ) }

// ----- Precaching assets -----

PrecacheSound( "oz_terror_sfx/tranquility.mp3" )
PrecacheSound( "oz_terror_sfx/starfallcaster1.mp3" )
PrecacheSound( "oz_terror_sfx/warstompbirth1.wav" )
PrecacheSound( "oz_terror_sfx/thunderclapcaster.mp3" )
PrecacheSound( "oz_terror_sfx/howlofterror.mp3" )
PrecacheSound( "oz_terror_sfx/keimou_in.mp3" )
PrecacheSound( "oz_terror_sfx/keimou_out.mp3" )
PrecacheModel( "models/props_mvm/indicator/indicator_circle_long.mdl" )
// Precaching assets

// ----- Handling entity templates -----

// slick:
// LOBO.tranquility1_origin <- Vector( -634, 298, 0 )
// LOBO.tranquility2_origin <- Vector( -691, -316, 0 )

// charon:
LOBO.tranquility1_origin <- Vector( 3275, -207, -575 )
LOBO.tranquility2_origin <- Vector( 2772, -392, -311 )

const SF_ENVTEXT_ALLPLAYERS = 1

LOBO.breaktime_relays <-
{
	[ 0 ] =
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
	[ 1 ] =
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
	[ 2 ] =
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
	[ 3 ] =
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
	[ 4 ] =
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

LOBO.boss_text <-
{
	[ 0 ] =
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
	[ 1 ] =
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
	[ 2 ] =
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

LOBO.tranquility_setup <-
{
	[ 0 ] =
	{
		prop_dynamic =
		{
			targetname = "tranquility1_bp"
			origin = LOBO.tranquility1_origin
			angles = QAngle()
			model = "models/buildables/dispenser_blueprint.mdl"
			DefaultAnim = "idle"
			disablereceiveshadows = true
			disableshadows = true
		}
	},
	[ 1 ] =
	{
		info_particle_system =
		{
			targetname = "tranquility1_ready_particles"
			origin = LOBO.tranquility1_origin
			effect_name = "bot_recent_teleport_blue"
			start_active = false
		}
	},
	[ 2 ] =
	{
		info_particle_system =
		{
			targetname = "tranquility1_active_particles"
			origin = LOBO.tranquility1_origin

			effect_name = "teleporter_mvm_bot_persist"
			start_active = false
		}
	},
	[ 3 ] =
	{
		tf_glow =
		{
			targetname = "tranquility1_glow"
			target = "BigNet" // to not make this guy off itself on spawn
			GlowColor = "125 168 196 255"
		}
	},
	[ 4 ] =
	{
		prop_dynamic =
		{
			targetname = "tranquility2_bp"
			origin = LOBO.tranquility2_origin
			angles = QAngle()
			model = "models/buildables/dispenser_blueprint.mdl"
			DefaultAnim = "idle"
			disablereceiveshadows = true
			disableshadows = true
		}
	},
	[ 5 ] =
	{
		info_particle_system =
		{
			targetname = "tranquility2_ready_particles"
			origin = LOBO.tranquility2_origin
			effect_name = "bot_recent_teleport_blue"
			start_active = false
		}
	},
	[ 6 ] =
	{
		info_particle_system =
		{
			targetname = "tranquility2_active_particles"
			origin = LOBO.tranquility2_origin

			effect_name = "teleporter_mvm_bot_persist"
			start_active = false
		}
	},
	[ 7 ] =
	{
		tf_glow =
		{
			targetname = "tranquility2_glow"
			target = "BigNet"
			GlowColor = "125 168 196 255"
		}
	}
}

SpawnEntityGroupFromTable( LOBO.breaktime_relays )
SpawnEntityGroupFromTable( LOBO.boss_text )
SpawnEntityGroupFromTable( LOBO.tranquility_setup )
// Handling entity templates

// ----- Gate captured bools -----

LOBO.gateb_captured <- false

LOBO.CALLBACKS <-
{
	OnGameEvent_teamplay_point_captured = function( params )
	{
		local team = params.team
		if ( team != TF_TEAM_PVE_INVADERS )
			return

		// part 3 has not started, any gate capture must be a gate b cap
		if ( !( "gatea_captured" in LOBO ) )
		{
			LOBO.gateb_captured = true
			EntFire( "tranquility1_ready_particles", "Stop" )
			EntFire( "tranquility2_ready_particles", "Stop" )
			return
		}

		if ( !LOBO.gatea_captured )
		{
			LOBO.gatea_captured = true
			return
		}

		EntFire( "tranquility1_ready_particles", "Stop" )
		EntFire( "tranquility2_ready_particles", "Stop" )
		LOBO.gateb_captured = true
	}
}
__CollectGameEventCallbacks( LOBO.CALLBACKS )
// Gate captured bools

// ----- Tags: mangler -----
// TODO: see if any more bot stuck reports arise

const SLOT_PRIMARY   = 0
const SLOT_SECONDARY = 1

LOBO.AddHookedTag( "mangler",
{
	OnSpawn = function( bot )
	{
		local scope = bot.GetScriptScope()
		local mangler = LOBO.GetItemInSlot( bot, SLOT_PRIMARY )

		local banner = LOBO.GetItemInSlot( bot, SLOT_SECONDARY )
		if ( banner.GetClassname() != "tf_weapon_buff_item" )
			banner = null

		local max_banner_retry_time = Time() + 1

		scope.ManglerThink <- function() // i think to charge my mangler
		{
			// in the spawn room, try to use the banner if there is one
			if ( bot.InCond( TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED ) && banner != null )
			{
				if ( Time() < max_banner_retry_time )
				{
					bot.Weapon_Switch( banner )
					NetProps.SetPropFloat( bot, "m_flNextAttack", 0.0 )
					banner.PrimaryAttack()
					return
				}
				else
				{
					bot.Weapon_Switch( mangler )
					return
				}
			}

			// no banner: do nothing
			if ( bot.InCond( TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED ) && banner == null )
				return

			if ( bot.InCond( TF_COND_MVM_BOT_STUN_RADIOWAVE ) )
				return

			mangler.SecondaryAttack()
		}
		AddThinkToEnt( bot, "ManglerThink" )
	}
})
// Tags: mangler

// ----- Tags: boss1 -----

LOBO.DisplayIndicatorCircle <- function( ent, scale, duration, follow_ent )
{
	local indicator = SpawnEntityFromTable( "prop_dynamic",
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

	if ( follow_ent )
	{
		indicator.ValidateScriptScope()
		local scope = indicator.GetScriptScope()
		scope.FollowEntity <- function()
		{
			self.SetLocalOrigin( ent.GetOrigin() )
		}
		AddThinkToEnt( indicator, "FollowEntity" )
	}

	EntFireByHandle( indicator, "SetAnimation", "end", duration, null, null )
	EntFireByHandle( indicator, "SetDefaultAnimation", "end", duration, null, null ) // do i need this? idk it just works
	EntFireByHandle( indicator, "Kill", null, duration + 0.8, null, null )
}

LOBO.PlayerBonemergeModel <- function( player, model )
{
	local scope = player.GetScriptScope()

	// we can't always assume BonemergeModelThink is the only think running on the player ent
	// it's better to just force a think table
	Assert( scope && "ThinkTable" in scope && "RunThinkTable" in scope,
		"PlayerBonemergeModel(): Think table must be set up and running on " + player + " prior to calling" )

	if ( "bonemerge_model" in scope && scope.bonemerge_model && scope.bonemerge_model.IsValid() )
		scope.bonemerge_model.Kill()

	local bonemerge_model = Entities.CreateByClassname( "tf_wearable" )
	NetProps.SetPropString( bonemerge_model, "m_iName", "__util_bonemerge_model" )
	NetProps.SetPropInt( bonemerge_model, "m_nModelIndex", PrecacheModel( model ) )
	NetProps.SetPropBool( bonemerge_model, "m_bValidatedAttachedEntity", true )
	NetProps.SetPropEntity( bonemerge_model, "m_hOwner", player )
	bonemerge_model.SetTeam( player.GetTeam() )
	bonemerge_model.SetOwner( player )
	Entities.DispatchSpawn( bonemerge_model )
	EntFireByHandle( bonemerge_model, "SetParent", "!activator", -1, player, player )
	NetProps.SetPropInt( bonemerge_model, "m_fEffects", EF_BONEMERGE | EF_BONEMERGE_FASTCULL )
	scope.bonemerge_model <- bonemerge_model

	NetProps.SetPropInt( player, "m_nRenderMode", kRenderTransColor )
	NetProps.SetPropInt( player, "m_clrRender", 0 )

	LOBO.AddThink( player, "BonemergeModelThink", function()
	{
		if ( bonemerge_model.IsValid() && ( player.IsTaunting() || bonemerge_model.GetMoveParent() != player ) )
			bonemerge_model.AcceptInput( "SetParent", "!activator", player, player )
	})
}

// https://developer.valvesoftware.com/wiki/Team_Fortress_2/Scripting/VScript_Examples#Giving_a_taunt
LOBO.ForceTaunt <- function( player, taunt_id )
{
	local weapon = Entities.CreateByClassname( "tf_weapon_bat" )
	local active_weapon = player.GetActiveWeapon()
	player.StopTaunt( true ) // both are needed to fully clear the taunt
	player.RemoveCond( 7 )
	weapon.DispatchSpawn()
	NetProps.SetPropInt( weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", taunt_id )
	NetProps.SetPropBool( weapon, "m_AttributeManager.m_Item.m_bInitialized", true )
	NetProps.SetPropBool( weapon, "m_bForcePurgeFixedupStrings", true )
	NetProps.SetPropEntity( player, "m_hActiveWeapon", weapon )
	NetProps.SetPropInt( player, "m_iFOV", 0 ) // fix sniper rifles
	player.HandleTauntCommand( 0 )
	NetProps.SetPropEntity( player, "m_hActiveWeapon", active_weapon )
	weapon.Kill()
}

const ID_TAUNT_ROAR_OWAR = 31380
const DMG_MELEE = 134217728 // DMG_BLAST_SURFACE

LOBO.AddHookedTag( "boss1",
{
	OnSpawn = function( bot )
	{
		LOBO.SetUpThinkTable( bot )

		EntFire( "boss_title", "Display" )
		EntFire( "boss_name", "Display", null, 0.83 ) // 18*0.035 + 0.2
		EntFire( "boss_hp", "Display", null, 0.83 + 0.865 ) // (17+2)*0.035 + 0.2
		SINS.ChangeClassIcon( bot, "demo_clusterbomb_hyper_lite" )

		local scope = bot.GetScriptScope()

		bot.AddCustomAttribute( "gesture speed increase", 1.28, -1 )

		local warstomp_particle1 = SpawnEntityFromTable( "info_particle_system",
		{
			targetname = "warstomp_particle"
			effect_name = "eyeboss_doorway_vortex"
			start_active = false
			origin = bot.GetOrigin()
		})
		warstomp_particle1.ValidateScriptScope()
		warstomp_particle1.GetScriptScope().FollowBoss <- function()
		{
			self.SetLocalOrigin( bot.GetOrigin() )
		}
		AddThinkToEnt( warstomp_particle1, "FollowBoss" )

		local warstomp_particle2 = SpawnEntityFromTable( "info_particle_system",
		{
			targetname = "warstomp_particle"
			effect_name = "eyeboss_vortex_blue"
			start_active = false
			origin = bot.GetOrigin()
		})
		warstomp_particle2.ValidateScriptScope()
		warstomp_particle2.GetScriptScope().FollowBoss <- function()
		{
			self.SetLocalOrigin( bot.GetOrigin() )
		}
		AddThinkToEnt( warstomp_particle2, "FollowBoss" )

		LOBO.PressButton( bot, IN_RELOAD )
		scope.wep <- LOBO.GetItemInSlot( bot, SLOT_PRIMARY )

		LOBO.AddThink( bot, "WeaponFireThink", function()
		{
			if ( bot.InCond( TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED ) )
			{
				LOBO.ReleaseButton( bot, IN_ATTACK )
				return
			}

			if ( wep.Clip1() == wep.GetMaxClip1() )
			{
				LOBO.PressButton( bot, IN_ATTACK )
				return
			}

			if ( wep.Clip1() == 0 )
			{
				LOBO.ReleaseButton( bot, IN_ATTACK )
				return
			}
		})

		local next_cast_time = Time() + 19 // default: 19
		local cooldown = 13.5

		LOBO.AddThink( bot, "WarStompThink", function()
		{
			if ( Time() < next_cast_time )
				return

			LOBO.DisplayIndicatorCircle( bot, 9, 3, true )
			EntFire( "warstomp_particle", "Start" )

			local botmodel = "models/bots/demo_boss/bot_demo_boss.mdl"
			LOBO.ForceTaunt( bot, ID_TAUNT_ROAR_OWAR )
			bot.SetCustomModelWithClassAnimations( "models/player/demo.mdl" )
			LOBO.PlayerBonemergeModel( bot, botmodel )
			LOBO.ModifyThink( bot, "BonemergeModelThink", function()
			{
				if ( Time() > self.GetTauntRemoveTime() )
				{
					if ( bonemerge_model != null )
						bonemerge_model.Destroy()

					NetProps.SetPropInt( self, "m_clrRender", 0xFFFFFF )
					NetProps.SetPropInt( self, "m_nRenderMode", kRenderNormal )
					self.SetCustomModelWithClassAnimations( botmodel )

					LOBO.RemoveThink( self, "BonemergeModelThink" )
				}
			})

			// play similiar sound to starfall on cast as an "audio tutorial".
			EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )

			// find radius is about 16 * 2.21 * modelscale, WTF?????
			EntFireByHandle( bot, "RunScriptCode", @"
				local origin = self.GetOrigin()

				LOBO.PlaySoundAt( self, `oz_terror_sfx/warstompbirth1.wav` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/thunderclapcaster.mp3` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/warstompbirth1.wav` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/thunderclapcaster.mp3` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/warstompbirth1.wav` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/thunderclapcaster.mp3` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/warstompbirth1.wav` )
				LOBO.PlaySoundAt( self, `oz_terror_sfx/thunderclapcaster.mp3` )

				local affected = LOBO.GetAllPlayers(
				{
					team = TF_TEAM_PVE_DEFENDERS
					region = [ origin, 318 ]
				})
				foreach ( player in affected )
				{
					player.TakeDamage( 50, DMG_MELEE, self )

					local unitvec_direction = player.GetOrigin() - origin
					unitvec_direction.z >= 0 ? unitvec_direction.z += 75 : unitvec_direction.z -= 75
					unitvec_direction *= 1 / unitvec_direction.Length()

					player.SetAbsVelocity( unitvec_direction * 1000 )
				}

				for ( local building; building = Entities.FindByClassnameWithin( building, `obj_*`, origin, 318 ); )
				{
					if ( building.GetTeam() != TF_TEAM_PVE_DEFENDERS )
						continue

					building.TakeDamage( 200, DMG_MELEE, self )
				}

				EntFire( `warstomp_particle`, `Stop` )
				DispatchParticleEffect( `powerup_supernova_explode_blue`, origin, Vector() )
			", 3, null, null )

			EntFireByHandle( bot, "RunScriptCode", "self.StopTaunt( true )", 4, null, null )

			next_cast_time += cooldown
		})
	}

	OnDeath = function( bot, params )
	{
		for ( local p; p = Entities.FindByName( p, "warstomp_particle" ); )
			p.Kill()
	}
}) // Tags: boss1

// ----- Tags: boss2 & components -----

LOBO.divider_death_origin <- Vector()

// taken and adapted from TankExt, by lite
LOBO.IsPlayerStealthedOrDisguised <- function( hPlayer )
{
	if ( !hPlayer.IsPlayer() )
		return false

	return ( hPlayer.IsStealthed() || hPlayer.InCond( TF_COND_DISGUISED ) ) &&
	!hPlayer.InCond( TF_COND_BURNING ) &&
	!hPlayer.InCond( TF_COND_URINE ) &&
	!hPlayer.InCond( TF_COND_STEALTHED_BLINK ) &&
	!hPlayer.InCond( TF_COND_BLEEDING )
}

const EFL_PROJECTILE = 2097152 // EFL_NO_ROTORWASH_PUSH
const PATTACH_ABSORIGIN_FOLLOW = 1
const SF_TRIGGER_ALLOW_ALL = 64

LOBO.AddHookedTag( "boss2",
{
	OnSpawn = function( bot )
	{
		LOBO.SetUpThinkTable( bot )

		EntFire( "boss_name", "AddOutput", "message THE DIVIDER" )
		EntFire( "boss_hp", "AddOutput", "message \n\n27000 HP" )
		EntFire( "boss_title", "Display" )
		EntFire( "boss_name", "Display", null, 0.83 ) // 18*0.035 + 0.2
		EntFire( "boss_hp", "Display", null, 0.83 + 0.655 ) // (11+2)*0.035 + 0.2
		SINS.ChangeClassIcon( bot, "soldier_barrage_homing_hyper" )

		bot.AddCondEx( TF_COND_SODAPOPPER_HYPE, 9999, null )

		local scope = bot.GetScriptScope()

		scope.is_resisting_damage <- false

		LOBO.AddThink( bot, "ApplyHomingToRocketThink", function()
		{
			for ( local rocket; rocket = Entities.FindByClassname( rocket, "tf_projectile_rocket" ); )
			{
				if ( rocket.GetOwner() != bot )
					continue

				rocket.ValidateScriptScope()
				local rocket_scope = rocket.GetScriptScope()
				if ( "is_homing" in rocket_scope )
					continue

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
				IncludeScript( "charon_homingprojectiles.nut", rocket_scope )
			}
		})

		LOBO.AddThink( bot "SplitThink", function()
		{
			if ( bot.GetHealth() > bot.GetMaxHealth() * 0.5 )
				return

			bot.AddCondEx( TF_COND_MVM_BOT_STUN_RADIOWAVE, 99, null )
			is_resisting_damage = true

			EntFireByHandle( bot, "RunScriptCode", @"
				local origin = self.GetOrigin()

				DispatchParticleEffect( `drg_wrenchmotron_teleport`, origin, Vector() )
				DispatchParticleEffect( `drg_wrenchmotron_impact`, origin, Vector() )

				LOBO.divider_death_origin = origin
				self.TakeDamage( 99999999, DMG_MELEE, LOBO.worldspawn_ent )
			", 3, null, null )

			LOBO.RemoveThink( bot, "SplitThink" )
		})

		LOBO.AddThink( bot, "HomingRocketTrailThink", function()
		{
			for ( local projectile; projectile = Entities.FindByClassname( projectile, "tf_projectile_*" ); )
			{
				if ( projectile.IsEFlagSet( EFL_PROJECTILE ) || NetProps.GetPropEntity( projectile, "m_hOwnerEntity" ) != self )
					continue

				EntFireByHandle( projectile, "DispatchEffect", "ParticleEffectStop", -1, null, null )

				local particle = Entities.CreateByClassname( "trigger_particle" )

				particle.KeyValueFromString( "particle_name", "eyeboss_projectile" )
				particle.KeyValueFromInt( "attachment_type", PATTACH_ABSORIGIN_FOLLOW )
				particle.KeyValueFromInt( "spawnflags", SF_TRIGGER_ALLOW_ALL )

				Entities.DispatchSpawn( particle )

				EntFireByHandle( particle, "StartTouch", "!activator", -1, projectile, projectile )
				EntFireByHandle( particle, "Kill", "", -1, null, null )

				projectile.AddEFlags( EFL_PROJECTILE )
			}
		})
	}

	OnTakeDamage = function( bot, params )
	{
		if ( bot.GetScriptScope().is_resisting_damage )
			params.damage *= 0.2
	}
})

LOBO.AddHookedTag( "boss2components",
{
	OnSpawn = function( bot )
	{
		if ( bot.HasBotTag( "boss2teleportfirst" ) )
			bot.SetAbsOrigin( LOBO.divider_death_origin )
		else
			EntFireByHandle( bot, "RunScriptCode", "self.SetAbsOrigin( LOBO.divider_death_origin )", 0.04, null, null )
	}
})

const SLOT_PDA       = 5
const SPELL_OVERHEAL = 2

// taken and adapted from PopExt
LOBO.CastHealingSpellbook <- function( bot )
{
	local spellbook = LOBO.GetItemInSlot( bot, SLOT_PDA )

	NetProps.SetPropInt( spellbook, "m_iSelectedSpellIndex", SPELL_OVERHEAL )
	NetProps.SetPropInt( spellbook, "m_iSpellCharges", 9999 )

	bot.Weapon_Switch( spellbook )
	spellbook.AddAttribute( "disable weapon switch", 1, 1 )
	spellbook.ReapplyProvision()

	EntFireByHandle( spellbook, "RunScriptCode", "self.RemoveAttribute( `disable weapon switch` )", 1, null, null )
	EntFireByHandle( spellbook, "RunScriptCode", "self.ReapplyProvision()", 1, null, null )
}

LOBO.AddHookedTag( "boss2b",
{
	OnSpawn = function( bot )
	{
		LOBO.SetUpThinkTable( bot )

		bot.AddCondEx( TF_COND_SODAPOPPER_HYPE, 9999, null )

		EntFireByHandle( bot, "RunScriptCode", "LOBO.CastHealingSpellbook( self )", 1, null, null )

		LOBO.AddThink( bot, "ApplyHomingToRayThink", function()
		{
			for ( local ray; ray = Entities.FindByClassname( ray, "tf_projectile_energy_ring" ); )
			{
				if ( ray.GetOwner() != bot )
					continue

				ray.ValidateScriptScope()
				local ray_scope = ray.GetScriptScope()
				if ( "is_homing" in ray_scope )
					continue

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
				IncludeScript( "charon_homingprojectiles.nut", ray_scope )
			}
		})

		local next_cast_time = Time() + 1
		local cooldown = 7.5

		LOBO.AddThink( bot, "CastHealingThink", function()
		{
			if ( Time() < next_cast_time )
				return

			LOBO.CastHealingSpellbook( self )
			next_cast_time += cooldown
		})
	}
}) // Tags: boss2 & components

// ----- Tags: boss3 -----

LOBO.is_tranquility_on_hold <- false
LOBO.is_first_kotg_spawned  <- false

LOBO.CastTranquilityAbility <- function( bot, cast_count )
{
	EmitSoundEx( { sound_name = "oz_terror_sfx/tranquility.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/tranquility.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/tranquility.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/tranquility.mp3" } )
	bot.AddCondEx( TF_COND_RADIUSHEAL_ON_DAMAGE, 9999, null )

	if ( cast_count == 1 )
	{
		EntFire( "tranquility1_bp", "TurnOff" )
		EntFire( "tranquility1_ready_particles", "Stop" )

		EntFire( "tranquility1_active_particles", "Start" )

		local arg_origin = LOBO.tranquility1_origin

		local disp1 = SpawnEntityFromTable( "obj_dispenser",
		{
			targetname = "tranquility1_dispenser"
			origin = arg_origin
			angles = QAngle()
			TeamNum = 3
			defaultupgrade = 2
			SolidToPlayer = 1

			"OnDestroyed#1" : "kotg,RunScriptCode,LOBO.RemoveTranquilityEffect( self ),0,-1"

			"OnDestroyed#2" : "tranquility1_active_particles,Stop,,0,-1"
			"OnDestroyed#3" : "tranquility1_glowRunScriptCodeNetProps.SetPropEntity( self, `m_hTarget`, LOBO.bignet_ent )0-1"
			"OnDestroyed#4" : "tranquility1_beam,Kill,,0,-1"

			"OnDestroyed#5" : "tranquility1_bp,TurnOn,,0,-1"
		})
		EntFire( "tranquility1_dispenser", "SetHealth", "864" )

		local glow1 = Entities.FindByName( null, "tranquility1_glow" )
		NetProps.SetPropEntity( glow1, "m_hTarget", disp1 )

		// this is actually the hardest thing to script in this entire mission, can you believe this?
		local beam1 = SpawnEntityFromTable( "env_beam",
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
		NetProps.SetPropEntityArray( beam1, "m_hAttachEntity", bot, 1 )
	}
	else if ( cast_count == 2 )
	{
		EntFire( "tranquility2_bp", "TurnOff" )
		EntFire( "tranquility2_ready_particles", "Stop" )

		EntFire( "tranquility2_active_particles", "Start" )

		local arg_origin = LOBO.tranquility2_origin

		local disp2 = SpawnEntityFromTable( "obj_dispenser",
		{
			targetname = "tranquility2_dispenser"
			origin = arg_origin
			angles = QAngle()
			TeamNum = 3
			defaultupgrade = 2
			SolidToPlayer = 1

			"OnDestroyed#1" : "kotg,RunScriptCode,LOBO.RemoveTranquilityEffect( self ),0,-1"

			"OnDestroyed#2" : "tranquility2_active_particles,Stop,,0,-1"
			"OnDestroyed#3" : "tranquility2_glowRunScriptCodeNetProps.SetPropEntity( self, `m_hTarget`, LOBO.bignet_ent )0-1"
			"OnDestroyed#4" : "tranquility2_beam,Kill,,0,-1"

			"OnDestroyed#5" : "tranquility2_bp,TurnOn,,0,-1"
		})
		EntFire( "tranquility2_dispenser", "SetHealth", "864" )

		local glow2 = Entities.FindByName( null, "tranquility2_glow" )
		NetProps.SetPropEntity( glow2, "m_hTarget", disp2 )

		local beam2 = SpawnEntityFromTable( "env_beam",
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
		NetProps.SetPropEntityArray( beam2, "m_hAttachEntity", bot, 1 )
	}
}

LOBO.RemoveTranquilityEffect <- function( bot )
{
	if ( !bot.IsAlive() )
		return

	local disp1 = Entities.FindByName( null, "tranquility1_dispenser" )
	local disp2 = Entities.FindByName( null, "tranquility2_dispenser" )

	if ( !( disp1 == null && disp2 == null ) )
		return

	bot.RemoveCondEx( TF_COND_RADIUSHEAL_ON_DAMAGE, true )
	EntFire( "amputator_particle", "Stop" )
	EntFire( "amputator_particle", "Kill", null, 3 )
}

LOBO.KillTranquilityDispensers <- function( c )
{
	if ( c == 0 || c == 1 )
		EntFire( "tranquility1_dispenser", "RemoveHealth", 9999 )
	if ( c == 0 || c == 2 )
		EntFire( "tranquility2_dispenser", "RemoveHealth", 9999 )
}

// with help from ocet247, Seelpit, and Mince
LOBO.CastStarfallAbility <- function( bot, max_victims )
{
	local bot_origin = bot.GetOrigin()
	local victims = LOBO.GetAllPlayers(
	{
		team = TF_TEAM_PVE_DEFENDERS
		region = [ bot_origin, 1200 ]
	})

	local true_victims = max_victims >= victims.len() ? victims : victims.slice( 0, max_victims )

	EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
	EmitSoundEx( { sound_name = "oz_terror_sfx/starfallcaster1.mp3" } )
	foreach ( player in true_victims )
	{
		LOBO.DisplayIndicatorCircle( player, 6.5, 3, false )

		SpawnEntityFromTable( "info_particle_system",
		{
			targetname = "starfall_particle"
			effect_name = "eyeboss_doorway_vortex"
			start_active = true
			origin = player.GetOrigin()
		})
		SpawnEntityFromTable( "info_particle_system",
		{
			targetname = "starfall_particle"
			effect_name = "eyeboss_vortex_blue"
			start_active = true
			origin = player.GetOrigin()
		})

		local scope = player.GetScriptScope()
		scope.starfall_effect_origin <- player.GetOrigin()
		scope.starfall_caster <- bot

		EntFireByHandle( player, "RunScriptCode", @"
			DispatchParticleEffect( `powerup_supernova_explode_blue`, starfall_effect_origin, Vector() )

			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav` )
			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3` )
			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav` )
			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3` )
			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/warstompbirth1.wav` )
			LOBO.PlaySoundAt( starfall_effect_origin, `oz_terror_sfx/thunderclapcaster.mp3` )

			local affected = LOBO.GetAllPlayers(
			{
				team = TF_TEAM_PVE_DEFENDERS
				region = [ starfall_effect_origin, 230 ]
			})
			foreach ( player in affected )
			{
				player.TakeDamage( 50, DMG_MELEE, starfall_caster )

				local unitvec_direction = player.GetOrigin() - starfall_effect_origin
				unitvec_direction.z >= 0 ? unitvec_direction.z += 75 : unitvec_direction.z -= 75
				unitvec_direction *= 1 / unitvec_direction.Length()

				player.SetAbsVelocity( unitvec_direction * 1000 )
			}

			for ( local building; building = Entities.FindByClassnameWithin( building, `obj_*`, starfall_effect_origin, 230 ); )
			{
				if ( building.GetTeam() != TF_TEAM_PVE_DEFENDERS )
					continue

				building.TakeDamage( 200, DMG_MELEE, starfall_caster )
			}

			EntFire( `starfall_particle`, `Stop` )

			delete starfall_effect_origin
			delete starfall_caster
		", 3, null, null )

		EntFire( "starfall_particle", "Kill", null, 6 )
	}
}

LOBO.AddHookedTag( "boss3",
{
	OnSpawn = function( bot )
	{
		LOBO.SetUpThinkTable( bot )

		bot.KeyValueFromString( "targetname", "kotg" )
		EntFire( "boss_title", "AddOutput", "message TERROR SOURCE\n\n" )
		EntFire( "boss_name", "AddOutput", "message THE NEXUS" )
		EntFire( "boss_hp", "AddOutput", "message \n\n54000 HP" )
		EntFire( "boss_title", "Display" )
		EntFire( "boss_name", "Display", null, 0.655 ) // 13*0.035 + 0.2
		EntFire( "boss_hp", "Display", null, 0.655 + 0.585 ) // (9+2)*0.035 + 0.2
		SINS.ChangeClassIcon( bot, "soldier_bison_spammer_hyper_giant" )

		EntFire( "boss_title", "Kill", null, 10 )
		EntFire( "boss_name", "Kill", null, 10 )
		EntFire( "boss_hp", "Kill", null, 10 )

		local scope = bot.GetScriptScope()
		scope.tranquility_cast_count <- 0

		LOBO.AddThink( bot, "TranquilityThink" function()
		{
			if ( bot.GetHealth() < bot.GetMaxHealth() * 0.6666 && tranquility_cast_count == 0 )
			{
				tranquility_cast_count++
				LOBO.CastTranquilityAbility( bot, tranquility_cast_count )
			}
			else if ( bot.GetHealth() < bot.GetMaxHealth() * 0.3333 && tranquility_cast_count == 1 )
			{
				tranquility_cast_count++
				LOBO.CastTranquilityAbility( bot, tranquility_cast_count )
			}
		})

		LOBO.AddThink( bot, "FrenzyThink", function()
		{
			if ( !( bot.GetHealth() < bot.GetMaxHealth() * 0.35 ) )
				return

			ClientPrint( null, 3, "\x0799CCFFThe Nexus is entering \x07FFFF66frenzy mode\x0799CCFF, shooting rockets instead of lasers!" )
			SINS.ChangeClassIcon( bot, "soldier_spammer_giant" )

			EmitSoundEx( { sound_name = "oz_terror_sfx/howlofterror.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/howlofterror.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/howlofterror.mp3" } )
			EmitSoundEx( { sound_name = "oz_terror_sfx/howlofterror.mp3" } )

			bot.SetCustomModelWithClassAnimations( "models/bots/heavy/bot_heavy.mdl" )
			bot.HandleTauntCommand( 0 )
			LOBO.AddThink( bot, "RevertModelThink", function()
			{
				if ( Time() > self.GetTauntRemoveTime() )
				{
					NetProps.SetPropInt( self, "m_clrRender", 0xFFFFFF )
					NetProps.SetPropInt( self, "m_nRenderMode", kRenderNormal )
					self.SetCustomModelWithClassAnimations( "models/bots/heavy_boss/bot_heavy_boss.mdl" )

					local disp1 = Entities.FindByName( null, "tranquility1_dispenser" )
					local disp2 = Entities.FindByName( null, "tranquility2_dispenser" )
					if ( !( disp1 == null && disp2 == null ) )
					{
						EntFireByHandle( self, "RunScriptCode", "self.AddCondEx( TF_COND_RADIUSHEAL_ON_DAMAGE, 9999, null )", 0.1, null, null )
						local amputator_particle = SpawnEntityFromTable( "info_particle_system",
						{
							targetname = "amputator_particle"
							effect_name = "medic_radiusheal_blue_spiral"
							start_active = true
						})
						amputator_particle.ValidateScriptScope()
						amputator_particle.GetScriptScope().FollowBoss <- function()
						{
							self.SetLocalOrigin( bot.GetOrigin() )
						}
						AddThinkToEnt( amputator_particle, "FollowBoss" )
					}

					LOBO.RemoveThink( self, "RevertModelThink" )
				}
			})

			local frenzy_particle = SpawnEntityFromTable( "info_particle_system",
			{
				targetname = "frenzy_particle"
				effect_name = "eyeboss_team_blue"
				start_active = true
			})
			frenzy_particle.ValidateScriptScope()
			frenzy_particle.GetScriptScope().FollowBoss <- function()
			{
				self.SetLocalOrigin( bot.GetOrigin() + Vector( 0, 0, 75 ) )
			}
			AddThinkToEnt( frenzy_particle, "FollowBoss" )

			local wep = LOBO.GetItemInSlot( bot, SLOT_PRIMARY )
			wep.AddAttribute( "override projectile type", 2, -1 ) // fires rockets
			wep.AddAttribute( "fire rate penalty", 4, -1 )
			// reset
			wep.AddAttribute( "energy weapon penetration", 0, -1 )
			wep.AddAttribute( "dmg bonus vs buildings", 1, -1 )

			LOBO.RemoveThink( bot, "FrenzyThink" )
		})

		local next_cast_time = Time() + 13 // default: 13
		local cooldown = 10

		LOBO.AddThink( bot, "StarfallThink", function()
		{
			if ( Time() < next_cast_time )
				return

			LOBO.CastStarfallAbility( bot, 2 )

			next_cast_time += cooldown
		})
	}

	OnDeath = function( bot, params )
	{
		LOBO.KillTranquilityDispensers( 0 )
		EntFire( "frenzy_particle", "Stop" )
		EntFire( "frenzy_particle", "Kill", null, 3 )
	}
}) // Tags: boss3

// ----- Tags: kotgs -----

LOBO.AddHookedTag( "kotg1",
{
	OnSpawn = function( bot )
	{
		if ( LOBO.is_first_kotg_spawned || LOBO.is_tranquility_on_hold || LOBO.gateb_captured )
			return

		bot.KeyValueFromString( "targetname", "kotg" )
	}

	OnTakeDamagePost = function( bot, params )
	{
		if ( LOBO.is_tranquility_on_hold || LOBO.gateb_captured )
			return

		LOBO.is_tranquility_on_hold = true
		LOBO.CastTranquilityAbility( bot, 1 )
	}

	OnDeath = function( bot, params )
	{
		if ( NetProps.GetPropString( bot, "m_iName" ) == "kotg" )
		{
			LOBO.KillTranquilityDispensers( 1 )
			bot.KeyValueFromString( "targetname", "__obsolete" )
		}
	}
})

LOBO.AddHookedTag( "kotg2",
{
	OnSpawn = function( bot )
	{
		if ( LOBO.is_first_kotg_spawned || LOBO.is_tranquility_on_hold || LOBO.gateb_captured )
			return

		bot.KeyValueFromString( "targetname", "kotg" )
	}

	OnTakeDamagePost = function( bot, params )
	{
		if ( LOBO.is_tranquility_on_hold || LOBO.gateb_captured )
			return

		LOBO.is_tranquility_on_hold = true
		LOBO.CastTranquilityAbility( bot, 2 )
	}

	OnDeath = function( bot, params )
	{
		if ( NetProps.GetPropString( bot, "m_iName" ) == "kotg" )
		{
			LOBO.KillTranquilityDispensers( 2 )
			bot.KeyValueFromString( "targetname", "__obsolete" )
		}
	}
}) // Tags: kotgs

// ----- Tags: Pomson engis -----

LOBO.AddHookedTag( "pomson", // and rapidpomson
{
	OnSpawn = function( bot )
	{
		local pomson = Entities.CreateByClassname( "tf_weapon_drg_pomson" )
		NetProps.SetPropInt( pomson, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", 588 )
		NetProps.SetPropBool( pomson, "m_AttributeManager.m_Item.m_bInitialized", true)
		NetProps.SetPropBool( pomson, "m_bValidatedAttachedEntity", true)
		pomson.SetTeam( TF_TEAM_PVE_INVADERS )
		Entities.DispatchSpawn( pomson )

		LOBO.GetItemInSlot( bot, pomson.GetSlot() ).Destroy()

		bot.Weapon_Equip( pomson )

		if ( !bot.HasBotTag( "rapidpomson" ) )
			return

		pomson.AddAttribute( "fire rate bonus", 0.55, -1 )
		pomson.AddAttribute( "damage penalty", 0.8, -1 )
		pomson.AddAttribute( "faster reload rate", -0.8, -1 )
	}
})

LOBO.AddHookedTag( "engimodel"
{
	OnSpawn = function( bot )
	{
		local model = "models/bots/engineer/bot_engineer.mdl"
		if ( !IsModelPrecached( model ) )
			PrecacheModel( model )

		EntFireByHandle( bot, "SetCustomModelWithClassAnimations", model, -1, null, null )
	}
})
