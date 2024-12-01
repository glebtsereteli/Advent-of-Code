
// 2024/1: Historian Hysteria
// https://adventofcode.com/2024/day/1

function _2024_01() {
	var _buffer = buffer_load("2024/2024_01_Historian_Hysteria.txt");
	var _input = string_split(buffer_read(_buffer, buffer_text), "\n");
	var _a = [];
	var _b = [];
	var _i = 0; repeat (array_length(_input)) {
		var _pair = string_split(_input[_i++], "   ");
		array_push(_a, real(_pair[0]));
		array_push(_b, real(_pair[1]));
	}
	show_debug_message(_2024_01a(_a, _b));
	show_debug_message(_2024_01b(_a, _b));	
}
function _2024_01a(_a, _b) {
	array_sort(_a, true);
	array_sort(_b, true);
	var _total = 0;
	var _i = 0; repeat (array_length(_a)) {
		_total += abs(_a[_i] - _b[_i]);
		_i++;
	}
	return _total;
}
function _2024_01b(_a, _b) {
	var _freq = ds_map_create();
	var _n = array_length(_a);
	var _i = 0; repeat (_n) {
		var _bn = _b[_i];
		if (not ds_map_exists(_freq, _bn)) {
			_freq[? _bn] = 0;
		}
		_freq[? _bn]++;
		_i++;
	}
	var _total = 0;
	var _i = 0; repeat (_n) {
		var _an = _a[_i];
		if (ds_map_exists(_freq, _an)) {
			_total += (_an * _freq[? _an]);
		}
		_i++;
	}
	ds_map_destroy(_freq);
	return _total;
}
