/// @description Insert description here
// You can write your code in this editor

// Get the inputs that the player input from their keyboard to their computer getting the input that the player ends up inputting from their keyboard
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// This will calculate the movement so that we can make the object move after it gets calculated so we can move the object by using the var function (tru)
var _move = key_right - key_left;

hsp = _move * walksp;

x = x + hsp

