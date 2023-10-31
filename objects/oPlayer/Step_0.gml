/// @description Core Player Logic

// Inputs
key_jump = keyboard_check(ord("W"))
hsp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * walksp

// Gravity
vsp += grv

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
if (place_meeting(x, y + vsp, oNope)) // So you don't fall into the void and die handsomely
{
	x = global.startX;
	y = global.startY;
}
y += vsp;

// Animation
if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0) sprite_index = sPlayer; else sprite_index = sPlayerR;
}

if (hsp != 0) image_xscale = sign(hsp);