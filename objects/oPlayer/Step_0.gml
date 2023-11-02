/// @description Core Player Logic

// Inputs
key_jump = keyboard_check(ord("W"))
hsp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * walksp

// Gravity
vsp += grv

if (place_meeting(x, y + 1, oWall)) && (key_jump)
{
	vsp = -jumpsp
	didjump = false
}
else if key_jump and didjump == false and vsp > 0.1
{
	vsp = -jumpsp + 2
	didjump = true
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
	x = startx;
	y = starty;
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

if (place_meeting(x, y, oPuzzle))
{
	x = startx;
	y = starty;
	currentrm += 1;
	switch (currentrm)
	{
	    case 2: room_goto(rTwo); break;
	    case 3: room_goto(rThree); break;
	    case 4: room_goto(rFour); break;
	}
}