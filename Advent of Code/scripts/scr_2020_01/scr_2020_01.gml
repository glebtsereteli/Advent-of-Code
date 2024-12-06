
function _2020_01() {
	var _numbers = input_array_real("2020/2020_01.aoc");
	test("2020/01: Report Repair", _2020_01p1, _2020_01p2, _numbers);
}
function _2020_01p1(_numbers) {
	var _seen = DS_MAP;
	for (var _i = 0, _n = array_length(_numbers); _i < _n; _i++) {
	    var _a = _numbers[_i];
	    var _b = 2020 - _a;
	    if (ds_map_exists(_seen, _b)) {
	        return (_a * _b);
	    }
		_seen[? _a] = true;
	}
}
function _2020_01p2(_numbers) {
	for (var _i = 0, _n = array_length(_numbers); _i < _n; _i++) {
	    var _a = _numbers[_i];
	    for (var _j = _i + 1; _j < _n; _j++) {
	        var _b = _numbers[_j];
	        var _target = 2020 - (_a + _b);
			if (_target <= 0) continue;
	        var _seen = DS_MAP;
	        for (var _k = _j + 1; _k < _n; _k++) {
	            var _c = _numbers[_k];
	            if (ds_map_exists(_seen, _target)) {
	                return (_a * _b * _target);
	            }
	            ds_map_add(_seen, _c, true);
	        }
	    }
	}
}
