
function _2022_01() {
	var _input = input_linesep("2022/2022_01.aoc");
	var _calories = array_map(_input, function(_calories) {
		return array_real(string_split(_calories, "\n"));
	});
	test("2022/01: Calorie Counting", _2022_01p1, _2022_01p2, _calories);
}
function _2022_01p1(_calories) {
	array_map_ext(_calories, array_sum);
	return script_execute_ext(max, _calories);
}
function _2022_01p2(_calories) {
	array_sort(_calories, false);
	return script_execute_ext(sum, _calories, 0, 3);
}
