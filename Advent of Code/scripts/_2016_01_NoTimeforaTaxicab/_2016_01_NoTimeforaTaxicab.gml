
function _2016_01() {
	var _input = input("2016/2016_01_NoTimeforaTaxicab.txt");
	var _sequence = string_split(_input, ", ", true);
	var _t = get_timer();
	print(_2016_01a(_sequence), false);
	print((get_timer() - _t) / 1000);
}
function _2016_01a(_sequence) {
	var _x = 0;
	var _y = 0;
	var _dir = 90;
	var _i = 0; repeat (array_length(_sequence)) {
		var _step = _sequence[_i];
		_dir += (string_char_at(_step, 1) == "L" ? +90 : -90);
		repeat (string_digits(_step)) {
			_x += lengthdir_x(1, _dir);
			_y += lengthdir_y(1, _dir);
		}
		_i++;
	}
	return (abs(_x) + abs(_y));
}
function _2016_01b(_input) {
	
}
