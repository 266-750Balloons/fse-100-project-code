larry = brick.UltrasonicDist( 4 );
total = 0;

while true
    pause(0.1)
    larry = brick.UltrasonicDist( 4 );
%NEW CODE 
    color = brick.ColorCode(1);
    disp(color)
    while color ~= 5 && color ~= 2 && color ~= 3
        brick.MoveMotor('D', -63.5);
        brick.MoveMotor('A', -61.5)
        color = brick.ColorCode(1);
    end
    if color == 5

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        pause(1);
        % brick.MoveMotor('D', -63.5);
        % brick.MoveMotor('A', -61.5)
        pause(0.2)
        color = brick.ColorCode(1);
    end
    if color ==2

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.beep();
        pause(.25);
        brick.beep();
        pause(.5);
        color = brick.ColorCode(1);
    end
    if color==3

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.beep();
        pause(.25);
        brick.beep();
        pause(.25);
        brick.beep();
        pause(.5);
        color = brick.ColorCode(1);
    end
    while color == 5 || color == 2 || color == 3
        brick.MoveMotor('D', -63.5);
        brick.MoveMotor('A', -61.5);
        color = brick.ColorCode(1);
    end
end
