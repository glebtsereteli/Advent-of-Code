
function _2024_04() {
	var _lines = input_array("2024/2024_04.txt");
	test("2024/04: Ceres Search", _2024_04p1, _2024_04p2, _lines);
}
function _2024_04p1(_lines) {
	var _luta = [ord("X"), ord("M"), ord("A"), ord("S")], _luta0 = _luta[0];
	var _lutb = [ord("S"), ord("A"), ord("M"), ord("X")], _lutb0 = _lutb[0];
	var _w = string_length(_lines[0]), _w2 = _w - 2;
	var _h = array_length(_lines), _h2 = _h - 4;
	var _total = 0;
	for (var _j = 0; _j < _h; _j++) {
		var _line = _lines[_j];
		_total += string_count("XMAS", _line) + string_count("SAMX", _line); // x
		if (_j > _h2) continue;
		// vertical
		for (var _i = 1; _i <= _w; _i++) {
			var _byte = string_byte_at(_line, _i);
			if ((_byte != _luta0) and (_byte != _lutb0)) continue;
			var _lut = ((_byte == _luta0) ? _luta : _lutb);
			// +y
			var _match = false;
			for (var _k = 1; _k < 4; _k++) { 
				if (string_byte_at(_lines[_j + _k], _i) != _lut[_k]) break;
			}
			_total += (_k == 4);
			// +x+y
			if (_i < _w2) {
				for (var _k = 1; _k < 4; _k++) {
					if (string_byte_at(_lines[_j + _k], _i + _k) != _lut[_k]) break;
				}
				_total += (_k == 4);
			}
			// -x+y
			if (_i > 3) {
				for (var _k = 1; _k < 4; _k++) {
					if (string_byte_at(_lines[_j + _k], _i - _k) != _lut[_k]) break;
				}
				_total += (_k == 4);
			}
		}
	}
	return _total;
}
function _2024_04p2(_lines) {
	var _luta = [ord("M"), ord("A"), ord("S")];
	var _lutb = [ord("S"), ord("A"), ord("M")];
	var _w = string_length(_lines[0]) - 1;
	var _h = array_length(_lines) - 2;
	var _total = 0;
	for (var _j = 0; _j < _h; _j++) {
		for (var _i = 1; _i < _w; _i++) {
			// top-left
			var _bytea = string_byte_at(_lines[_j], _i); 
			if ((_bytea != _luta[0]) and (_bytea != _lutb[0])) continue;
			// bottom-left
			var _byteb = string_byte_at(_lines[_j + 2], _i); 
			if ((_byteb != _luta[0]) and (_byteb != _lutb[0])) continue;
			// criss-cross crawl
			var _lutai = ((_bytea == _luta[0]) ? _luta : _lutb);
			var _lutbi = ((_byteb == _luta[0]) ? _luta : _lutb);
			for (var _k = 1; _k < 3; _k++) {
				var _i2 = _i + _k;
				if (string_byte_at(_lines[_j + _k], _i2) != _lutai[_k]) break;
				if (string_byte_at(_lines[_j + 2 - _k], _i2) != _lutbi[_k]) break;
			}
			_total += (_k == 3);
		}
	}
	return _total;
}
