/*
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
	var _lut = array_create_ext(_size, method({_size}, function() {
		return array_create(_size);
	}));
	var _total = 0;
	for (var _key = ds_map_find_first(_ants); _key != undefined; _key = ds_map_find_next(_ants, _key)) {
		var _iants = _ants[? _key];
		for (var _i = 0, _n = array_length(_iants); _i < _n; _i++) {
			var _aa = _iants[_i];
			for (var _j = 0; _j < _n; _j++) {
				if (_i == _j) continue;
				var _ab = _iants[_j];
				var _ii = _aa[0] + (_aa[0] - _ab[0]);
				var _jj = _aa[1] + (_aa[1] - _ab[1]);
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
			var _aa = _iants[_i];
			for (var _j = 0; _j < _n; _j++) {
				if (_i == _j) continue;
				var _ab = _iants[_j];
				var _di = _aa[0] - _ab[0];
				var _dj = _aa[1] - _ab[1];
				var _k = 0; while (true) {
					var _ii = _aa[0] + (_di * _k);
					var _jj = _aa[1] + (_dj * _k);
					if ((_ii < 0) or (_ii >= _size) or (_jj < 0) or (_jj >= _size)) break;
					if (not _lut[_jj][_ii]) {
						_lut[_jj][_ii] = true;
						_total++;
					}
					_k++;
				}
			}
		}
	}
	return _total;
}
