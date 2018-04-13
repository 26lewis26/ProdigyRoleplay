#include "hc_macros.hpp"
/*
    File: fn_initHCAI.sqf
    Author: Rob
*/
private ["_timeStamp"];

[] execVM "\ai_hc\KRON_Strings.sqf";

_timeStamp = diag_tickTime;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting AI HC ------------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";


life_HC_isActive = true;
publicVariable "life_HC_isActive";

[] call AI_HC_fnc_missions_handler;
[] call AI_HC_fnc_static_ai;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["End of AI HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";