
function _2018_02() {
	var _ids = input_array("2018/2018_02.aoc");
	test("2018/02: Inventory Management System", _2018_02p1, _2018_02p2, [_ids]);
}
function _2018_02p1(_ids) {
	var _two = 0;
	var _three = 0;
	var _i = 0; repeat (array_length(_ids)) {
		var _id = _ids[_i];
		var _i2 = false;
		var _i3 = false;
		for (var _j = 1; _j <= string_length(_id); _j++) {
			var _char = string_char_at(_id, _j);
			var _n = string_count(_char, _id);
			if ((not _i2) and (_n == 2)) {
				_two++;
				_i2 = true;
				_id = string_replace_all(_id, _char, "");
			}
			if ((not _i3) and (_n == 3)) {
				_three++;
				_i3 = true;
				_id = string_replace_all(_id, _char, "");
			}
		}
		_i++;
	}
	return (_two * _three);
}
function _2018_02p2(_ids) {
	var _l = string_length(_ids[0]);
	for (var _i = 0, _n = array_length(_ids); _i < _n; _i++) {
		var _a = _ids[_i];
		for (var _j = _i + 1; _j < _n; _j++) {
			var _b = _ids[_j];
			var _diff = undefined;
			for (var _k = 1; _k <= _l; _k++) {
				if (string_byte_at(_a, _k) == string_byte_at(_b, _k)) continue;
				if (_diff == undefined) {
					_diff = _k;	
				}
				else {
					_diff = undefined;
					break;
				}
			}
			if (_diff == undefined) continue;
			return string_delete(_a, _diff, 1);
		}
	}
	return undefined;
}
