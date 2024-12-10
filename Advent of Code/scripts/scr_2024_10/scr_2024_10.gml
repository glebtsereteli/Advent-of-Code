
function _2024_10() {
	var _grid = input_grid_ord("2024/2024_10.aoc");
	var _size = array_length(_grid);
	var _idirs = [+1, +0, -1, +0];
	var _jdirs = [+0, -1, +0, +1];
	var _visited = ds_grid_create(_size, _size);
	var _queue = ds_queue_create();
	test("2024/10: Hoof It", _2024_10p1, _2024_10p2, [_grid, _size, _idirs, _jdirs, _visited, _queue]);
	ds_grid_destroy(_visited);
	ds_queue_destroy(_queue);
}
function _2024_10p1(_grid, _size, _idirs, _jdirs, _visited, _queue) {
	var _total = 0;
	for (var _j = 0; _j < _size; _j++) {
		for (var _i = 0; _i < _size; _i++) {
			var _n = _grid[_j][_i];
			if (_n != vk_zero) continue;
			ds_grid_clear(_visited, false);
			ds_queue_clear(_queue);
			ds_queue_enqueue(_queue, (_i << 16) | (_j << 8) | _n);
			while (not ds_queue_empty(_queue)) {
				var _packed = ds_queue_dequeue(_queue);
				var _ii = (_packed >> 16) & 0x7F;
				var _jj = (_packed >> 8) & 0x7F;
				var _nn = _packed & 0xFF; 
				if (_visited[# _ii, _jj]) continue;
				_visited[# _ii, _jj] = true;
				if (_nn == vk_nine) {
					_total++;
					continue;
				}
				for (var _k = 0; _k < 4; _k++) {
					var _iii = _ii + _idirs[_k];
					var _jjj = _jj + _jdirs[_k];
					if ((_iii < 0) or (_jjj < 0) or (_iii >= _size) or (_jjj >= _size)) continue;
					var _nnn = _grid[_jjj][_iii];
					if (_nnn != _nn + 1) continue;
					ds_queue_enqueue(_queue, (_iii << 16) | (_jjj << 8) | _nnn);
				}
			}
		}
	}
	return _total;
}
function _2024_10p2(_grid, _size, _idirs, _jdirs, _visited, _queue) {
	var _total = 0;
	for (var _j = 0; _j < _size; _j++) {
		for (var _i = 0; _i < _size; _i++) {
			var _n = _grid[_j][_i];
			if (_n != vk_zero) continue;
			ds_grid_clear(_visited, false);
			ds_queue_clear(_queue);
			ds_queue_enqueue(_queue, (_i << 16) | (_j << 8) | _n);
			while (not ds_queue_empty(_queue)) {
				var _packed = ds_queue_dequeue(_queue);
				var _ii = (_packed >> 16) & 0x7F;
				var _jj = (_packed >> 8) & 0x7F;
				var _nn = _packed & 0xFF;
				if (_nn == vk_nine) {
					_total++;
					continue;
				}
				for (var _k = 0; _k < 4; _k++) {
					var _iii = _ii + _idirs[_k];
					var _jjj = _jj + _jdirs[_k];
					if ((_iii < 0) or (_jjj < 0) or (_iii >= _size) or (_jjj >= _size)) continue;
					var _nnn = _grid[_jjj][_iii];
					if (_nnn != _nn + 1) continue;
					ds_queue_enqueue(_queue, (_iii << 16) | (_jjj << 8) | _nnn);
				}
			}
		}
	}
	return _total;
}
