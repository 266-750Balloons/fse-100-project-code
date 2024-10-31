% Code to navigate accurately using the gyroscope
% Ben Harper, Drew Stephens, 2024

% When moving forward, the robot will try and maintain this angle. It is changes by the turn functions
heading = 0

left_speed = -62;
right_speed = -61.5;

% On gyroscope, left is positive, right is negative

function good = turnLeft( brick_obj )
    if heading < 180 && heading >= -180
        heading += 90
    end
    if heading == 180
        heading = -90
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
    if heading <= 180 && heading >= 180
        heading -= 90;
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
    larry = brick.UltrasonicDist( 4 );

    while larry > min_distance
            if bot_angle < heading
                right_speed = right_speed - 0.1;
            end
            if bot_angle > heading
                left_speed = left_speed - 0.1;
            end
    
            disp( larry );
    
            brick.MoveMotor('D', left_speed);
            brick.MoveMotor('A', right_speed);
    
            larry = brick.UltrasonicDist( 4 );
    
            bot_angle = brick.GyroAngle(3);
    end
end

while true
    goForwardUntil(brick, 15)
    turnLeft(brick)
end