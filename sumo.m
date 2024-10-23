% I think this source file initially held the test code for motion control, but it 
% now appears to hold more testing of the ultrasonic sensor.
% Ben Harper, 2024

larry = brick.UltrasonicDist( 4 );
total = 0;
while true
    while larry > 5
        disp( larry );
        brick.MoveMotor('D',-70);
        brick.MoveMotor('A',-70);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
    x = 2;
    while larry <= 5
        x = 20;
        while x > 0
            brick.MoveMotorAngleAbs('D', 200, 270, 'Brake');
            brick.MoveMotor('D',70);
            x = x - 1;
            total = total + 1;
        end
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
    end
end
