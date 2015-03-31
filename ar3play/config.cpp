class CfgPatches 
{
	class ar3play
	{
		units[] = { };
		weapons[] = { };
		requiredVersion = 0.100000;
		requiredAddons[] = {"CBA_Extended_EventHandlers"};
		version = "1";
		projectName = "ar3play";
	};
};

class Extended_PostInit_EventHandlers 
{
    class ar3play
	{
        Init = "call compile preprocessFileLineNumbers '\ar3play\init.sqf'";
	};
};
