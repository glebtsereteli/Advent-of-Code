
function _2024_06() {
	var _input = input_string("2024/2024_06.aoc");
	var _pos = string_pos("^", string_replace_all(_input, "\r\n", ""));
	var _grid = array_map(input_string_to_array(_input), function(_row) {
		return array_map(string_explode(_row), ord);
	});
	var _size = array_length(_grid);
	var _x = _pos mod _size - 1;
	var _y = _pos div _size;
	var _path = ds_list_create();
	test("2024/06: Guard Gallivant", _2024_06p1, _2024_06p2, [_grid, _size, _x, _y, _path]);
}
function _2024_06p1(_grid, _size, _x, _y, _path) {
	var _steps = 0;
	var _dir = 90;
	var _visited = array_create_ext(_size, method({_size}, function() {
		return array_create(_size);
	}));
	while (true) {
		if (not _visited[_x][_y]) {
			_visited[_x][_y] = true;
			_steps++;
			ds_list_add(_path, _x, _y);
		}
		var _xnext = _x + lengthdir_x(1, _dir);
        var _ynext = _y + lengthdir_y(1, _dir);
		if ((_xnext < 0) or (_xnext == _size) or (_ynext < 0) or (_ynext == _size)) break;
		if (_grid[_ynext][_xnext] == 35) { // #
			_dir -= 90;
			continue;
		}
		_x = _xnext;
		_y = _ynext;
	}
	return _steps;
}
function _2024_06p2(_grid, _size, _x, _y, _path) {
    var _total = 0;
	var _x1 = _x;
	var _y1 = _y;
	for (var _i = 0, _n = ds_list_size(_path); _i < _n; _i += 2) {
		var _px = _path[|_i];
		var _py = _path[|_i + 1];
		if (_px == _x1) and (_py == _y1) continue;
		
		_grid[_py][_px] = 35; // #
		
		var _dir = 90;
		_x = _x1;
		_y = _y1;
		var _turns = DS_MAP;
		while (true) {
			var _xnext = _x + lengthdir_x(1, _dir);
	        var _ynext = _y + lengthdir_y(1, _dir);
			if ((_xnext < 0) or (_xnext == _size) or (_ynext < 0) or (_ynext == _size)) break;
			if (_grid[_ynext][_xnext] == 35) { // #
				_dir -= 90;
				var _key = $"{_x},{_y},{(_dir mod 360 + 360) mod 360}";
				if (ds_map_exists(_turns, _key)) {
					_total++;
					break;
				}
				else {
					_turns[? _key] = true;
				}
				continue;
			}
			_x = _xnext;
			_y = _ynext;
		}
		_grid[_py][_px] = 46; // .
	}
	return _total;
}
