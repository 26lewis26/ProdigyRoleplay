/*
	File: fn_adminOnOffDuty.sqf
	Author: IEthanHD
	Adapted From ALRPG: JoshL
*/

//--- Include Shitty Macros
#include <macro.h>

//--- Define Suits
_suit = [
	"U_O_Protagonist_VR",
	"U_B_Protagonist_VR",
	"U_I_Protagonist_VR"
];
_random = selectRandom _suit;

//--- Check Player Is Admin
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint "You do not have acccess to this";};

if(admin_onDuty == 1) then {
	
	//--- Set Duty Variables
	admin_onDuty = 0;
	player setVariable["onDuty",0,true];
    
    //--- Strip Player
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player forceAddUniform TGH_oldUniform;
	_count = (count TGH_oldUniformItems) - 1; 
	for "_x" from 0 to _count do { 
		_item = TGH_oldUniformItems select _x;
		player addItemToUniform _item;
	};
	player addVest TGH_oldVest;
	_count = (count TGH_oldVestItems) - 1; 
	for "_x" from 0 to _count do { 
		_item = TGH_oldVestItems select _x;
		player addItemToVest _item;
	};
	player addBackpack TGH_oldBackpack;
	_count = (count TGH_oldBackpackItems) - 1; 
	for "_x" from 0 to _count do {
		_item = TGH_oldBackpackItems select _x;
		player addItemToBackpack _item;
	};
	player addHeadgear TGH_oldHeadgear;
	player addGoggles TGH_oldGoggles;

	//--- Call Player Skins
	[] call life_fnc_playerSkins;
    
    //--- Add Old Equipment
	player addWeapon TGH_oldPWeapon;
	player addWeapon TGH_oldSWeapon;
	player addMagazine TGH_oldPWeaponMag;
	player addMagazine TGH_oldSWeaponMag;
	{
		player addPrimaryWeaponItem _x;
	} forEach TGH_oldPWeaponItems;
	{
		player addHandgunItem _x;
	} forEach TGH_oldSWeaponItems;

	//--- Call Player Skins Again
	[] call life_fnc_playerSkins;
	
	//--- Remove God Mode
	player allowDamage true;
} else {
	admin_onDuty = 1;
	player setVariable["onDuty",1,true];
	
	systemChat "Saving previous gear...";

	TGH_oldUniformItems = uniformItems player;
	TGH_oldVestItems = vestItems player;
	TGH_oldBackpackItems = backpackItems player;

	TGH_oldPWeapon = primaryWeapon player;
	TGH_oldSWeapon = handgunWeapon player;
	TGH_oldPWeaponMag = (getarray (configFile >> "CFGWeapons" >> TGH_oldPWeapon >> "magazines") select 0);
	TGH_oldSWeaponMag = (getarray (configFile >> "CFGWeapons" >> TGH_oldSWeapon >> "magazines") select 0);
	TGH_oldPWeaponItems = primaryWeaponItems player;
	TGH_oldSWeaponItems = handgunItems player;

	TGH_oldUniform = uniform player;
	TGH_oldVest = vest player;
	TGH_oldBackpack = backpack player;
	TGH_oldHeadgear = headgear player;
	TGH_oldGoggles = goggles player;

	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	removeAllWeapons player;

	player forceAddUniform _random;
	player addGoggles "G_Aviator";
	player addHeadgear "H_Cap_headphones";

	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	
	player allowDamage false;
	[] call life_fnc_playerSkins;

	systemChat "Saving previous gear!";
	hint "You are now on duty!";
};
