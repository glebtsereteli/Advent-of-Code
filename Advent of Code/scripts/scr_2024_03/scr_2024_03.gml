
function _2024_03() {
	var _input = input("2024/2024_03.txt");
	print($"{_2024_03a(_input)}, {_2024_03b(_input)}");
}
function _2024_03a(_input) {
	var _pos = 1;
	var _sum = 0;
	var _filter = "1234567890,)";
	while (true) {
		var _i = string_pos_ext("mul(", _input, _pos);
		if (_i == 0) break;
		var _a = "";
		var _b = "";
		var _left = true;
		var _unfinished = true;
		_i += 4; 
		repeat (12) {
			var _char = string_char_at(_input, _i);
			if (string_pos(_char, _filter) == 0) break;
			if (_char == ",") _left = false;
			else if (_char == ")") {
				_unfinished = false;
				break;
			}
			var _byte = string_byte_at(_input, _i);
			if ((clamp(_byte, 48, 57) == _byte)) {
				if (_left) _a += _char;
				else _b += _char;
			}
			_i++;
		}
		_pos = _i + 1;
		if ((_unfinished) or (_a == "") or (_b == "")) continue;
		_sum += (real(_a) * real(_b));
	}
	return _sum;
}
function _2024_03b(_input) {
	
}
