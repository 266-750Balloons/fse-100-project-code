stop1 = 5;
stop2 = 5;
%Blue is 2, Green is 3, Yellow is 4
reset = 0;

while true
    larry = brick.UltrasonicDist(1);
    touch = brick.TouchPressed(4);
    larry = brick.UltrasonicDist(1);
    touch = brick.TouchPressed(4);
    color = brick.ColorCode(3);
    disp(larry)
    disp(touch)

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(2);
        beep()
        continue;
    elseif color == stop1
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        break;
    elseif color == stop2
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
        break;

    elseif touch == 1
        brick.MoveMotor('D',40);
        brick.MoveMotor('A',40);
        pause(1)

        brick.MoveMotor('A',60);
        brick.MoveMotor('D',-10);
        pause(1)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.5)
        reset = 1;

    elseif (larry >= 40) && (reset == 0)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.8)

        brick.MoveMotor('D',60);
        brick.MoveMotor('A',-10);
        pause(1.2)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(1)
        pause(0.5)
        reset = 0;

    elseif (larry > 21) && (larry < 40)
        brick.MoveMotor('D',40);
        brick.StopMotor('A','Brake')
        pause(0.4)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.1)
        reset = 0;
    elseif (larry < 15) || (larry == 255)
        brick.MoveMotor('A',40);
        brick.StopMotor('D','Brake')
        pause(0.1)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.1)
        reset = 0;
    else
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.2)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(2)
        larry = brick.UltrasonicDist(1);
        reset = 0;
    end

end