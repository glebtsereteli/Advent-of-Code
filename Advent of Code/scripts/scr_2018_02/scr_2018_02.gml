
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
	
}
