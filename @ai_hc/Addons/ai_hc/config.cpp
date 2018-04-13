#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class AI_Headless_Client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "ai_hc.pbo";
        author[] = {"Rob"};
    };
};

class CfgFunctions
{
    class AI_Headless_Client
    {
        tag = "AI_HC";

        class AI
        {
            file = "\ai_hc\AI";
            class static_ai {};
            class missions_handler {};
        };

        class AIMissions
        {
            file = "\ai_hc\AI\AIMissions";
            class CrashedHeli {};
            class drugsHouse {};
            class crashedMilitaryTruck {};
            class assassinationMission {};
        };

        class AIFunctions
        {
            file = "\ai_hc\AI\Functions";
            class clean_up_ai {};
            class end_mission {};
            class spawn_mission_marker {};
            class spawn_soldiers {};
            class spawn_weapons_crate {};
            class spawn_yinv_crate {};
            class spawn_unit {};
        };

    };
};
