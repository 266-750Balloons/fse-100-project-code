% Code to navigate accurately using the gyroscope
% Ben Harper, Drew Stephens, 2024

brick.GyroCalibrate(3);

% When moving forward, the robot will try and maintain this angle. It is changes by the turn functions

global heading;
heading = 0;

global left_speed;
left_speed = -62;
global right_speed;
right_speed = -61.5;

% On gyroscope, left is positive, right is negative

function good = turnLeft( brick_obj )
    global heading;
    if heading < 180 && heading >= -180
        heading = heading + 90;
    end
    if heading == 180
        heading = -90;
    end
    bot_angle = brick_obj.GyroAngle(3);
    while bot_angle < heading
        brick_obj.MoveMotor('D', 62);
        brick_obj.MoveMotor('A', -61.5);
        bot_angle = brick_obj.GyroAngle(3);
    end
    good = 1;
end

function good = turnRight( brick_obj )
    global heading;
    if heading <= 180 && heading >= 180
        heading = heading - 90;
    end
    if heading == -180
        heading = 90;
    end
    bot_angle = brick_obj.GyroAngle(3);
    while bot_angle > -90
        brick_obj.MoveMotor('D', -62);
        brick_obj.MoveMotor('A', 61.5);
        bot_angle = brick_obj.GyroAngle(3);
    end
    good = 1;
end

function good = goForwardUntil( brick_obj, min_distance )
    global heading;
    global left_speed;
    global right_speed;
    larry = brick_obj.UltrasonicDist( 4 );
    bot_angle = brick_obj.GyroAngle(3);

    while larry > min_distance
            if bot_angle < bot_angle
                right_speed = right_speed - 0.1;
            end
            if bot_angle > bot_angle
                left_speed = left_speed - 0.1;
            end
    
            disp( larry );
    
            brick_obj.MoveMotor('D', left_speed);
            brick_obj.MoveMotor('A', right_speed);
    
            larry = brick_obj.UltrasonicDist( 4 );
    
            bot_angle = brick_obj.GyroAngle(3);
    end
end

while true
    goForwardUntil(brick, 15 );
    turnLeft( brick);
end