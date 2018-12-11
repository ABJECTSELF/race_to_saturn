///scr_camera_step();

    direction=bearing; //Change the direction to the cameras bearing

    if keyboard_check(ord("W")){speed=max_speed;} //Move forward

    if keyboard_check(ord("S")){speed=-max_speed;} //Move Backwards

    if keyboard_check(ord("D")) //Strafe to the left
        {
            x = x + lengthdir_x(max_speed/2,direction - 90);
            y = y + lengthdir_y(max_speed/2,direction - 90);
        }

    if keyboard_check(ord("A")) //Strafe to the right
        {
            x = x + lengthdir_x(max_speed/2,direction + 90);
            y = y + lengthdir_y(max_speed/2,direction + 90);
        }

    friction=0.5; //Add a little friction
