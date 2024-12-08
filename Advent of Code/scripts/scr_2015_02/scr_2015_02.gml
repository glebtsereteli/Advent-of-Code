
function _2015_02() {
	var _boxes = array_map(input_array("2015/2015_02.aoc"), function(_box) {
		return array_real(string_split(_box, "x"));
	});
	test("2024/07: I Was Told There Would Be No Math", _2015_02p1, _2015_02p2, [_boxes]);
}
function _2015_02p1(_boxes) {
	with ({total:0}) {
		array_foreach(_boxes, function(_box) {
			var _l = _box[0], _w = _box[1], _h = _box[2];
			var _a = _l * _w, _b = _w * _h, _c = _h * _l;
			total += (_a * 2) + (_b * 2) + (_c * 2); // surface
			total += min(_a, _b, _c); // slack
		});
		return total;
	}
} 
function _2015_02p2(_boxes) {
	with ({total:0}) {
		array_foreach(_boxes, function(_box) {
			var _l = _box[0], _w = _box[1], _h = _box[2];
			total += min((_l + _w) * 2, (_w + _h) * 2, (_l + _h) * 2); // sides (min perimeter)
			total += _l * _w * _h; // ribbon
		});
		return total;
	}
}
