private ['_unit', '_name', '_status', '_vehicletype', '_classtype', '_classTypes', '_pos'];

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

_classTypes = [
    'mg', 'mg', 'mg',
    'officer', 'officer', 'officer',
    'leader', 'leader', 'leader',
    'grenadier', 'grenadier', 'grenadier',
    'at', 'at', 'at',
    'aa', 'aa', 'aa',
    'medic', 'medic', 'medic',
    'engineer', 'engineer', 'engineer',
    'explosive', 'explosive', 'explosive'
];

_classType = 'unknown';
{
    if (_unit isKindOf _x) exitWith {
    	_classType = _classTypes select _forEachIndex
    };
} forEach [
    'B_Soldier_AR_F',    'I_Soldier_AR_F',     'O_Soldier_AR_F',
    'B_Soldier_SL_F',    'I_Soldier_SL_F',     'O_Soldier_SL_F',
    'B_Soldier_TL_F',    'I_Soldier_TL_F',     'O_Soldier_TL_F',
	'B_Soldier_GL_F',    'I_Soldier_GL_F',     'O_Soldier_GL_F',
	'B_soldier_LAT_F',   'I_soldier_LAT_F',    'O_soldier_LAT_F',
	'B_soldier_AA_F',    'I_soldier_AA_F',     'O_soldier_AA_F',
	'B_medic_F',         'I_medic_F',          'O_medic_F',
	'B_Soldier_repair_F', 'I_Soldier_repair_F', 'O_Soldier_repair_F',
	'B_Soldier_exp_F',   'I_Soldier_exp_F',    'O_Soldier_exp_F'
];

[
	_name,
	_pos,
	[format ["%1", side _unit], _classtype],
	[_status, _vehicletype]
]
