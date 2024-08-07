SECTION "Effect Commands (main)", ROMX

INCLUDE "battle/effects/effect_commands.asm"
INCLUDE "battle/effects/execute_turn.asm"
INCLUDE "battle/effects/utils.asm"

INCLUDE "battle/effects/generic/burn.asm"
INCLUDE "battle/effects/generic/charge.asm"
INCLUDE "battle/effects/generic/confuse.asm"
INCLUDE "battle/effects/generic/defrost.asm"
INCLUDE "battle/effects/generic/effect_chance.asm"
INCLUDE "battle/effects/generic/force_switch.asm"
INCLUDE "battle/effects/generic/freeze.asm"
INCLUDE "battle/effects/generic/handle_turn.asm"
INCLUDE "battle/effects/generic/hit_self.asm"
INCLUDE "battle/effects/generic/hit_target.asm"
INCLUDE "battle/effects/generic/loop.asm"
INCLUDE "battle/effects/generic/paralyze.asm"
INCLUDE "battle/effects/generic/pinch_boosts.asm"
INCLUDE "battle/effects/generic/poison.asm"
INCLUDE "battle/effects/generic/sap_health.asm"
INCLUDE "battle/effects/generic/sleep.asm"
INCLUDE "battle/effects/generic/stat_commands.asm"
INCLUDE "battle/effects/generic/stat_effects.asm"
INCLUDE "battle/effects/generic/strike_back.asm"
INCLUDE "battle/effects/generic/trap_target.asm"
INCLUDE "battle/effects/generic/type_matchup.asm"

INCLUDE "battle/effects/damage/ability_modifiers.asm"
INCLUDE "battle/effects/damage/ability_power_modifiers.asm"
INCLUDE "battle/effects/damage/calculate_stats.asm"
INCLUDE "battle/effects/damage/calculation.asm"
INCLUDE "battle/effects/damage/confusion.asm"
INCLUDE "battle/effects/damage/constant.asm"
INCLUDE "battle/effects/damage/critical_hit_stats.asm"
INCLUDE "battle/effects/damage/generic_modifiers.asm"
INCLUDE "battle/effects/damage/item_modifiers.asm"
INCLUDE "battle/effects/damage/load_stats.asm"
INCLUDE "battle/effects/damage/prepare.asm"

INCLUDE "battle/effects/ability/check_specific.asm"
INCLUDE "battle/effects/ability/moody.asm"
INCLUDE "battle/effects/ability/simple_contrary.asm"
INCLUDE "battle/effects/ability/synchronize.asm"
INCLUDE "battle/effects/ability/type_modifiers.asm"

INCLUDE "battle/effects/move/attract.asm"
INCLUDE "battle/effects/move/baton_pass.asm"
INCLUDE "battle/effects/move/belly_drum.asm"
INCLUDE "battle/effects/move/conversion.asm"
INCLUDE "battle/effects/move/counter.asm"
INCLUDE "battle/effects/move/curse.asm"
INCLUDE "battle/effects/move/disable.asm"
INCLUDE "battle/effects/move/encore.asm"
INCLUDE "battle/effects/move/false_swipe.asm"
INCLUDE "battle/effects/move/final_chance.asm"
INCLUDE "battle/effects/move/foresight.asm"
INCLUDE "battle/effects/move/fury_cutter.asm"
INCLUDE "battle/effects/move/future_sight.asm"
INCLUDE "battle/effects/move/heal_bell.asm"
INCLUDE "battle/effects/move/hidden_power.asm"
INCLUDE "battle/effects/move/magnitude.asm"
INCLUDE "battle/effects/move/metallurgy.asm"
INCLUDE "battle/effects/move/nightmare.asm"
INCLUDE "battle/effects/move/pain_split.asm"
INCLUDE "battle/effects/move/perish_song.asm"
INCLUDE "battle/effects/move/prismspray.asm"
INCLUDE "battle/effects/move/protect_endure.asm"
INCLUDE "battle/effects/move/raise_two_stats.asm"
INCLUDE "battle/effects/move/return_frustration.asm"
INCLUDE "battle/effects/move/rollout.asm"
INCLUDE "battle/effects/move/screens.asm"
INCLUDE "battle/effects/move/spikes.asm"
INCLUDE "battle/effects/move/spite.asm"
INCLUDE "battle/effects/move/substitute.asm"
INCLUDE "battle/effects/move/swagger.asm"
INCLUDE "battle/effects/move/teleport.asm"
INCLUDE "battle/effects/move/thief.asm"
INCLUDE "battle/effects/move/time_based_healing.asm"
INCLUDE "battle/effects/move/weather.asm"

INCLUDE "battle/effects/check/faint.asm"
INCLUDE "battle/effects/check/hit.asm"
INCLUDE "battle/effects/check/remaining_mons.asm"

