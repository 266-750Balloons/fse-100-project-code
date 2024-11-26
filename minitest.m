stop1 = 2;
stop2 = 3;
%Blue is 2, Green is 3, Yellow is 4

while true
    larry = brick.UltrasonicDist(1);
    color = brick.ColorCode(3);
    touch = brick.TouchPressed(4);
    larry = brick.UltrasonicDist(1);
    disp(larry)

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
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
        continue;
    elseif (larry >= 40)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.5)

        brick.MoveMotor('D',60);
        brick.MoveMotor('A',-10);
        pause(1)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.5)
    elseif (larry > 25) && (larry < 40)
        brick.MoveMotor('D',40);
        brick.StopMotor('A','Brake')
        pause(0.1)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.2)
    elseif (larry < 15)
        brick.MoveMotor('A',40);
        brick.StopMotor('D','Brake')
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.2)
    else
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.3)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        larry = brick.UltrasonicDist(1);
        end

end
