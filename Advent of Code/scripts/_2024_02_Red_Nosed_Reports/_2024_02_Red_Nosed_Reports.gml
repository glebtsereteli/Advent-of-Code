
function _2024_02() {
	var _reports = input_lines("2024/2024_02_Red_Nose_Reports.txt");
	_reports = array_map(_reports, function(_report) {
		return array_map(string_split(_report, " ", true), function(_level) {
			return real(_level);
		});
	});
	show_debug_message(_2024_02a(_reports));
}
function _2024_02a(_reports) {
	return array_filter_ext(_reports, function(_report) {
		var _dir = undefined;
		var _i = 0; repeat (array_length(_report) - 1) {
			var _la = _report[_i];
			var _lb = _report[_i + 1];
			var _delta = _la - _lb;
			var _idir = sign(_delta);
			if (abs(_delta) > 3) return false;
			if (sign(_dir ?? _idir) != _idir) return false;
			_dir = _idir;
			_i++;
		}
		return true;
	});
}
function _2024_02b() {
	
}
