
function _2024_09() {
	var _disk = array_real(string_explode(input_string("2024/2024_09.aoc")));
	var _map = ds_list_create();
	test("2024/09: ", _2024_09p1, _2024_09p2, [_disk, _map]);
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
function _2024_09p2() {
	
}
