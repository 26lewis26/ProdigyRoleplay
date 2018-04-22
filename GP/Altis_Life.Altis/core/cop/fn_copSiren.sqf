#include "..\..\script_macros.hpp"
/*
    File: fn_copSiren.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the cop siren sound for other players.
*/
private ["_vehicle"];

diag_log "23123213131231312312";

_vehicle = param [0,objNull,[objNull]];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "siren"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if (!(_vehicle getVariable "siren")) exitWith {};
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["siren",false,true]};
    if (!alive _vehicle) exitWith {};
    if (isNull _vehicle) exitWith {};
	diag_log "dawdwadawdwadawdawdawdaw";
	[_vehicle,"sirenLong"] remoteExec ["life_fnc_say3D",RANY];
    sleep 4.870;//Exactly matches the length of the audio file.
    if (!(_vehicle getVariable "siren")) exitWith {};
};