
function _2024_08() {
	var _grid = array_map(input_grid("2024/2024_08_DemoA.aoc"), function(_row) {
		return array_map(_row, ord);
	});
	var _size = array_length(_grid);
	var _ants = DS_MAP;
	var _lut = ds_grid_create(_size, _size);
	test("2024/08: Resonant Collinearity", _2024_08p1, _2024_08p2, [_grid, _size, _ants, _lut]);
	ds_grid_destroy(_lut);
}
function _2024_08p1(_grid, _size, _ants, _lut) {
	for (var _j = 0; _j < _size; _j++) {
		var _line = _grid[_j];
		for (var _i = 0; _i < _size; _i++) {
			var _byte = _grid[_j][_i];
			if (_byte == vk_dot) continue;
			if (ds_map_exists(_ants, _byte)) {
				array_push(_ants[? _byte], [_i, _j]);
			}
			else {
				_ants[? _byte] = [[_i, _j]];
			}
		}
	}
	for (var _key = ds_map_find_first(_ants); _key != undefined; _key = ds_map_find_next(_ants, _key)) {
		var _iants = _ants[? _key];
		for (var _i = 0, _n = array_length(_iants); _i < _n; _i++) {
			var _a = _iants[_i];
			var _ai = _a[0];
			var _aj = _a[1];
			for (var _j = _i + 1; _j < _n; _j++) {
				var _b = _iants[_j];
				var _di = _ai - _b[0];
				var _dj = _aj - _b[1];
				// a
				var _ii = _ai + _di;
				var _jj = _aj - abs(_dj);
				if ((_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size)) {
					_lut[# _jj, _ii] = true;
				}
				// b
				var _ii = _ai - _di;
				var _jj = _aj + abs(_dj);
				if (_ii > -1) and (_ii < _size) and (_jj > -1) and (_jj < _size) {
					_lut[# _jj, _ii] = true;
				}
			}
		}
	}
	return ds_grid_get_sum(_lut, 0, 0, _size, _size);
}
function _2024_08p2(_grid, _size, _ants, _lut) {
	for (var _key = ds_map_find_first(_ants); _key != undefined; _key = ds_map_find_next(_ants, _key)) {
		var _iants = _ants[? _key];
		for (var _i = 0, _n = array_length(_iants); _i < _n; _i++) {
			var _a = _iants[_i];
			var _ai = _a[0];
			var _aj = _a[1];
			for (var _j = _i + 1; _j < _n; _j++) {
				var _b = _iants[_j];
				var _di = _ai - _b[0];
				var _dj = abs(_aj - _b[1]);
				// a
				var _ii = _ai;
				var _jj = _aj;
				do {
					_lut[# _jj, _ii] = true;
					_ii += _di;
					_jj -= _dj;
				} until ((_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size));
				// b
				var _ii = _ai;
				var _jj = _aj;
				do {
					_lut[# _jj, _ii] = true;
					_ii -= _di;
					_jj += _dj;
				} until ((_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size));
			}
		}
	}
	return ds_grid_get_sum(_lut, 0, 0, _size, _size);
}
