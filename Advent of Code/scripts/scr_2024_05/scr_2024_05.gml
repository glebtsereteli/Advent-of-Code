
function _2024_05() {
	var _input = input_linesep("2024/2024_05.aoc");
	var _rules = DS_MAP;
	with ({_rules}) array_foreach(string_split(_input[0], "\n"), function(_rule) {
		_rules[? _rule] = true;
	});
	var _updates = array_map(string_split(_input[1], "\n"), function(_update) {
		return string_split(_update, ",", true);
	});
	test("2024/05: Print Queue", _2024_05p1, _2024_05p2, [_rules, _updates]);
}
function _2024_05p1(_rules, _updates) {
	var _total = 0;
	for (var _i = 0; _i < array_length(_updates); _i++) {
		var _update = _updates[_i];
		var _wrong = false;
		for (var _j = 0, _jn = array_length(_update); _j < _jn - 1; _j++) {
			if (not ds_map_exists(_rules, $"{_update[_j + 1]}|{_update[_j]}")) continue;
			_wrong = true;
			break;
		}
		if (_wrong) continue;
		_total += _update[_jn div 2];
		array_delete(_updates, _i--, 1);
	}
	return _total;
}
function _2024_05p2(_rules, _updates) {
	var _context = { total: 0, _rules };
	array_foreach(_updates, method(_context, function(_update) {
		static _sort = function(_a, _b) {
			return (ds_map_exists(_rules, $"{_a}|{_b}") ? -1 : 1);
		};
		array_sort(_update, _sort);
		total += _update[array_length(_update) div 2];
	}));
	return _context.total;
}
