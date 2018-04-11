/*
	developed by JackLags
	Usable by only the Prodigy Roleplay Community
	Any configurations are only permitted by the Prodigy Roleplay DEV Team
*/

private["_force"];

/*enable ppeffects*/
"chromAberration" ppEffectEnable true;
enableCamShake true;

/*4 minutes*/
for "_i" from 0 to 240 do
{
        _force = random 15;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.3,0.3,true];
		"chromAberration" ppEffectCommit 1;
		addcamShake[random 3, 1, random 3];
        waituntil {ppEffectCommitted "chromAberration"};
        sleep 1;
};

/*stop ppeffects*/
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
sleep 6;

/*deavtivate ppeffects*/
 "chromAberration" ppEffectEnable false;
 resetCamShake;
 
 if(!alive player) exitWith {};
