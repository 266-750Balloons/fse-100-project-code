% Our code used for the SUMO robot battle
% Ben Harper, Drew Stephens, 2024

try
    brick = ConnectBrick( "WAZ" );
catch
    display( "Brick already connected" );
end

global key 
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'downarrow'
            brick.MoveMotor('D',40);
            brick.MoveMotor('A',40);
        case 'uparrow'
            brick.MoveMotor('D',-40);
            brick.MoveMotor('A',-40);
        case 'leftarrow'
            brick.MoveMotorAngleAbs('D', 200, 270, 'Brake');
            brick.MoveMotor('D',40);
        case 'rightarrow'
            brick.MoveMotorAngleAbs('A', 200, -270, 'Brake');
            brick.MoveMotor('A',40);
        case 'p'
            brick.StopMotor('D', 'Brake');
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('B', 'Brake');
            brick.StopMotor('C', 'Brake');
            break;
        case 's'
            brick.MoveMotor('B',-40);
            pause(0.05);
            brick.MoveMotor('C',40);
            pause(0.05);
        case 'w'
            brick.MoveMotor('B',40);
            pause(0.05);
            brick.MoveMotor('C',-40);
            pause(0.05);
        otherwise
            brick.MoveMotor('D',0);
            brick.MoveMotor('A',0);
            brick.StopMotor('B',0);
            brick.StopMotor('C',0);
            brick.StopMotor('D', 'Brake');
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('C', 'Brake');
            brick.StopMotor('B', 'Brake');
    end
end    
CloseKeyboard();
         