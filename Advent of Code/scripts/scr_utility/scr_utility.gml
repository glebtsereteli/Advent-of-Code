
global.__t = 0;
#macro BENCH_START global.__t = get_timer();
#macro BENCH_END ((get_timer() - global.__t) / 1000)
#macro BENCH_NEXT BENCH_END; BENCH_START;

global.__ds_map = ds_map_create();
#macro DS_MAP global.__ds_map; ds_map_clear(global.__ds_map);

function input_string(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	return _string;
}
function input_array(_filename) {
	return input_string_to_array(input_string(_filename));
}
function input_string_to_array(_string) {
	return array_map(string_split(_string, "\n", true), function(_string) {
		return string_trim(_string);
	});	
}
function print(_value, _loud = false) {
	show_debug_message(_value);
	if (_loud) {
		show_message(_value);
	}
}
function test(_label, _p1, _p2, _input1, _input2 = undefined) {
	var _didiver = string_repeat("=", 32);
	BENCH_START;
	var _r1 = _p1(_input1, _input2);
	var _message = $"{_didiver}\n# {_label}\n# Part 1: {_r1} - {BENCH_END}ms.";
	BENCH_START
	var _r2 = _p2(_input1, _input2);
	_message += $"\n# Part 2: {_r2} - {BENCH_END}ms.\n{_didiver}";
	show_debug_message($"\n{_message}\n");
	show_message(_message);
}

function sum() {
	var _sum = 0;
	var _i = 0; repeat (argument_count) {
		_sum += argument[_i++];
	}
	return _sum;
}
function array_sum(_array) {
	return array_reduce(_array, function(_a, _b) {
		return (_a + _b);
	});
}
