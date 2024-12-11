// 125681

function _2024_11() {
	var _input = string_split(input_string("2024/2024_11.aoc"), " ");
	var _n = array_length(_input);
	var _stones = ds_list_create();
	var _i = 0; repeat (array_length(_input)) {
		ds_list_add(_stones, _input[_i++]);
	}
	test("2024/11: Plutonian Pebbles", _2024_11p1, _2024_11p2, [_stones]);
	ds_list_destroy(_stones);
}
function _2024_11p1(_stones) {
	repeat (25) {
		for (var _i = 0; _i < ds_list_size(_stones); _i++) {
			var _stone = _stones[|_i];
			if (_stone == "0") {
				_stones[|_i] = "1";
			}
			else {
				var _length = string_length(_stone);
				if ((_length mod 2) == 0) {
			        var _half = _length div 2;
			        _stones[|_i] = string(real(string_copy(_stone, 1, _half)));
			        ds_list_insert(_stones, _i + 1, string(real(string_copy(_stone, _half + 1, _half))));
					_i++;
				}
				else {
					_stones[|_i] = string(real(_stone) * 2024);
				}
			}
		}
	}
	return ds_list_size(_stones);
}
function _2024_11p2(_stones) {
	
}
