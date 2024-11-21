total = 0;

while true
    larry = brick.UltrasonicDist(1);
    color = brick.ColorCode(3);
    touch = brick.TouchPressed(4);

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
        continue;
    end

    if touch == 1
        brick.MoveMotor('D',40);
        brick.MoveMotor('A',40);
        pause(0.5)

        brick.MoveMotor('D',40);
        brick.StopMotor('A','Brake')
        pause(1.5)
        continue;
    end

    if larry >= 20
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);

        brick.MoveMotor('A',40);
        brick.StopMotor('D','Brake')
        pause(1.5)

        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(0.5)
    else
        brick.MoveMotor('D',-40);
        brick.MoveMotor('A',-40);
        pause(1)
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
    end
end
