
function _2019_01() {
	var _masses = input_array("2019/2019_01.aoc");
	test("2019/01: The Tyranny of the Rocket Equation", _2019_01p1, _2019_01p2, _masses);
}
function _2019_01p1(_masses) {
	var _fuel = 0;
	var _i = 0; repeat (array_length(_masses)) {
		_fuel += ((_masses[_i] div 3) - 2);
		_i++;
	}
	return _fuel;
}
function _2019_01p2(_masses) {
	var _fuel = 0;
	var _i = 0; repeat (array_length(_masses)) {
		var _mass = _masses[_i];
		while (true) {
			_mass = ((_mass div 3) - 2);
			if (_mass <= 0) break;
			_fuel += _mass;
		}
		_i++;
	}
	return _fuel;
}
