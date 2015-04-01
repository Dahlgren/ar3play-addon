private ['_unit', '_name', '_status', '_vehicletype', '_classtype', '_pos'];

_unit = _this select 0;

_pos = (getPos _unit) + [getDir _unit];

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

_classtype = 'unknown';
if (
	(_unit isKindOf 'B_soldier_AR_F') or
	(_unit isKindOf 'I_soldier_AR_F') or
	(_unit isKindOf 'O_soldier_AR_F')
) then {
	_classtype = 'mg';
} else { if (
	(_unit isKindOf 'B_Soldier_SL_F') or
	(_unit isKindOf 'I_Soldier_SL_F') or
	(_unit isKindOf 'O_Soldier_SL_F')
) then {
	_classtype = 'officer';
} else { if (
	(_unit isKindOf 'B_soldier_TL_F') or
	(_unit isKindOf 'I_soldier_TL_F') or
	(_unit isKindOf 'O_soldier_TL_F')
) then {
	_classtype = 'leader';
} else { if (
	(_unit isKindOf 'B_Soldier_GL_F') or
	(_unit isKindOf 'I_Soldier_GL_F') or
	(_unit isKindOf 'O_Soldier_GL_F')
) then {
	_classtype = 'unknown';
} else { if (
	(_unit isKindOf 'B_soldier_LAT_F') or
	(_unit isKindOf 'I_soldier_LAT_F') or
	(_unit isKindOf 'O_soldier_LAT_F')
) then {
	_classtype = 'at';
} else { if (
	(_unit isKindOf 'B_soldier_AA_F') or
	(_unit isKindOf 'I_soldier_AA_F') or
	(_unit isKindOf 'O_soldier_AA_F')
) then {
	_classtype = 'at';
} else { if (
	(_unit isKindOf 'B_medic_F') or
	(_unit isKindOf 'I_medic_F') or
	(_unit isKindOf 'O_medic_F')
) then {
	_classtype = 'medic';
} else { if (
	(_unit isKindOf 'B_Soldier_repair_F') or
	(_unit isKindOf 'I_Soldier_repair_F') or
	(_unit isKindOf 'O_Soldier_repair_F')
) then {
	_classtype = 'engineer';
} else { if (
	(_unit isKindOf 'B_Soldier_exp_F') or
	(_unit isKindOf 'I_Soldier_exp_F') or
	(_unit isKindOf 'O_Soldier_exp_F')
) then {
	_classtype = 'explosive';
};};};};};};};};};

[
	_name,
	_pos,
	[format ["%1", side _unit], _classtype],
	[_status, _vehicletype]
];
