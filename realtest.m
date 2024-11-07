% Initialize variables
larry = brick.UltrasonicDist(4);
total = 0;
color = brick.ColorCode(1);
hasMovedBackward = false;
actionTaken = false;

% Stop both motors initially to prevent startup movement
brick.StopMotor('A', 'Brake');
brick.StopMotor('D', 'Brake');
pause(1); % Initial pause to ensure stability

while true
    % Read distance sensor and display current state
    larry = brick.UltrasonicDist(4);
    disp("Distance: " + larry + " | Total: " + total);
    
    % Flag indicating the start of a new loop cycle
    disp("new loop");

    % Move forward until distance <= 15
    while larry > 15
        brick.MoveMotor('D', -62); % Forward
        brick.MoveMotor('A', -61.5); % Forward
        larry = brick.UltrasonicDist(4);
        total = total + 0.075;
        disp("Moving forward, total: " + total);

        hasMovedBackward = true; % Flag to indicate robot has moved backward
        actionTaken = false; % Reset action flag
    end

    % Process behavior if distance is <= 15
    if larry <= 15 && hasMovedBackward && ~actionTaken
        if total <= 3
            % If total <= 3, perform backward motion
            brick.MoveMotor('A', 100); % Backward
            pause(2);
            brick.StopMotor('A', 'Brake');
            brick.StopMotor('D', 'Brake');
            disp("Continued backward. Total: " + total);
            actionTaken = true; % Prevent both actions from triggering
            larry = brick.UltrasonicDist(4); % Recheck distance after action
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
            larry = brick.UltrasonicDist(4); % Recheck distance after action
            continue;
        end
    end

    % Stop if color sensor detects specific color (code 5)
    if color == 5
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        pause(1);
        disp("Color detected. Stopping.");
        break; % Exit loop if color detected
    end

    % Break loop if total distance reaches/exceeds 500
    if total >= 500
        brick.StopMotor('A', 'Brake');
        brick.StopMotor('D', 'Brake');
        disp("Max total reached. Exiting.");
        break;
    end
end
