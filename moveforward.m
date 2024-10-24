% Function to abstract away vehicle motion
% Ben Harper, 2024

function moveforward(x)
    brick.MoveMotor('D', -50);
    brick.MoveMotor('A', -50);
    pause(x);
    brick.StopMotor('D', 'Brake');
    brick.StopMotor('A', 'Brake');
end

 while larry > 10
        disp( larry );
        brick.MoveMotor('D', -70);
        
        brick.MoveMotor('A', -72);
        larry = brick.UltrasonicDist( 4 );
        total = total + 1;
    end
   
    if larry <= 10
        brick.MoveMotor('D', 30);
        brick.MoveMotor('A', 30);
        pause(1);
        brick.MoveMotorAngleAbs('D', -80, 20, 'Coast');
        brick.MoveMotor('D', -60);
        brick.MoveMotor('A', -100);