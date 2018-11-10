/*
 * Author: Katalam
 * CBA Events function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call kat_aceAirway_fnc_events;
 *
 * Public: No
 */

if !(kat_aceAirway_enable) exitWith {};

["treatmentLarynx", {_this call kat_aceAirway_fnc_treatmentAdvanced_larynxLocal}] call CBA_fnc_addEventHandler;
["treatmentAirway", {_this call kat_aceAirway_fnc_treatmentAdvanced_airwayLocal}] call CBA_fnc_addEventHandler;
["treatmentGuedel", {_this call kat_aceAirway_fnc_treatmentAdvanced_guedelLocal}] call CBA_fnc_addEventHandler;
["treatmentAccuvac", {_this call kat_aceAirway_fnc_treatmentAdvanced_accuvacLocal}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
  params ["_unit", "_state"];
  if !(_state) exitWith {
    _unit call kat_aceAirway_fnc_init;
  };
  if (_unit getVariable ["ace_medical_airwayCollapsed", false] || _unit getVariable ["ace_medical_airwayOccluded", false]) then {
    [_unit, CBA_missionTime] call kat_aceAirway_fnc_handleTimer;
  };
}] call CBA_fnc_addEventHandler;

["deathTimerA", {_this call kat_aceAirway_fnc_handleTimer}] call CBA_fnc_addEventHandler;
["ace_treatmentSucceded",{
 	params ["", "_target", "", "_className"];
 	if (toUpper _className isEqualTo "PERSONALAIDKIT" && local _target) exitWith {
 		_target call kat_aceAirway_fnc_init;
 	};
 }] call CBA_fnc_addEventHandler;