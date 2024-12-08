
function _2024_07() {
	var _input = input_array("2024/2024_07.aoc");
	var _equations = array_map(_input, function(_string) {
		var _parts = array_real(string_split_ext(_string, [": ", " "], true));
		with ({}) {
			result = _parts[0];
			array_delete(_parts, 0, 1);
			operands = _parts;
			return self;
		}
	});
	test("2024/07: Bridge Repair", _2024_07p1, _2024_07p2, [_equations]);
}
function _2024_07p1(_equations) {
	with ({total:0}) {
		array_foreach(_equations, function(_eq) {
			var _ops = _eq.operands;
			var _n = array_length(_ops);
			var _j = 0; repeat (power(2, _n)) {
				var _jj = _j++;
				var _result = _ops[0];
				var _k = 1; repeat (_n - 1) {
				    if ((_jj mod 2) == 0) {
						_result += _ops[_k];	
					}
				    else {
						_result *= _ops[_k];
					}
					_jj = _jj div 2;
					_k++;
				}
				if (_result == _eq.result) {
					total += _result;
					break;
				}
			}
		});
		return total;
	}
}
function _2024_07p2(_equations) {
	with ({total:0}) {
		array_foreach(_equations, function(_eq) {
		    var _ops = _eq.operands;
		    var _n = array_length(_ops) - 1;
			var _j = 0; repeat (power(3, _n)) {
		        var _jj = _j++;
		        var _result = _ops[0];
				var _k = 1; repeat (_n) {
					switch (_jj mod 3) {
						case 0: _result += _ops[_k]; break;
						case 1: _result *= _ops[_k]; break;
						case 2: _result = real($"{_result}{_ops[_k]}"); break;
					}
		            _jj = _jj div 3;
					_k++;
		        }
		        if (_result == _eq.result) {
		            total += _result;
		            break;
		        }
		    }
		});
		return total;
	}
}