INCLUDE "battle/effects/animation/move.asm"
INCLUDE "battle/effects/animation/stat.asm"
INCLUDE "battle/effects/animation/substitute.asm"

INCLUDE "battle/ai/switch.asm"

INCLUDE "battle/type_matchup.asm"

SECTION "Effect Commands (extra)", ROMX

INCLUDE "battle/moves/move_effects_pointers.asm"

INCLUDE "battle/moves/move_effects.asm"

INCLUDE "battle/used_move_text.asm"

INCLUDE "battle/effects/effect_commands_2.asm"

INCLUDE "battle/effects/generic/critical.asm"
INCLUDE "battle/effects/generic/powder.asm"
INCLUDE "battle/effects/generic/recoil.asm"

INCLUDE "battle/effects/move/metronome.asm"
INCLUDE "battle/effects/move/mirror_move.asm"
INCLUDE "battle/effects/move/nature_power.asm"
INCLUDE "battle/effects/move/sleep_talk.asm"
INCLUDE "battle/effects/move/transform.asm"
INCLUDE "battle/effects/move/willowisp.asm"

INCLUDE "battle/effects/check/contact_move.asm"
INCLUDE "battle/effects/check/obedience.asm"

SECTION "Enemy Trainers", ROMX

INCLUDE "trainers/get_trainer_data.asm"
INCLUDE "trainers/attributes.asm"
INCLUDE "trainers/read_party.asm"
INCLUDE "trainers/trainer_pointers.asm"
INCLUDE "trainers/trainers.asm"

SECTION "Battle Core", ROMX

INCLUDE "battle/engine/core.asm"
INCLUDE "battle/engine/text.asm"
INCLUDE "battle/engine/abilities/end_turn.asm"
INCLUDE "battle/engine/abilities/entrance.asm"
INCLUDE "battle/engine/abilities/switch_blocking.asm"
INCLUDE "battle/engine/actions/battle_menu.asm"
INCLUDE "battle/engine/actions/berserk_gene.asm"
INCLUDE "battle/engine/actions/enemy_flee.asm"
INCLUDE "battle/engine/actions/mon_faint_anim.asm"
INCLUDE "battle/engine/actions/move_selection_menu.asm"
INCLUDE "battle/engine/actions/spikes.asm"
INCLUDE "battle/engine/actions/switch.asm"
INCLUDE "battle/engine/actions/try_run.asm"
INCLUDE "battle/engine/core/controller.asm"
INCLUDE "battle/engine/core/enemy_action.asm"
INCLUDE "battle/engine/core/load_enemy_mon.asm"
INCLUDE "battle/engine/core/main_loop.asm"
INCLUDE "battle/engine/core/player_action.asm"
INCLUDE "battle/engine/endturn/encore.asm"
INCLUDE "battle/engine/endturn/future_sight.asm"
INCLUDE "battle/engine/endturn/healing_items.asm"
INCLUDE "battle/engine/endturn/leftovers.asm"
INCLUDE "battle/engine/endturn/leppa_berry.asm"
INCLUDE "battle/engine/endturn/main.asm"
INCLUDE "battle/engine/endturn/perish.asm"
INCLUDE "battle/engine/endturn/residual_damage.asm"
INCLUDE "battle/engine/endturn/screens.asm"
INCLUDE "battle/engine/endturn/weather.asm"
INCLUDE "battle/engine/endturn/wrap.asm"
INCLUDE "battle/engine/experience/award_exp_points.asm"
INCLUDE "battle/engine/experience/award_stat_exp.asm"
INCLUDE "battle/engine/experience/bar_animation.asm"
INCLUDE "battle/engine/experience/exp_bar.asm"
INCLUDE "battle/engine/experience/exp_share_check.asm"
INCLUDE "battle/engine/experience/misc.asm"
INCLUDE "battle/engine/finish/exit.asm"
INCLUDE "battle/engine/finish/lost.asm"
INCLUDE "battle/engine/finish/won.asm"
INCLUDE "battle/engine/link/random.asm"
INCLUDE "battle/engine/link/result.asm"
INCLUDE "battle/engine/link/show_record.asm"
INCLUDE "battle/engine/link/update_record.asm"
INCLUDE "battle/engine/util/get_hp_fractions.asm"
INCLUDE "battle/engine/util/gym_leader_check.asm"
INCLUDE "battle/engine/util/hp_checks.asm"
INCLUDE "battle/engine/util/hp_updates.asm"
INCLUDE "battle/engine/util/misc_checks.asm"
INCLUDE "battle/engine/util/misc_functions.asm"
INCLUDE "battle/engine/util/speed.asm"
INCLUDE "battle/engine/util/start_message.asm"
INCLUDE "battle/engine/util/stat_modifiers.asm"
INCLUDE "battle/engine/util/text_generation.asm"
INCLUDE "battle/engine/util/turn_order.asm"

INCLUDE "battle/effects/effect_command_pointers.asm"
