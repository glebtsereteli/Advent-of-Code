
function _2024_10() {
	var _grid = input_grid_ord("2024/2024_10.aoc");
	var _size = array_length(_grid);
	var _idirs = [+1, +0, -1, +0];
	var _jdirs = [+0, -1, +0, +1];
	var _queue = ds_queue_create();
	test("2024/10: Hoof It", _2024_10p1, _2024_10p2, [_grid, _size, _idirs, _jdirs, _queue]);
	ds_queue_destroy(_queue);
}
function _2024_10p1(_grid, _size, _idirs, _jdirs, _queue) {
	var _total = 0;
	var _visited = ds_list_create();
	for (var _j = 0; _j < _size; _j++) {
		for (var _i = 0; _i < _size; _i++) {
			var _n = _grid[_j][_i];
			if (_n != vk_zero) continue;
			ds_list_clear(_visited);
			ds_queue_enqueue(_queue, (_i << 7) | _j);
			while (not ds_queue_empty(_queue)) {
				var _packed = ds_queue_dequeue(_queue);
				if (ds_list_find_index(_visited, _packed) != -1) continue;
				ds_list_add(_visited, _packed);
				var _ii = (_packed >> 7);
				var _jj = _packed & 0x7F;
				var _nn = _grid[_jj][_ii];
				if (_nn == vk_nine) {
					_total++;
					continue;
				}
				for (var _k = 0; _k < 4; _k++) {
					var _iii = _ii + _idirs[_k];
					var _jjj = _jj + _jdirs[_k];
					if ((_iii < 0) or (_jjj < 0) or (_iii >= _size) or (_jjj >= _size)) continue;
					if (_grid[_jjj][_iii] != _nn + 1) continue;
					ds_queue_enqueue(_queue, (_iii << 7) | _jjj);
				}
			}
		}
	}
	ds_list_destroy(_visited);
	return _total;
}
function _2024_10p2(_grid, _size, _idirs, _jdirs, _queue) {
	var _total = 0;
	for (var _j = 0; _j < _size; _j++) {
		for (var _i = 0; _i < _size; _i++) {
			var _n = _grid[_j][_i];
			if (_n != vk_zero) continue;
			ds_queue_enqueue(_queue, (_i << 7) | _j);
			while (not ds_queue_empty(_queue)) {
				var _packed = ds_queue_dequeue(_queue);
				var _ii = (_packed >> 7);
				var _jj = _packed & 0x7F;
				if (_grid[_jj][_ii] == vk_nine) {
					_total++;
					continue;
				}
				var _nn = _grid[_jj][_ii];
				for (var _k = 0; _k < 4; _k++) {
					var _iii = _ii + _idirs[_k];
					var _jjj = _jj + _jdirs[_k];
					if ((_iii < 0) or (_jjj < 0) or (_iii >= _size) or (_jjj >= _size)) continue;
					if (_grid[_jjj][_iii] != _nn + 1) continue;
					ds_queue_enqueue(_queue, (_iii << 7) | _jjj);
				}
			}
		}
	}
	return _total;
}
