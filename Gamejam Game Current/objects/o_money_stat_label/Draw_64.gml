/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_lime);

var _origin_x = 1380;
var _origin_y = 400;

draw_text(x, y, "[" + string(_label_text));