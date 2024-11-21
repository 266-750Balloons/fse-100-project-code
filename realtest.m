brick.ResetMotorAngle('D');  % Reset motor D angle to 0

brick.MoveMotorAngleRel('D', 50, 90, 'Brake');  % Move motor D by 90 degrees
brick.WaitForMotor('D');  % Wait for motor D to finish moving

disp('Motor D moved by 90 degrees and completed.');
