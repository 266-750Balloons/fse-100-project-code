% I think this source file initially held the test code for motion control, but it 
% now appears to hold more testing of the ultrasonic sensor.
% Ben Harper, 2024

larry = brick.UltrasonicDist( 4 );
total = 0;
color = brick.ColorCode(1);

while true
    larry = brick.UltrasonicDist( 4 );
   
    while larry > 15
        disp( larry );
        brick.MoveMotor('D', -62);
        brick.MoveMotor('A', -61.5);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
   
    if larry <= 15
        brick.MoveMotor('D', 30);
        brick.MoveMotor('A', 30);
        pause(1);
        brick.MoveMotor('A', -100);
        pause(2);

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        total = total + 4;
    end
    if color == 5
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        pause(1)
    end
    if total >= 170
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        break;
    end
end