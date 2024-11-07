% I think this source file initially held the test code for motion control, but it 
% now appears to hold more testing of the ultrasonic sensor.
% Ben Harper, 2024

larry = brick.UltrasonicDist( 4 );
disp( "larry: " + larry );
total = 0;
color = brick.ColorCode(1);

while true
    disp( "new loop" );
    total = 0;
    pause(0.1);
    larry = brick.UltrasonicDist( 4 );
    disp(total);
    disp( "Larry is:" + larry );
    % while larry > 15 || larry == 0
    while larry > 15 || larry == 0
        brick.MoveMotor('D', -62);
        brick.MoveMotor('A', -61.5);
        larry = brick.UltrasonicDist( 4 );
        total = total + .075;
        disp(total);
        disp( "Larry is:" + larry );
    end

    disp( "Loop broken with Larry = " + larry);
   
    if larry <= 15
        if (total <= 3)
            brick.MoveMotor('A',100);
            pause(2)
            brick.StopMotor('D', 'Brake');
            brick.StopMotor('A', 'Brake');
            disp(total);
            disp( "total <= 3" );
        else
            brick.MoveMotor('D', 30);
            brick.MoveMotor('A', 30);
            pause(1);
            brick.MoveMotor('A', -100);
            pause(2);

            brick.StopMotor('D', 'Brake');
            brick.StopMotor('A', 'Brake');
            disp(total);
            disp( "else" );

        end
    
    end
    if color == 5
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        pause(1)
        disp(total);
    end
    if total >= 500
        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        break;
    end
end