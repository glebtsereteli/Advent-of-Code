
function _2024_12() {
	with ({}) {
		grid = input_grid("2024/2024_12.aoc");
		size = array_length(grid);
		region = undefined;
		visited = array_create_2d(size, size);
		idirs = [+1, +0, -1, +0];
		jdirs = [+0, -1, +0, +1];
		test("2024/12: Garden Groups", _2024_12p1, _2024_12p2, []);
	}
}
function _2024_12p1() {
	var _total = 0;
	var _regions = [];
	var _cells = [];
	var _j = 0; repeat (size) {
		var _row = grid[_j]
		var _i = 0; repeat (size) {
			if (not visited[_j][_i]) {
				region = [];
				var _cell = grid[_j][_i];
				_2024_12_scan_region(_i, _j, _cell);
				array_push(_regions, region);
				array_push(_cells, _cell);
			}
			_i++;
		}
		_j++;
	}
	var _i = 0; repeat (array_length(_regions)) {
		var _region = _regions[_i];
		var _cell = _cells[_i];
		var _perimeter = 0;
		var _nregion = array_length(_region);
		var _j = 0; repeat (_nregion) {
			var _icell = _region[_j];
			var _ia = _icell[0];
			var _ja = _icell[1];
			var _k = 0; repeat (4) {
				var _ib = _ia + idirs[_k];
				var _jb = _ja + jdirs[_k];
				_perimeter += ((_ib < 0) or (_jb < 0) or (_ib == size) or (_jb == size) or (_cell != grid[_jb][_ib]));
				_k++;
			}
			_j++;
		}
		_total += (_nregion * _perimeter);
		_i++;
	}
	return _total;
}
function _2024_12p2() {
	
}
function _2024_12_scan_region(_i, _j, _cell) {
    if ((_i < 0) or (_j < 0) or (_i == size) or (_j == size)) return;
    if (grid[_j][_i] != _cell) return;
	if (visited[_j][_i]) return;
	
	array_push(region, [_i, _j]);
	visited[_j][_i] = true;
	
    _2024_12_scan_region(_i + 1, _j, _cell);
    _2024_12_scan_region(_i - 1, _j, _cell);
    _2024_12_scan_region(_i, _j + 1, _cell);
    _2024_12_scan_region(_i, _j - 1, _cell);
}
