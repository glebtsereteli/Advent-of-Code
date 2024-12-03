
function _2017_01() {
	var _sequence = input("2017/2017_01.txt");
	print($"{_2017_01a(_sequence)}, {_2017_01b(_sequence)}");
}
function _2017_01a(_sequence) {
	var _sum = 0;
	var _n = string_length(_sequence);
	var _i = 1; repeat (_n) {
		var _a = string_char_at(_sequence, _i);
		var _b = string_char_at(_sequence, (_i mod _n) + 1);
		if (_a == _b) {
			_sum += real(_a);
		}
		_i++;
	}
	return _sum;
}
function _2017_01b(_sequence) {
	var _sum = 0;
	var _n = string_length(_sequence);
	var _step = (_n / 2);
	var _i = 1; repeat (_n) {
		var _a = string_char_at(_sequence, _i);
		var _b = string_char_at(_sequence, (_i + _step - 1) mod _n + 1);
		if (_a == _b) {
			_sum += real(_a);
		}
		_i++;
	}
	return _sum;
}