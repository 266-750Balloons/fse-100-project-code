try
    brick = ConnectBrick( "WAZ" );
catch
    display( "Brick already connected" );
end

larry = brick.UltrasonicDist( 4 );
while larry >= 5
    disp( larry );
    brick.MoveMotor('D',-70);
    brick.MoveMotor('A',-70);
    larry = brick.UltrasonicDist( 4 );
end

brick.MoveMotor('D',0);
brick.MoveMotor('A',0);
brick.StopMotor('B',0);
brick.StopMotor('C',0);
brick.StopMotor('D', 'Brake');
brick.StopMotor('A', 'Brake');
brick.StopMotor('C', 'Brake');
brick.StopMotor('B', 'Brake');