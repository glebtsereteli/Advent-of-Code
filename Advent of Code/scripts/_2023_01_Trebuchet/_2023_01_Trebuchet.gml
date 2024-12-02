
function _2023_01() {
	var _lines = input_lines("2023/2023_01_Treduchet.txt");
	print(_2023_01a(_lines));
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
	
}
