ENABLE_REPLAY = true;
IS_STREAMABLE = true;

waitUntil {isDedicated || {not(isNull player)}};

SYSTEM_LOG_LEVEL = 0;
execVM "\ar3play\export-missiondata.sqf";
