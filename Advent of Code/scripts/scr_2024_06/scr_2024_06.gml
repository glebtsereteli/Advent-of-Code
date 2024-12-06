
function _2024_06() {
	var _input = input_string("2024/2024_06.aoc");
	var _pos = string_pos("^", string_replace_all(_input, "\r\n", ""));
	var _grid = array_map(input_string_to_array(_input), function(_row) {
		return array_map(string_explode(_row), ord);
	});
	var _size = array_length(_grid);
	var _x = _pos mod _size - 1;
	var _y = _pos div _size;
	test("2024/06: Guard Gallivant", _2024_06p1, _2024_06p2, [_grid, _size, _x, _y]);
}
function _2024_06p1(_grid, _size, _x, _y) {
	var _steps = 0;
	var _dir = 90;
	var _visited = DS_MAP;
	while (true) {
		var _key = $"{_x},{_y}";
		if (not ds_map_exists(_visited, _key)) {
			_visited[? _key] = true;
			_steps++;
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
function _2024_06p2(_grid, _x, _y) {
	
}
