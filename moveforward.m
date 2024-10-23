% Function to abstract away vehicle motion
% Ben Harper, 2024

function moveforward(x)
    brick.MoveMotor('D', -50);
    brick.MoveMotor('A', -50);
    pause(x);
    brick.StopMotor('D', 'Brake');
    brick.StopMotor('A', 'Brake');
end