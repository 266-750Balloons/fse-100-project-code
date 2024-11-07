% Initialize variables
larry = brick.UltrasonicDist(4);
total = 0;
color = brick.ColorCode(1);
hasMovedBackward = false;
actionTaken = false;

pause(1); 

while true

    larry = brick.UltrasonicDist(4);
    disp("Distance: " + larry + " | Total: " + total);
    
    % Ensure motors are stopped at the beginning of each loop iteration
    brick.StopMotor('A', 'Brake');
    brick.StopMotor('D', 'Brake');
    pause(0.1); 
    
    while larry > 15
        brick.MoveMotor('D', -62);
        brick.MoveMotor('A', -61.5);
        larry = brick.UltrasonicDist(4);
        total = total + 0.075;
        disp("Moving forward, total: " + total);

        hasMovedBackward = true; % Flag indicating the robot has moved backward at least once
        actionTaken = false; % Reset action flag for new forward movement
    end

    if larry <= 15 && hasMovedBackward && ~actionTaken
        if total <= 3
            % If total <= 3, perform backward motion
            brick.MoveMotor('A', 100); % Backward
            pause(2);
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('D', 'Brake');
            disp("Continued backward. Total: " + total);
            actionTaken = true; % Prevent both actions from triggering
            continue;

        elseif total > 3
            % If total > 3, perform turn and reset
            brick.MoveMotor('D', 30); % Small backward motion
            brick.MoveMotor('A', 30); % Small backward motion
            pause(1);
            brick.MoveMotor('A', -100); % Turn forward
            pause(2);

            brick.StopMotor('A', 'Brake');
            brick.StopMotor('D', 'Brake');
            total = 0; % Reset total distance after turning
            disp("Turned and reset total.");
            actionTaken = true; % Prevent double execution of condition
            continue;
        end
    end

    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
        disp("Color detected. Stopping.");
    end

    if total >= 500
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        disp("Max total reached. Exiting.");
        break;
    end
end



