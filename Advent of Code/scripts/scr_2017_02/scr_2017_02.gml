
function _2017_02() {
	var _lines = array_map(input_array("2017/2017_02.aoc"), function(_row) {
		return array_map(string_split_ext(_row, [" ", "\t"]), real);
	});
	test("2017/02: Corruption Checksum", _2017_02p1, _2017_02p2, [_lines]);
}
function _2017_02p1(_lines) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_lines); _i < _n; _i++) {
		var _numbers = _lines[_i];
		array_sort(_numbers, true);
		_total += abs(array_first(_numbers) - array_last(_numbers));
	}
	return _total;
}
function _2017_02p2() {
	
}
