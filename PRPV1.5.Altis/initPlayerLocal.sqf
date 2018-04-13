/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
	_selectHC = name player;

	if (_selectHC == "ai_hc") then {
		[] call compile preprocessFileLineNumbers "\ai_hc\initHCAI.sqf";
	};
};

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
[] execVM "core\init.sqf";

/*Execute JIP code.*/
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};