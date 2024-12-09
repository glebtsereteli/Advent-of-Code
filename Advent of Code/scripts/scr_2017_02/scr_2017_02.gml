
function _2017_02() {
	var _lines = array_map(input_array("2017/2017_02.aoc"), function(_row) {
		return array_map(string_split_ext(_row, [" ", "\t"]), real);
	});
	test("2017/02: Corruption Checksum", _2017_02p1, _2017_02p2, [_lines]);
}
function _2017_02p1(_lines) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _line = _lines[_i];
		array_sort(_line, true);
		_total += abs(array_first(_line) - array_last(_line));
	}
	return _total;
}
function _2017_02p2(_lines) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _line = _lines[_i];
		for (var _j = 0, _jn = array_length(_line); _j < _jn; _j++) {
			var _a = _line[_j];
			for (var _k = _j + 1; _k < _jn; _k++) {
				var _b = _line[_k];
				var _div = (max(_a, _b) / min(_a, _b));
				if (frac(_div) == 0) {
					_total += _div; 
				}
			}
		}
	}
	return _total;
}
