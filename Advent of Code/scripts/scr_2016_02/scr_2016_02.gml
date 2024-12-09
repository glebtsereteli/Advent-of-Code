
function _2016_02() {
	var _lines = array_map(input_array("2016/2016_02.aoc"), string_explode);
	var _pad = [
		["1", "2", "3"],
		["4", "5", "6"],
		["7", "8", "9"],
	];
	var _xdirs = {L: -1, R: +1};
	var _ydirs = {U: -1, D: +1};
	test("2016/02: Bathroom Security", _2016_02p1, _2016_02p2, [_lines, _pad, _xdirs, _ydirs]);
}
function _2016_02p1(_lines, _pad, _xdirs, _ydirs) {
	var _x = 1;
	var _y = 1;
	var _password = "";
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _line = _lines[_i];
		log(_line);
		for (var _j = 0, _jn = array_length(_line); _j < _jn; _j++) {
			var _step = _line[_j];
			_x = clamp(_x + (_xdirs[$ _step] ?? 0), 0, 2);
			_y = clamp(_y + (_ydirs[$ _step] ?? 0), 0, 2);
		}
		_password += _pad[_y][_x];
	}
	return _password;
}
function _2016_02p2(_lines, _pad) {
	
}

