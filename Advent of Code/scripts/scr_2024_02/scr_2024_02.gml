
function _2024_02() {
	var _reports = array_map(input_array("2024/2024_02.txt"), function(_report) {
		return array_map(string_split(_report, " ", true), real);
	});
	print($"{_2024_02p1(_reports)}, {_2024_02p2(_reports)}");
}
function _2024_02p1(_reports) {
	return array_filter_ext(variable_clone(_reports), _2024_02_is_safe);
}
function _2024_02p2(_reports) {
	return array_filter_ext(variable_clone(_reports), function(_report) {
		var _i = 0; repeat (array_length(_report)) {
			var _ireport = variable_clone(_report);
			array_delete(_ireport, _i, 1);
			if (_2024_02_is_safe(_ireport)) {
				return true;
			}
			_i++;
		}
		return false;
	});
}
function _2024_02_is_safe(_report) {
	var _dir = undefined;
	var _i = 0; repeat (array_length(_report) - 1) {
		var _delta = _report[_i] - _report[_i + 1];
		if ((_delta == 0) or (abs(_delta) > 3)) return false;
		var _idir = sign(_delta);
		if (sign(_dir ?? _idir) != _idir) return false;
		_dir = _idir;
		_i++;
	}
	return true;
}
