private "_getPlayerData";

_logscript = compile preprocessFileLineNumbers "\ar3play\vendor\sock-rpc\log.sqf";
call _logscript;

_sockscript = compile preprocessFileLineNumbers "\ar3play\vendor\sock-rpc\sock.sqf";
call _sockscript;

_getPlayerData = compile preprocessFileLineNumbers "\ar3play\getPlayerData.sqf";

diag_log "export-missiondatat.sqf: ok. start pinging sock_rpc...";

[] spawn {
	while {true} do {
		['echo', ['keep-alive']] call sock_rpc;
		sleep 20;
	};
};

['echo', ['keep-alive']] call sock_rpc;

if (isDedicated) then {

	addMissionEventHandler ["Ended", {
		['missionEnd', []] call sock_rpc;
	}];

	waitUntil { count allUnits > 0 };

	['missionStart', [missionName, worldName]] call sock_rpc;

	if (IS_STREAMABLE) then {
		['setIsStreamable', [true]] call sock_rpc;
	};

	[_getPlayerData] spawn {
		private "_getPlayerData";
		_getPlayerData = _this select 0;

		while {(count allUnits > 0) and (ENABLE_REPLAY)} do {
			_playersArray = [];
			{
				_playerArray = [_x] call _getPlayerData;
				_playersArray = _playersArray + [_playerArray];
			} forEach allUnits + allDead - vehicles - agents;

			['setAllPlayerData', [_playersArray]] call sock_rpc;
			sleep 2;
		};
	};
};
