% A test to go straight, left, or right really well with the gyro
% Ben Harper, Drew Stephens, 2024

% Left is positive, right is negative

function good = turnLeft( brick_obj )
    bot_angle = brick_obj.GyroAngle(3);
    while bot_angle < 90
        brick_obj.MoveMotor('D', 62);
        brick_obj.MoveMotor('A', -61.5);
        bot_angle = brick_obj.GyroAngle(3);
    end
    good = 1;
end

function good = turnRight( brick_obj )
    bot_angle = brick_obj.GyroAngle(3);
    while bot_angle > -90
        brick_obj.MoveMotor('D', -62);
        brick_obj.MoveMotor('A', 61.5);
        bot_angle = brick_obj.GyroAngle(3);
    end
    good = 1;
end

left_speed = -62;
right_speed = -61.5;


brick.GyroCalibrate(3);
bot_angle = brick.GyroAngle(3);

larry = brick.UltrasonicDist( 4 );

while larry > 5
        if bot_angle < 0
            right_speed = right_speed - 0.1;
        end
        if bot_angle > 0
            left_speed = left_speed - 0.1;
        end

        disp( larry );

        brick.MoveMotor('D', left_speed);
        brick.MoveMotor('A', right_speed);

        larry = brick.UltrasonicDist( 4 );

        bot_angle = brick.GyroAngle(3);
end

% joe = turnLeft(brick);
bob = turnRight(brick);

larry = brick.UltrasonicDist( 4 );

while larry > 5
        if bot_angle < 0
            right_speed = right_speed - 0.1;
        end
        if bot_angle > 0
            left_speed = left_speed - 0.1;
        end

        disp( larry );

        brick.MoveMotor('D', left_speed);
        brick.MoveMotor('A', right_speed);

        larry = brick.UltrasonicDist( 4 );

        bot_angle = brick.GyroAngle(3);
end

brick.StopMotor('D', 'Brake');
brick.StopMotor('A', 'Brake');
