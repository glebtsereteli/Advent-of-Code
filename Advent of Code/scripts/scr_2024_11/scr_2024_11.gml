// 125681

function _2024_11() {
	var _stones = string_split(input_string("2024/2024_11.aoc"), " ");
	test("2024/11: Plutonian Pebbles", _2024_11p1, _2024_11p2, [_stones]);
}
function _2024_11p1(_stones) {
	var _total = 0;
	var _blinks = 25;
	var _i = 0; repeat (array_length(_stones)) {
		_total += _2024_11_count_stones(_stones[_i++], _blinks);
	}
	return _total;
}
function _2024_11p2(_stones) {
	
}
function _2024_11_count_stones(_stone, _blinks) {
	if (_blinks-- == 0) {
	    return 1;
	}
	if (_stone == "0") {
		return _2024_11_count_stones("1", _blinks);
	}
	else {
		var _length = string_length(_stone);
		if ((_length mod 2) == 0) {
			var _half = _length div 2;
			var _l = string(real(string_copy(_stone, 1, _half)));
			var _r = string(real(string_copy(_stone, _half + 1, _half)));
			return _2024_11_count_stones(_l, _blinks) + _2024_11_count_stones(_r, _blinks);
		}
		else {
			return _2024_11_count_stones(string(real(_stone) * 2024), _blinks);
		}
	}
}
