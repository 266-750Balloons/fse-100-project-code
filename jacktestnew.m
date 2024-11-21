total = 0;


while true
    larry = brick.UltrasonicDist(1);
    color = brick.ColorCode(3);

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
        continue;
    end

    if brick.TouchPressed(4) == 1
        brick.MoveMotorAngleRel('A', -50, 180, 'Brake');
        brick.MoveMotorAngleRel('D', -50, 180, 'Brake');
        try
            brick.WaitForMotor('A');
            brick.WaitForMotor('D');
        end

        brick.MoveMotorAngleRel('D', 50, 180, 'Brake'); % Right motor forward
        brick.MoveMotorAngleRel('A', 50, -180, 'Brake'); % Left motor backward
        try
            brick.WaitForMotor('A');
            brick.WaitForMotor('D');
        end
        continue;
    end

    if larry <= 11
        brick.MoveMotorAngleRel('A', 50, 180, 'Brake'); % Left motor forward
        brick.MoveMotorAngleRel('D', 50, 180, 'Brake'); % Right motor forward
        try
            brick.WaitForMotor('A');
            brick.WaitForMotor('D');
        end

        brick.MoveMotorAngleRel('D', 50, 180, 'Brake'); % Right motor forward
        brick.MoveMotorAngleRel('A', 50, -180, 'Brake'); % Left motor backward
        try
            brick.WaitForMotor('A');
            brick.WaitForMotor('D');
        end

        brick.MoveMotorAngleRel('A', 50, 210, 'Brake'); % Left motor forward
        brick.MoveMotorAngleRel('D', 50, 210, 'Brake'); % Right motor forward
        try
            brick.WaitForMotor('A');
            brick.WaitForMotor('D');
        end
    else
        tStart = tic;
        while toc(tStart) < 2
            brick.MoveMotor('A', 50); 
            brick.MoveMotor('D', 50);    
        end
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
    end

    total = total + 1;
    if total >= 500
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        break;
    end
end
