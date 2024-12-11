// 125681

function _2024_11() {
	var _stones = array_real(string_split(input_string("2024/2024_11.aoc"), " "));
	with ({}) {
		lut = DS_MAP;
		test("2024/11: Plutonian Pebbles", _2024_11p1, _2024_11p2, [_stones]);
	}
}
function _2024_11p1(_stones) {
	return _2024_11_process(_stones, 25);
}
function _2024_11p2(_stones) {
	return _2024_11_process(_stones, 75);
}
function _2024_11_process(_stones, _blinks) {
	var _total = 0;
	var _i = 0; repeat (array_length(_stones)) {
		_total += _2024_11_count_stones(_stones[_i++], _blinks);
	}
	return _total;
}
function _2024_11_count_stones(_stone, _blinks) {
    if (_blinks-- == 0) return 1;
	var _key = (_stone << 8) | _blinks;
    if (ds_map_exists(lut, _key)) return lut[? _key];
    var _result;
    if (_stone == 0) {
        _result = _2024_11_count_stones(1, _blinks);
    }
	else {
        var _length = floor(log10(_stone)) + 1;
        if ((_length mod 2) == 0) {
			static _powersof2 = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000];
            var _divisor = _powersof2[_length div 2];
            var _l = floor(_stone / _divisor);
            var _r = _stone mod _divisor;
            _result = _2024_11_count_stones(_l, _blinks) + _2024_11_count_stones(_r, _blinks);
        }
		else {
            _result = _2024_11_count_stones(_stone * 2024, _blinks);
        }
    }
    lut[? _key] = _result;
    return _result;
}
