
function _2016_01() {
	var _sequence = string_split(input_string("2016/2016_01.aoc"), ", ", true);
	test("2016/01: No Time for a Taxicab", _2016_01p1, _2016_01p2, _sequence);
}
function _2016_01p1(_sequence) {
	var _x = 0;
	var _y = 0;
	var _dir = 90;
	var _i = 0; repeat (array_length(_sequence)) {
		var _step = _sequence[_i];
		_dir += (string_char_at(_step, 1) == "L" ? +90 : -90);
		repeat (string_digits(_step)) {
			_x += lengthdir_x(1, _dir);
			_y += lengthdir_y(1, _dir);
		}
		_i++;
	}
	return (abs(_x) + abs(_y));
}
function _2016_01p2(_sequence) {
	var _x = 0;
	var _y = 0;
	var _dir = 90;
	var _visited = DS_MAP;
	var _i = 0; repeat (array_length(_sequence)) {
		var _step = _sequence[_i];
		_dir += (string_char_at(_step, 1) == "L" ? +90 : -90);
		repeat (string_digits(_step)) {
			_x += lengthdir_x(1, _dir);
			_y += lengthdir_y(1, _dir);
			var _key = $"{_x}x{_y}";
			if (ds_map_exists(_visited, _key)) {
				return (abs(_x) + abs(_y));
			}
			_visited[? _key] = true;
		}
		_i++;
	}
}
