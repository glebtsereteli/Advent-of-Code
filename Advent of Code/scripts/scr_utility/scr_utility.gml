
global.__t = 0;
#macro BENCH_START global.__t = get_timer();
#macro BENCH_END ((get_timer() - global.__t) / 1000)
#macro BENCH_NEXT BENCH_END; BENCH_START;

global.__ds_map = ds_map_create();
#macro DS_MAP global.__ds_map; ds_map_clear(global.__ds_map);

#macro vk_hashtag 35
#macro vk_dot 46

function input_string(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	return _string;
}
function input_array(_filename) {
	return input_string_to_array(input_string(_filename));
}
function input_grid(_filename) {
	return array_map(input_array(_filename), function(_row) {
		return string_explode(_row);
	});
}
function input_grid_ord(_filename) {
	return array_map(input_array(_filename), function(_row) {
		return array_map(string_explode(_row), ord);
	});
}
function input_array_real(_filename) {
	return array_real(input_array(_filename));
}
function input_string_to_array(_string) {
	return array_map(string_split(_string, "\n", true), function(_string) {
		return string_trim(_string);
	});	
}
function input_linesep(_filename) {
	var _input = input_string(_filename);
	_input = string_replace_all(_input, "\r\n", "\n");
	return string_split(_input, "\n\n");
}
function log(_value, _loud = false) {
	show_debug_message(_value);
	if (_loud) {
		show_message(_value);
	}
}
function test(_label, _p1, _p2, _inputs) {
	var _didiver = string_repeat("=", 32);
	BENCH_START;
	var _r1 = script_execute_ext(_p1, _inputs);
	var _message = $"{_didiver}\n# {_label}\n# Part 1: {_r1} - {BENCH_END}ms.";
	BENCH_START
	var _r2 = script_execute_ext(_p2, _inputs);
	_message += $"\n# Part 2: {_r2} - {BENCH_END}ms.\n{_didiver}";
	show_debug_message($"\n{_message}\n");
	show_message(_message);
}

function noop() {
		
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
function array_real(_array) {
	return array_map(_array, real);
}
function string_explode(_string) {
	var _n = string_length(_string);
	var _array = array_create(_n);
	var _i = 0; repeat (_n) {
		_array[_i] = string_char_at(_string, _i + 1);
		_i++;
	}
	return _array;
}
