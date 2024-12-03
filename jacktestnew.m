stop1 = 5;
stop2 = 5;
%Blue is 2, Green is 3, Yellow is 4
reset = 0;

while true
    larry = brick.UltrasonicDist(1);
    pause(0.6)
    touch = brick.TouchPressed(4);
    pause(0.6)
    color = brick.ColorCode(3);
    pause(0.6)
    disp(larry)
    disp(touch)
    pause(0.6)

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(5);
        beep()
        if (larry >= 40) && (reset == 0)
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('D', 'Brake');
            brick.MoveMotor('D',-40);
            brick.MoveMotor('A',-40);
            pause(0.08)

            brick.MoveMotor('D',60);
            brick.MoveMotor('A',-10);
            pause(1.1)
            brick.MoveMotor('D',-40);
            brick.MoveMotor('A',-40);
            pause(0.1)
            reset = 0;
        end    
            pause(0.01)
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
    elseif (larry >= 40) && (reset == 0)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.08)

        brick.MoveMotor('D',60);
        brick.MoveMotor('A',-10);
        pause(1.2)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.3)
        reset = 0;
    elseif touch == 1
        brick.MoveMotor('D',40);
        brick.MoveMotor('A',40);
        pause(1.5)

        brick.MoveMotor('A',60);
        brick.MoveMotor('D',-10);
        pause(1)
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.5)
        reset = 1;
    elseif (larry > 21) && (larry < 40)
        brick.MoveMotor('D',20);
        brick.StopMotor('A','Brake')
        pause(0.03)
        brick.MoveMotor('D',-30);
        brick.MoveMotor('A',-30);
        pause(0.008)
        reset = 0;
        pause(0.6)
    elseif (larry < 18) || (larry == 255)
        brick.MoveMotor('A',40);
        brick.MoveMotor('D',10)
        pause(0.1)
        brick.MoveMotor('D',-30);
        brick.MoveMotor('A',-30);
        pause(0.01)
        reset = 0;
        pause(0.6)
    else
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.03)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(0.6)
        reset = 0;
    end

end