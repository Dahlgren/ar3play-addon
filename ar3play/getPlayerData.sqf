private ['_unit', '_name', '_status', '_vehicletype', '_pos', '_role'];

_unit = _this select 0;

_pos = (getPosASL _unit) + [getDir _unit];

_name = _unit getVariable ['ga_name', ''];
if (_name == '') then {
	if (alive _unit) then {
		_name = name _unit;
		_unit setVariable ['ga_name', _name];
	} else {
		_name = 'unknown';
		diag_log 'unit died before I could set its name :(';
	};
};

_status = 'unknown';
if (alive _unit) then {
	if (_unit getVariable ["AGM_isUnconscious", false]) then {
		_status = 'unconscious';
	} else {
		_status = 'alive';
	};
} else {
	_status = 'dead';
};

_vehicletype = 'unknown';
if (vehicle _unit == _unit) then {
	_vehicletype = 'none';
} else {
	_veh = vehicle _unit;
	if (_veh isKindOf "Helicopter") then {
		_vehicletype = 'helicopter';
	};
};

_role = [
	(str side _unit),
	getText(configFile >> "CfgVehicles" >> typeOf _unit >> "icon")
];

[
	_name,
	_pos,
	_role,
	[_status, _vehicletype]
]
