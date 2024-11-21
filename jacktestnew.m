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
        brick.MoveMotor('D', -40);
        brick.MoveMotor('A', -40);
        pause(0.5); 
        brick.MoveMotor('D', -50); 
        brick.MoveMotor('A', 50);  
        pause(0.6); 
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        continue;
    end

    if larry > 20
        brick.MoveMotor('D', 50); 
        brick.MoveMotor('A', 50);
        pause(1); 
        brick.MoveMotor('D', 50); 
        brick.MoveMotor('A', -50); 
        pause(0.6); 
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');

        brick.MoveMotor('D', 50); 
        brick.MoveMotor('A', 50);
        pause(1.2); 
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        continue;
    end

    brick.MoveMotor('A', 50); 
    brick.MoveMotor('D', 50);
end
