% Another ultrasonic test
% Ben Harper, 2024

larry = brick.UltrasonicDist( 4 );

total = 0;

while true

    while larry > 5

        disp( larry );

        brick.MoveMotor('D', -70);

        brick.MoveMotor('A', -70);

        larry = brick.UltrasonicDist( 4 );

        total = total + 1;

    end

    

    if larry <= 5
        brick.MoveMotor('D', 30);
        brick.MoveMotor('A', 30);
        pause(1)

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');

        brick.MoveMotor('D', 10);
        brick.MoveMotor('A', -70);
        pause(2);

        

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');

        

        brick.MoveMotor('D', -70);
        brick.MoveMotor('A', -70);

        larry = brick.UltrasonicDist( 4 );

    end

    

    total = total + 1;

end