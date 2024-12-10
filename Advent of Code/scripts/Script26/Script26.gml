
/*
function _2024_10p1(_grid, _size, _idirs, _jdirs) {
	var _total = 0;
	for (var _j = 0; _j < _size; _j++) {
		for (var _i = 0; _i < _size; _i++) {
			var _n = _grid[_j][_i];
			if (_n != "0") continue;
			var _queue = [_n, _i, _j];
			
			while (array_length(_queue) > 0) {
				var _jj = array_pop(_queue);
				var _ii = array_pop(_queue);
				var _nn = array_pop(_queue);
				if (_nn == "9") {
					_total++;
					continue;
				}
				for (var _k = 0; _k < 4; _k++) {
					var _iii = _ii + _idirs[_k];
					var _jjj = _jj + _jdirs[_k];
					if (_iii < 0) or (_jjj < 0) or (_iii >= _size) or (_jjj >= _size) continue;
					var _nnn = _grid[_jjj][_iii];
					if (_nnn == ".") continue;
					if (real(_nnn) != real(_nn) + 1) continue;
					array_insert(_queue, 0, _nnn, _iii, _jjj);
				}
			}
		}
	}
	return _total;
}