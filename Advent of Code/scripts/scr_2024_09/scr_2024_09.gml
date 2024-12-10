// 6385338159127
// 6415163624282

function _2024_09() {
	var _disk = array_real(string_explode(input_string("2024/2024_09.aoc")));
	var _map = ds_list_create();
	test("2024/09: Disk Fragmenter", _2024_09p1, _2024_09p2, [_disk, _map]);
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
function _2024_09p2(_disk, _map) {
	ds_list_clear(_map);
	var _id = 0;
	var _on_file = true;
	var _n = 0;
	var _sizes = ds_list_create();
	var _locs = ds_list_create();
	var _i = 0; repeat (array_length(_disk)) {
		var _num = _disk[_i];
		if (_on_file) {
			repeat (_num) {
				ds_list_add(_map, _id);
			}
			ds_list_add(_sizes, _num);
			ds_list_add(_locs, _n);
			_id++;
			_on_file = false;
		}
		else {
			repeat (_num) {
				ds_list_add(_map, undefined);
			}
			_on_file = true;
		}
		_n += _num;
		_i++;
	}
	
	for (var _i = ds_list_size(_sizes) - 1; _i > -1; _i--) {
		var _size = _sizes[|_i];
		var _loc = _locs[|_i];
		var _si0 = 0;
		var _found = false;
		while (true) {
			var _si1 = _si0; repeat (_n - _si0) {
				if (_map[|_si1] == undefined) break;
				_si1++;
			}
			if (_si1 == _si0) break;
			
			var _si2 = _si1; repeat (_n - _si1) {
				if (_map[|_si2] != undefined) break;
				_si2++;
			}
			
			_si0 = _si2;
			if (_loc < _si2) or ((_si2 - _si1) < _size) continue;
			for (var _j = 0; _j < _size; _j++) {
				_map[|_si1 + _j] = _map[|_loc + _j];
				_map[|_loc + _j] = undefined;
			}
			break;
		}
	}
		
	var _checksum = 0;
	for (var _i = 0; _i < _n; _i++) {
		var _num = _map[|_i];
		if (_num == undefined) continue;
		_checksum += (_i * _num);
	}
	
	ds_list_destroy(_sizes);
	ds_list_destroy(_locs);
	
	return _checksum;
}
