
function _2024_14() {
	with ({}) {
		var _input = input_string("2024/2024_14.aoc");
		_input = input_string_to_array(string_replace_all_ext(_input, ["p=", "v="], ""));
		var _n = array_length(_input);
		
		robots = array_create(_n)
		var _i = 0; repeat (_n) {
			var _r = string_split(_input[_i], " ");
			var _p = array_real(string_split(_r[0], ","));
			var _v = array_real(string_split(_r[1], ","));
			robots[_i] = {
				px: _p[0],
				py: _p[1],
				vx: _v[0],
				vy: _v[1],
			};
			_i++;
		}
		w = 101;
		h = 103;
		grid = ds_grid_create(w, h);
		
		test("2024/14: Restroom Redoubt", _2024_14p1, _2024_14p2, []);
	}
}
function _2024_14p1() {
	repeat (100) {
		array_foreach(robots, function(_r) {
			_r.px = mod2(_r.px + _r.vx, w);
			_r.py = mod2(_r.py + _r.vy, h);
		});
	}
	ds_grid_clear(grid, 0);
	array_foreach(robots, function(_r) {
		grid[# _r.px, _r.py]++;
	});
	var _w = w div 2 - 1;
	var _h = h div 2 - 1;
	var _x2 = _w + 2;
	var _y2 = _h + 2;
	var _a = ds_grid_get_sum(grid, 0, 0, _w, _h);
	var _b = ds_grid_get_sum(grid, _x2, 0, w, _h);
	var _c = ds_grid_get_sum(grid, 0, _y2, _w, h);
	var _d = ds_grid_get_sum(grid, _x2, _y2, w, h);
	return (_a * _b * _c * _d);
}
function _2024_14p2() {
	
}
function _2024_14_print_grid() {
	ds_grid_clear(grid, 0);
	array_foreach(robots, function(_r) {
		grid[# _r.px, _r.py]++;
	});
	var _string = "";
	for (var _j = 0; _j < h; _j++) {
		for (var _i = 0; _i < w; _i++) {
			var _cell = grid[# _i, _j];
			_string += ((_cell == 0) ? "." : string(_cell)); 
		}
		_string += "\n";
	}
	log(_string);
}
