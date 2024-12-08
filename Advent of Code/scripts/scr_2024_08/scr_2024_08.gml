
function _2024_08() {
	var _grid = array_map(input_grid("2024/2024_08.aoc"), function(_row) {
		return array_map(_row, ord);
	});
	var _ants = DS_MAP;
	test("2024/08: Resonant Collinearity", _2024_08p1, _2024_08p2, [_grid, array_length(_grid), _ants]);
}
function _2024_08p1(_grid, _size, _ants) {
	for (var _j = 0; _j < _size; _j++) {
		var _line = _grid[_j];
		for (var _i = 0; _i < _size; _i++) {
			var _char = _grid[_j][_i];
			if (_char == vk_dot) continue;
			if (ds_map_exists(_ants, _char)) {
				array_push(_ants[? _char], {_i, _j});
			}
			else {
				_ants[? _char] = [{_i, _j}];
			}
		}
	}
	var _lut = array_create_ext(_size, method({_size}, function() {
		return array_create(_size);
	}));
	var _total = 0;
	for (var _key = ds_map_find_first(_ants); _key != undefined; _key = ds_map_find_next(_ants, _key)) {
		var _iants = _ants[? _key];
		for (var _i = 0, _n = array_length(_iants); _i < _n; _i++) {
			var _jant = _iants[_i];
			for (var _j = _i + 1; _j < _n; _j++) {
				var _kant = _iants[_j];
				var _di = _jant._i - _kant._i;
				var _dj = _jant._j - _kant._j;
				// a
				var _ii = _jant._i + _di;
				var _jj = _jant._j - abs(_dj);
				if (_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size) {
					if (not _lut[_jj][_ii]) {
						_lut[_jj][_ii] = true;
						_total++;
					}
				}
				// b
				var _ii = _kant._i - _di;
				var _jj = _kant._j + abs(_dj);
				if (_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size) {
					if (not _lut[_jj][_ii]) {
						_lut[_jj][_ii] = true;
						_total++;
					}
				}
			}
		}
	}
	return _total;
}
function _2024_08p2(_grid, _size, _ants) {
	var _lut = array_create_ext(_size, method({_size}, function() {
		return array_create(_size);
	}));
	var _total = 0;
	for (var _key = ds_map_find_first(_ants); _key != undefined; _key = ds_map_find_next(_ants, _key)) {
		var _iants = _ants[? _key];
		for (var _i = 0, _n = array_length(_iants); _i < _n; _i++) {
			var _jant = _iants[_i];
			for (var _j = _i + 1; _j < _n; _j++) {
				var _kant = _iants[_j];
				var _di = _jant._i - _kant._i;
				var _dj = _jant._j - _kant._j;
				// a
				var _ii = _jant._i;
				var _jj = _jant._j;
				do {
					if (not _lut[_jj][_ii]) {
						_lut[_jj][_ii] = true;
						_total++;
					}
					_ii += _di;
					_jj -= abs(_dj);
				} until ((_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size));
				// b
				var _ii = _jant._i;
				var _jj = _jant._j;
				do {
					if (not _lut[_jj][_ii]) {
						_lut[_jj][_ii] = true;
						_total++;
					}
					_ii -= _di;
					_jj += abs(_dj);
				} until ((_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size));
			}
		}
	}
	return _total;
}
