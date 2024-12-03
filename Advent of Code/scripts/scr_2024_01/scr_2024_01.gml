
function _2024_01() {
	var _input = input_array("2024/2024_01.txt");
	var _n = array_length(_input);
	var _a = array_create(_n);
	var _b = array_create(_n);
	var _i = 0; repeat (_n) {
		var _pair = string_split(_input[_i], "   ");
		_a[_i] = real(_pair[0]);
		_b[_i] = real(_pair[1]);
		_i++;
	}
	test("2024/01: Historian Hysteria", _2024_01p1, _2024_01p2, _a, _b);
}
function _2024_01p1(_a, _b) {
	array_sort(_a, true);
	array_sort(_b, true);
	var _total = 0;
	var _i = 0; repeat (array_length(_a)) {
		_total += abs(_a[_i] - _b[_i]);
		_i++;
	}
	return _total;
}
function _2024_01p2(_a, _b) {
	var _freq = DS_MAP;
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
	return _total;
}
