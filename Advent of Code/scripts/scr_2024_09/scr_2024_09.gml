
function _2024_09() {
	var _disk = array_real(string_explode(input_string("2024/2024_09.aoc")));
	var _map = ds_list_create();
	var _sizes = ds_list_create();
	var _locs = ds_list_create();
	var _spaces = ds_list_create();
	var _spacelocs = ds_list_create();
	test("2024/09: Disk Fragmenter", _2024_09p1, _2024_09p2, [_disk, _map, _sizes, _locs, _spaces, _spacelocs]);
	ds_list_destroy(_map);
	ds_list_destroy(_sizes);
	ds_list_destroy(_locs);
	ds_list_destroy(_spaces);
	ds_list_destroy(_spacelocs);
}
function _2024_09p1(_disk, _map, _sizes, _locs, _spaces, _spacelocs) {
	var _id = 0;
	var _nempty = 0;
	var _on_file = true;
	var _n = 0;
	var _i = 0; repeat (array_length(_disk)) {
		var _num = _disk[_i];
		if (_on_file) {
			repeat (_num) {
				ds_list_add(_map, _id);
			}
			if (_num > 0) {
				ds_list_add(_sizes, _num);
				ds_list_add(_locs, _n);
			}
			_id++;
			_on_file = false;
		}
		else {
			repeat (_num) {
				ds_list_add(_map, undefined);
			}
			if (_num > 0) {
				ds_list_add(_spaces, _num);
				ds_list_add(_spacelocs, _n);
			}
			_nempty += _num;
			_on_file = true;
		}
		_n += _num;
		_i++;
	}
	
	var _imap = ds_list_create();
	ds_list_copy(_imap, _map);
	
	var _i = 0;
	var _j = _n - 1;
	repeat (_n) {
		if (_imap[|_i] == undefined) {
			if (_imap[|_j] != undefined) {
				_imap[|_i] = _imap[|_j];
				_imap[|_j] = undefined;
				_i++;
			}
			_j--;
		}
		else _i++;
		if (_i > _j) break;
	}
	
	var _checksum = 0;
	var _i = 0; repeat (_j + 1) {
		_checksum += (_i * _imap[|_i]);
		_i++;
	}
	
	ds_list_destroy(_imap);
	return _checksum;
}
function _2024_09p2(_disk, _map, _sizes, _locs, _spaces, _spacelocs) {
	for (var _i = ds_list_size(_sizes) - 1; _i > -1; _i--) {
		var _size = _sizes[|_i];
		for (var _j = 0, _jn = ds_list_size(_spaces); _j < _jn; _j++) {
			var _space = _spaces[|_j];
			if (_space < _size) continue;
			var _loc = _locs[|_i];
			var _sloc = _spacelocs[|_j];
			if (_loc < _sloc) continue;
			
			var _k = 0; repeat (_size) {
				var _kk = _loc + _k;
				_map[|_sloc + _k] = _map[|_kk];
				_map[|_kk] = undefined;
				_k++;
			}
			
			_spaces[|_j] -= _size;
			if (_spaces[|_j] <= 0) {
				ds_list_delete(_spaces, _j);
				ds_list_delete(_spacelocs, _j);
				_j--;
			}
			else _spacelocs[|_j] += _size;
			break;
		}
	}
	
	var _checksum = 0;
	for (var _i = 0, _n = ds_list_size(_map); _i < _n; _i++) {
		var _num = _map[|_i];
		if (_num == undefined) continue;
		_checksum += (_i * _num);
	}
	return _checksum;
}
