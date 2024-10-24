% I think this source file initially held the test code for motion control, but it 
% now appears to hold more testing of the ultrasonic sensor.
% Ben Harper, 2024

larry = brick.UltrasonicDist( 4 );
total = 0;

while true
    larry = brick.UltrasonicDist( 4 );
   
    while larry > 7
        disp( larry );
        brick.MoveMotor('D', -70);
        
        brick.MoveMotor('A', -77);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
   
    if larry <= 7
        brick.MoveMotor('D', 30);
        brick.MoveMotor('A', 30);
        pause(1);
        brick.MoveMotorAngleAbs('D', -70, 10, 'Brake');
        brick.MoveMotor('D', -60);
        brick.MoveMotor('A', -90);
        pause(2);

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.MoveMotor('D', -70);
        brick.MoveMotor('A', -70);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
    if total >= 500
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        break;
    end
end