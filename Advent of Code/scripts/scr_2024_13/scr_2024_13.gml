
function _2024_13() {
	var _input = input_array("2024/2024_13.aoc");
	var _n = array_length(_input);
	var _machines = array_create(_n / 3);
	for (var _i = 0, _j = 0; _i < _n; _i += 3) {
		var _a = string_split(_input[_i], ",");
		var _b = string_split(_input[_i + 1], ",");
		var _p = string_split(_input[_i + 2], ",");
		_machines[_j++] = {
			ax: real(string_digits(_a[0])),
			ay: real(string_digits(_a[1])),
			bx: real(string_digits(_b[0])),
			by: real(string_digits(_b[1])),
			px: real(string_digits(_p[0])),
			py: real(string_digits(_p[1])),
		};
	}
	test("2024/13: Claw Contraption", _2024_13p1, _2024_13p2, [_machines]);
}
function _2024_13p1(_machines) {
	return _2024_13_solve(_machines, 0);
}
function _2024_13p2(_machines) {
	return _2024_13_solve(_machines, 10000000000000);
}
function _2024_13_solve(_machines, _offset) {
	var _tokens = 0;
	var _i = 0; repeat (array_length(_machines)) {
	    with (_machines[_i++]) {
			var _px = px + _offset;
			var _py = py + _offset;
	        var _a = ((_px * by) - (_py * bx)) / ((ax * by) - (ay * bx));
			var _b = (_px - (ax * _a)) / bx;
			if ((frac(_a) + frac(_b)) == 0) {
				_tokens += (_a * 3) + _b;
			}
	    }
	}
	return _tokens;
}
