
function _2023_01() {
	var _lines = input_lines("2023/2023_01_Trebuchet.txt");
	print(_2023_01b(_lines));
}
function _2023_01a(_lines) {
	var _calibration = 0;
	var _i = 0; repeat (array_length(_lines)) {
		var _numbers = string_digits(_lines[_i]);
		_calibration += real($"{string_char_at(_numbers, 1)}{string_char_at(_numbers, string_length(_numbers))}");
		_i++;
	}
	return _calibration;
}
function _2023_01b(_lines) {
	var _numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
	var _nnumbers = array_length(_numbers);
	var _calibration = 0;
	var _i = 0; repeat (array_length(_lines)) {
		var _line = _lines[_i];
		var _j = 1; repeat (_nnumbers) {
			_line = string_replace_all(_line, string(_j), _numbers[_j - 1]);
			_j++;
		}
		var _n1, _p1 = infinity;
		var _n2, _p2 = -infinity;
		var _j = 0; repeat (_nnumbers) {
			var _number = _numbers[_j];
			var _pos = string_pos(_number, _line);
			if ((_pos > 0) and (_pos < _p1)) {
				_n1 = _j;
				_p1 = _pos;
			}
			var _pos = string_last_pos(_number, _line);
			if (_pos > _p2) {
				_n2 = _j;
				_p2 = _pos;
			}
			_j++;
		}
		_calibration += real($"{_n1 + 1}{_n2 + 1}");
		_i++;
	}
	return _calibration;
}
