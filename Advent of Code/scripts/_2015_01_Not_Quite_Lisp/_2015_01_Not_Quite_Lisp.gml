
// 2015/01: Not Quite Lisp
// https://adventofcode.com/2015/day/1

function _2015_01() {
	var _input = input("2015/2015_01_Not_Quite_Lisp.txt");
	show_debug_message(_2015_01a(_input));
	show_debug_message(_2015_01b(_input));
}
function _2015_01a(_input) {
	return (string_count("(", _input) - string_count(")", _input));
}
function _2015_01b(_input) {
	var _floor = 0;
	var _i = 1; repeat (string_length(_input)) {
		var _char = string_char_at(_input, _i);
		_floor += (_char == "(") - (_char == ")");
		if (_floor == -1) {
			return _i;
		}
		_i++;
	}
	return undefined;
}
