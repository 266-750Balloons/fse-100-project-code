larry = brick.UltrasonicDist( 4 );
total = 0;

while true
    larry = brick.UltrasonicDist( 4 );
%NEW CODE 
    color = brick.ColorCode(1);
    disp(color)
    if color ==5

        brick.StopMotor('D', 'Brake');

        brick.StopMotor('A', 'Brake');
        pause(1);
    end

    if color ==2

        brick.StopMotor('D', 'Brake');
        brick.StopMotor('A', 'Brake');
        brick.beep();
        pause(.25);
        brick.beep();
        pause(.5);
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
    end
end
