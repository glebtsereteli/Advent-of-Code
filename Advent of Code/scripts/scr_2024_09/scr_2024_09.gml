
function _2024_09() {
	var _disk = array_real(string_explode(input_string("2024/2024_09.aoc")));
	var _map = ds_list_create();
	test("2024/09: Disk Fragmenter", noop, _2024_09p2, [_disk, _map]);
	ds_list_destroy(_map);
}
function _2024_09p1(_disk, _map) {
	var _id = 0;
	var _nempty = 0;
	var _on_file = true;
	var _n = -1;
	var _i = 0; repeat (array_length(_disk)) {
		var _num = _disk[_i];
		if (_on_file) {
			repeat (_num) {
				ds_list_add(_map, _id);
			}
			_id++;
			_on_file = false;
		}
		else {
			repeat (_num) {
				ds_list_add(_map, undefined);
			}
			_nempty += _num;
			_on_file = true;
		}
		_n += _num;
		_i++;
	}
	
	var _jj = _n; repeat (_nempty) {
		var _index = ds_list_find_index(_map, undefined);
		_map[|_index] = _map[|_jj];
		_map[|_jj] = undefined;
		_jj--;
	}
	
	var _checksum = 0;
	var _i = 0; repeat (_jj + 1) {
		_checksum += (_i * _map[|_i]);
		_i++;
	}
	return _checksum;
}
function _2024_09p2(_disk) {
	var _map = [];
	var _id = 0;
	var _on_file = true;
	var _n = -1;
	var _sizes = [];
	var _locs = [];
	var _i = 0; repeat (array_length(_disk)) {
		var _num = _disk[_i];
		if (_on_file) {
			repeat (_num) {
				array_push(_map, _id);
			}
			array_push(_sizes, _num);
			array_push(_locs, _n + 1);
			_id++;
			_on_file = false;
		}
		else {
			repeat (_num) {
				array_push(_map, undefined);
			}
			_on_file = true;
		}
		_n += _num;
		_i++;
	}
	// 00...111...2...333.44.5555.6666.777.888899
	// 00992111777.44.333....5555.6666.....8888..
	
	array_reverse_ext(_locs);
	array_reverse_ext(_sizes);
	
	for (var _i = 0; _i < array_length(_sizes); _i++) {
		var _size = _sizes[_i];
		var _loc = _locs[_i];
		
		var _si0 = 0;
		var _found = false;
		while (true) {
			var _si1 = array_get_index(_map, undefined, _si0);
			if (_si1 == -1) break;
			
			var _si = _si1;
			while (true) {
				if (_si == array_length(_map)) break;
				if (_map[_si] != undefined) break;
				_si++;
			}
			
			_si0 = _si;
			var _sn = _si - _si1;
			if (_sn >= _size) and (_loc >= _si) {
				_found = true;
				break;
			}
		}
		if (_found) {
			for (var _j = 0; _j < _size; _j++) {
				_map[_si1 + _j] = _map[_loc + _j];
				_map[_loc + _j] = undefined;
			}
		}
		_si0 = _si1 + _sn;
	}
	//log(_map);
		
	var _checksum = 0;
	for (var _i = 0; _i < _n; _i++) {
		var _num = _map[_i];
		if (_num == undefined) continue;
		_checksum += (_i * _num);
	}
	return _checksum;
}
// 6415163624282