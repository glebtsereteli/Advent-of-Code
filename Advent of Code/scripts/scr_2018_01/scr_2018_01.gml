
function _2018_01() {
	var _pool = array_map(input_array("2018/2018_01.txt"), real);
	test("2018/01: Chronal Calibration", _2018_01p1, _2018_01p2, _pool);
}
function _2018_01p1(_pool) {
	return array_reduce(_pool, function(_a, _b) {
		return (_a + _b);
	});
}
function _2018_01p2(_pool) {
	var _prev = DS_MAP;
	var _freq = 0;
	var _n = array_length(_pool);
	var _i = 0; while (true) {
		_freq += _pool[_i];
		if (ds_map_exists(_prev, _freq)) {
			return _freq;
		}
		else {
			_prev[? _freq] = 0;
		}
		_i = (_i + 1) mod _n;
	}
}
