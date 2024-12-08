
#macro vk_hashtag 35
#macro vk_dot 46

function _2024_08() {
	var _grid = array_map(input_grid("2024/2024_08.aoc"), function(_row) {
		return array_map(_row, ord);
	});
	test("2024/08: Resonant Collinearity", _2024_08p1, _2024_08p2, [_grid, array_length(_grid)]);
}
function _2024_08p1(_grid, _size) {
	_grid = variable_clone(_grid);
	var _ants = _2024_08_get_antennas(_grid, _size);
	var _names = struct_get_names(_ants);
	var _total = 0;
	for (var _i = 0, _n = array_length(_names); _i < _n; _i++) {
		var _antname = _names[_i]
		var _iants = _ants[$ _antname];
		for (var _j = 0, _jn = array_length(_iants); _j < _jn; _j++) {
			var _jant = _iants[_j];
			for (var _k = _j + 1; _k < _jn; _k++) {
				var _kant = _iants[_k];
				var _di = _jant._i - _kant._i;
				var _dj = _jant._j - _kant._j;
				// a
				var _ii = _jant._i + _di;
				var _jj = _jant._j - abs(_dj);
				if (_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size) {
					if (_grid[_jj][_ii] != vk_hashtag) {
						_grid[_jj][_ii] = vk_hashtag;
						_total++;
					}
				}
				// b
				var _ii = _kant._i - _di;
				var _jj = _kant._j + abs(_dj);
				if (_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size) {
					if (_grid[_jj][_ii] != vk_hashtag) {
						_grid[_jj][_ii] = vk_hashtag;
						_total++;
					}
				}
			}
		}
	}
	return _total;
}
function _2024_08p2(_grid, _size) {
	var _lut = array_create_ext(_size, method({_size}, function() {
		return array_create(_size);
	}));
	var _ants = _2024_08_get_antennas(_grid, _size);
	var _names = struct_get_names(_ants);
	var _total = 0;
	for (var _i = 0, _n = array_length(_names); _i < _n; _i++) {
		var _antname = _names[_i]
		var _iants = _ants[$ _antname];
		for (var _j = 0, _jn = array_length(_iants); _j < _jn; _j++) {
			var _jant = _iants[_j];
			for (var _k = _j + 1; _k < _jn; _k++) {
				var _kant = _iants[_k];
				var _di = _jant._i - _kant._i;
				var _dj = _jant._j - _kant._j;
				// a
				var _ii = _jant._i;
				var _jj = _jant._j;
				while (true) {
					if (_lut[_jj][_ii] != vk_hashtag) {
						_lut[_jj][_ii] = vk_hashtag;
						_total++;
					}
					_ii += _di;
					_jj -= abs(_dj);
					if (_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size) break;
				}
				// b
				var _ii = _jant._i;
				var _jj = _jant._j;
				while (true) {
					if (_lut[_jj][_ii] != vk_hashtag) {
						_lut[_jj][_ii] = vk_hashtag;
						_total++;
					}
					_ii -= _di;
					_jj += abs(_dj);
					if (_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size) break;
				}
			}
		}
	}
	return _total;
}
function _2024_08_get_antennas(_grid) {
	var _ants = {};
	for (var _j = 0, _size = array_length(_grid); _j < _size; _j++) {
		var _line = _grid[_j];
		for (var _i = 0; _i < _size; _i++) {
			var _char = _grid[_j][_i];
			if (_char == vk_dot) continue;
			if (struct_exists(_ants, _char)) {
				array_push(_ants[$ _char], {_i, _j});
			}
			else {
				_ants[$ _char] = [{_i, _j}];
			}
		}
	}
	return _ants;
}
