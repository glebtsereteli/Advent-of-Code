
function _2021_01() {
	var _depths = input_array_real("2021/2021_01.aoc");
	test("2021/01: Sonar Sweep", _2021_01p1, _2021_01p2, [_depths]);
}
function _2021_01p1(_depths) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_depths) - 1; _i < _n; _i++) {
		_total += (_depths[_i + 1] > _depths[_i]);
	}
	return _total;
}
function _2021_01p2(_depths) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_depths) - 3; _i < _n; _i++) {
		var _bc = _depths[_i + 1] + _depths[_i + 2];
		_total += ((_depths[_i] + _bc) < (_bc + _depths[_i + 3]));
	}
	return _total;
}
