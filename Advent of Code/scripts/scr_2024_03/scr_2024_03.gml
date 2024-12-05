
function _2024_03() {
	var _input = input_string("2024/2024_03.aoc");
	test("2024/03: Mull It Over", _2024_03p1, _2024_03p2, _input);
}
function _2024_03p1(_input) {
	var _pos = 1;
	var _sum = 0;
	var _filter = [49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 44, 41]; // 01234567890,)
	while (true) {
		var _i = string_pos_ext("mul(", _input, _pos);
		if (_i == 0) break;
		
		var _a = "";
		var _b = "";
		var _left = true;
		var _unfinished = true;
		_i += 4; // Skip "mul(".
		repeat (8) { // Max length.
			var _byte = string_byte_at(_input, _i);
			if (not array_contains(_filter, _byte)) break;
			if (_byte == 44) _left = false; // ,
			else if (_byte == 41) { // )
				_unfinished = false;
				break;
			}
			else if ((clamp(_byte, 48, 57) == _byte)) { // 0-9
				if (_left) _a += chr(_byte);
				else _b += chr(_byte);
			}
			_i++;
		}
		_pos = _i + 1;
		if ((_unfinished) or (_a == "") or (_b == "")) continue;
		_sum += (real(_a) * real(_b));
	}
	return _sum;
}
function _2024_03p2(_input) {
	var _pos = 1;
	var _sum = 0;
	var _filter = [49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 44, 41]; // 01234567890,)
	while (true) {
		var _i = string_pos_ext("mul(", _input, _pos);
		if (_i == 0) break;
		
		if (string_last_pos_ext("don't()", _input, _i) > string_last_pos_ext("do()", _input, _i)) {
			_pos = _i + 7; // Skip "don't()".
			continue;
		}
		
		var _a = "";
		var _b = "";
		var _left = true;
		var _unfinished = true;
		_i += 4; // Skip "mul(".
		repeat (8) { // Max length.
			var _byte = string_byte_at(_input, _i);
			if (not array_contains(_filter, _byte)) break;
			if (_byte == 44) _left = false; // ,
			else if (_byte == 41) { // )
				_unfinished = false;
				break;
			}
			else if ((clamp(_byte, 48, 57) == _byte)) { // 0-9
				if (_left) _a += chr(_byte);
				else _b += chr(_byte);
			}
			_i++;
		}
		_pos = _i + 1;
		if ((_unfinished) or (_a == "") or (_b == "")) continue;
		_sum += (real(_a) * real(_b));
	}
	return _sum;
}
