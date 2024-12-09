
function _2016_02() {
	var _lines = input_grid_ord("2016/2016_02.aoc");
	//							  Left               Right              // Up              Down
	var _xdirs = ds_map_create(); _xdirs[? 76] = -1; _xdirs[? 82] = +1; _xdirs[? 85] = 00; _xdirs[? 68] = 00; 
	var _ydirs = ds_map_create(); _ydirs[? 76] = 00; _ydirs[? 82] = 00; _ydirs[? 85] = -1; _ydirs[? 68] = +1; 
	test("2016/02: Bathroom Security", _2016_02p1, _2016_02p2, [_lines, _xdirs, _ydirs]);
	ds_map_destroy(_xdirs);
	ds_map_destroy(_ydirs);
}
function _2016_02p1(_lines, _xdirs, _ydirs) {
	var _pad = [
	    [49, 50, 51], // 123
	    [52, 53, 54], // 456
	    [55, 56, 57], // 789
	];
	var _x = 1;
	var _y = 1;
	var _password = "";
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _line = _lines[_i];
		for (var _j = 0, _jn = array_length(_line); _j < _jn; _j++) {
			var _step = _line[_j];
			_x = clamp(_x + _xdirs[? _step], 0, 2);
			_y = clamp(_y + _ydirs[? _step], 0, 2);
		}
		_password += chr(_pad[_y][_x]);
	}
	return _password;
}
function _2016_02p2(_lines, _xdirs, _ydirs) {
	var _pad = [
	    [00, 00, 49, 00, 00], // 00100
	    [00, 50, 51, 52, 00], // 02340
	    [53, 54, 55, 56, 57], // 56789
	    [00, 65, 66, 67, 00], // 0ABC0
	    [00, 00, 68, 00, 00]  // 00D00
	];
	var _x = 0;
	var _y = 2;
	var _password = "";
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _line = _lines[_i];
		for (var _j = 0, _jn = array_length(_line); _j < _jn; _j++) {
			var _step = _line[_j];
			var _xnext = clamp(_x + _xdirs[? _step], 0, 4);
			var _ynext = clamp(_y + _ydirs[? _step], 0, 4);
			if (_pad[_ynext][_xnext] == 0) continue;
			_x = _xnext;
			_y = _ynext;
		}
		_password += chr(_pad[_y][_x]);
	}
	return _password;
}
