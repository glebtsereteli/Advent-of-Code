
function day01a(_a, _b) {
	array_sort(_a, true);
	array_sort(_b, true);
	var _total = 0;
	var _i = 0; repeat (array_length(_a)) {
		_total += abs(_a[_i] - _b[_i]);
		_i++;
	}
	return _total;
}
function day01b(_a, _b) {
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
