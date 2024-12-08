
#macro vk_hashtag 35
#macro vk_dot 46

function _2024_08() {
	var _grid = array_map(input_grid("2024/2024_08.aoc"), function(_row) {
		return array_map(_row, ord);
	});
	var _ants = {};
	for (var _j = 0, _size = array_length(_grid); _j < _size; _j++) {
		var _line = _grid[_j];
		for (var _i = 0; _i < _size; _i++) {
			var _char = _grid[_j][_i];
			if (_char == vk_dot) continue;
			if (struct_exists(_ants, _char)) {
				array_push(_ants[$ _char], {_i, _j});
			}
			else {
				_ants[$ _char] = [{_i, _j}];
			}
		}
	}
	test("2024/08: Resonant Collinearity", _2024_08p1, _2024_08p2, [_grid, _size, _ants]);
}
function _2024_08p1(_grid, _size, _ants) {
	var _names = struct_get_names(_ants);
	var _total = 0;
	for (var _i = 0, _n = array_length(_names); _i < _n; _i++) {
		var _antname = _names[_i]
		var _iants = _ants[$ _antname];
		//log($"{_antname}: {_iants}");
		
		for (var _j = 0, _jn = array_length(_iants); _j < _jn; _j++) {
			var _jant = _iants[_j];
			for (var _k = _j + 1; _k < _jn; _k++) {
				var _kant = _iants[_k];
				var _di = _jant._i - _kant._i;
				var _dj = _jant._j - _kant._j;
				//log($"{_jant} - {_kant}: {_di},{_dj}");
				
				var _anji = _jant._i + _di;
				var _anjj = _jant._j - abs(_dj);
				if (_anji > -1) and (_anji < _size) and (_anjj > -1) and (_anjj < _size) {
					if (_grid[_anjj][_anji] != vk_hashtag) {
						_grid[_anjj][_anji] = vk_hashtag;
						_total++;
						//log($"{_anji},{_anjj}");
					}
				}
				
				var _anki = _kant._i - _di;
				var _ankj = _kant._j + abs(_dj);
				if (_anki > -1) and (_anki < _size) and (_ankj > -1) and (_ankj < _size) {
					if (_grid[_ankj][_anki] != vk_hashtag) {
						_grid[_ankj][_anki] = vk_hashtag;
						_total++;
						//log($"{_anki},{_ankj}");
					}
				}
			}
		}
	}
	
	//var _string = "";
	//for (var _j = 0; _j < _size; _j++) {
	//	for (var _i = 0; _i < _size; _i++) {
	//		_string += $"{_grid[_j][_i]}";
	//	}
	//	_string += $"\n";
	//}
	//log(_string);
	
	return _total;
}
function _2024_08p2() {
	
}