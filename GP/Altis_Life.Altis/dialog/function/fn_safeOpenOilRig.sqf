#include "..\..\script_macros.hpp"
/*
    File: fn_safeOpenOilRig.sqf
*/
if (dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,objNull,[objNull]];
if (isNull life_safeObj) exitWith {};
if (playerSide != east) exitWith {};
if ((life_safeObj getVariable ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if (life_safeObj getVariable ["inUse",false]) exitWith {hint localize "STR_Civ_VaultInUse"};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops_military_base"))) exitWith {
    hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops_military_base"))];
};
if (!createDialog "Oil_Rig") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventoryOilRig;
life_safeObj setVariable ["inUse",true,true];

[life_safeObj] spawn {
    waitUntil {isNull (findDisplay 6666)};
    (_this select 0) setVariable ["inUse",false,true];
};