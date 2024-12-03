
global.__ds_map = ds_map_create();
#macro DS_MAP global.__ds_map; ds_map_clear(global.__ds_map);

function input(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	return _string;
}
function input_array(_filename) {
	return string_split(input(_filename), "\n");
}
function print(_value, _loud = true) {
	show_debug_message(_value);
	if (_loud) {
		show_message(_value);
	}
}
