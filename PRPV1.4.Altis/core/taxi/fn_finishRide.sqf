_cash = _this select 0;
_pricePerM = _this select 1;
_totalDistance = (_cash/_pricePerM);
_totalDistance = floor _totalDistance;
["cash","add",_cash] call life_fnc_handlePaper;
player removeAction taxi_ActionToLeave;
_message = parseText format ["Your customer stopped using your service. You've got $%1 for transporting him %2 meters. You have been automatically added to the OnDuty list of taxidrivers again.",round _cash,round _totalDistance];
titleText[format["%1",_message],"PLAIN"];
life_isOnDutyTaxi = true;
life_taxiCustomer = ObjNull;
[player] remoteExec ["TON_fnc_goOnDuty",2];