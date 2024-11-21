% Our code used for the SUMO robot battle
% Ben Harper, Drew Stephens, 2024

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
            brick.MoveMotor('D',40);
            brick.StopMotor('A','Brake')
        case 'rightarrow'
            brick.MoveMotor('A',40);
            brick.StopMotor('D','Brake')
        case 'p'
            brick.StopMotor('D', 'Brake');
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('B', 'Brake');
            brick.StopMotor('C', 'Brake');
            break;
        case 'w'
            brick.MoveMotor('B',-10);
            pause(0.05);
        case 's'
            brick.MoveMotor('B',10);
            pause(0.05);
        case 'u'
            brick.MoveMotor('C',-10);
            pause(0.05);
        case 'h'
            brick.MoveMotor('C',10);
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
         