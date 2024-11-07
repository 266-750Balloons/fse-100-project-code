        larry = brick.UltrasonicDist( 4 );
        lastturn = tic;

        total=0;

        color = brick.ColorCode(1);
        while true
            larry = brick.UltrasonicDist( 4 );
            disp(total);
            while larry > 15
                brick.MoveMotor('D', -62);
                brick.MoveMotor('A', -61.5);
                larry = brick.UltrasonicDist( 4 );

            end
           
            if larry <= 15
                if (toc(lastturn) <= 3)
                    brick.MoveMotor('A',100);
                    pause(2)
                    brick.StopMotor('D', 'Brake');
                    brick.StopMotor('A', 'Brake');
                    disp(total);

                    lastturn=tic;


                else
                    brick.MoveMotor('D', 30);
                    brick.MoveMotor('A', 30);
                    pause(1);
                    brick.MoveMotor('A', -100);
                    pause(2);
                    brick.StopMotor('D', 'Brake');
                    brick.StopMotor('A', 'Brake');
                    lastturn=tic;


                end
            
            end
            if color == 5
                brick.StopMotor('D', 'Brake');
                brick.StopMotor('A', 'Brake');
                pause(1)
                disp(total);
            end
            if total >= 500
                brick.StopMotor('D', 'Brake');
                brick.StopMotor('A', 'Brake');
                break;
            end
        end