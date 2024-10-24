% More Ultrasonic test code
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
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.MoveMotor('D', 3);
        brick.MoveMotor('A', -90);
        pause(2);

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.MoveMotor('D', -70);
        brick.MoveMotor('A', -70);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
    if total >= 300
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        break;
    end
end