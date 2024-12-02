
function _2018_01() {
	var _frequencies = array_map(input_lines("2018/2018_01.txt"), real);
	print($"{_2018_01a(_frequencies)}, {_2018_01b(_frequencies)}");
}
function _2018_01a(_frequencies) {
	return array_reduce(_frequencies, function(_a, _b) {
		return (_a + _b);
	});
}
function _2018_01b(_frequencies) {
	
}
