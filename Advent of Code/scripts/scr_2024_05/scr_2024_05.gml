
function _2024_05() {
	var _input = input_string("2024/2024_05.txt");
	_input = string_replace_all(_input, "\r\n", "\n");
	_input = string_replace_all(_input, "\r", "\n");
	var _parts = string_split(_input, "\n\n");
	var _rules = DS_MAP;
	array_foreach(string_split(_parts[0], "\n"), method({_rules}, function(_rule) {
		_rules[? _rule] = true;
	}));
	var _updates = array_map(string_split(_parts[1], "\n"), function(_update) {
		return string_split(_update, ",", true);
	});
	test("2024/05: Print Queue", _2024_05p1, _2024_05p2, _rules, _updates);
}
function _2024_05p1(_rules, _updates) {
	var _total = 0;
	for (var _i = 0, _n = array_length(_updates); _i < _n; _i++) {
		var _update = _updates[_i];
		var _wrong = false;
		for (var _j = 0, _jn = array_length(_update); _j < _jn - 1; _j++) {
			if (not ds_map_exists(_rules, $"{_update[_j + 1]}|{_update[_j]}")) continue;
			_wrong = true;
			break;
		}
		if (_wrong) continue;
		_total += _update[_jn div 2];
	}
	return _total;
}
function _2024_05p2(_rules, _updates) {
	var _sort = method({_rules}, function(_a, _b) {
		return (ds_map_exists(_rules, $"{_a}|{_b}") ? -1 : 1);
	});
	var _total = 0;
	for (var _i = 0, _n = array_length(_updates); _i < _n; _i++) {
		var _update = _updates[_i];
		var _correct = true;
		for (var _j = 0, _jn = array_length(_update); _j < _jn - 1; _j++) {
			if (not ds_map_exists(_rules, $"{_update[_j + 1]}|{_update[_j]}")) continue;
			_correct = false;
			break;
		}
		if (_correct) continue;
		array_sort(_update, _sort);
		_total += _update[_jn div 2];
	}
	return _total;
}
