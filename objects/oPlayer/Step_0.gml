/// @description Core Player Logic

// Get the inputs that the player input from their keyboard to their computer getting the input that the player ends up inputting from their keyboard
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// This will calculate the movement so that we can make the object move after it gets calculated so we can move the object by using the var function (tru)
hsp = (key_right - key_left) * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oWall)) && (key_jump)
{
	vsp = -jumpsp
}

// Horizontal collision
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Vertical collision
if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
