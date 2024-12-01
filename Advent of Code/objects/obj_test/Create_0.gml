
var _buffer = buffer_load("2024/2024_01_Historian_Hysteria.txt");
var _input = string_split(buffer_read(_buffer, buffer_text), "\n");
var _a = [];
var _b = [];
var _i = 0; repeat (array_length(_input)) {
	var _pair = string_split(_input[_i++], "   ");
	array_push(_a, real(_pair[0]));
	array_push(_b, real(_pair[1]));
}
show_debug_message(day01a(_a, _b));
show_debug_message(day01b(_a, _b));
