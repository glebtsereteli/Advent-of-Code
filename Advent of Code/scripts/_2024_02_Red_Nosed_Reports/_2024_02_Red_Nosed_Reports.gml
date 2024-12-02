
function _2024_02() {
	var _reports = input_lines("2024/2024_02_Red_Nose_Reports.txt");
	_reports = array_map(_reports, function(_report) {
		return array_map(string_split(_report, " ", true), function(_level) {
			return real(_level);
		});
	});
	print(_2024_02a(_reports));
	print(_2024_02b(_reports));
}
function _2024_02a(_reports) {
	return array_filter_ext(variable_clone(_reports), _2024_02_is_safe);
}
function _2024_02b(_reports) {
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
		var _idir = sign(_delta);
		if (abs(_delta) > 3) return false;
		if (sign(_dir ?? _idir) != _idir) return false;
		_dir = _idir;
		_i++;
	}
	return true;
}
