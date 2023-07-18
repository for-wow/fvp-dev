# For VanillaPlus: Addons to assist in development

**FVP_DEV_TalentsWipe** - For addon discount timer on talent wipes.


CONFIRM_TALENT_WIPE - Triggered when the Talent Reset Confirmation dialog opens.
argument1 - reset cost (in copper)

If you refuse to reset the talent, then there are no events.

CHARACTER_POINTS_CHANGED - Triggered when a player agrees to reset talents.
argument1 - the number of talents that were reset (if 5 points were spent before the reset, then there will be 5 points)

PLAYER_MONEY - fired when a player spends or receives money

The first reset costs 1 gold. The second and subsequent discards cost 5 gold. Rollback time is unknown.
