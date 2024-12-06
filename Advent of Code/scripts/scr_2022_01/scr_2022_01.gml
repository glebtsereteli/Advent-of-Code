
function _2022_01() {
	var _input = input_string("2022/2022_01.aoc");
	_input = string_replace_all(_input, "\r\n", "\n");
	var _calories = array_map(string_split(_input, "\n\n"), function(_calories) {
		return array_map(string_split(_calories, "\n"), real);
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
