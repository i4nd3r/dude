program game;
uses crt;

const pou_stare : string = '<(U_U)>';
const pou_right : string = '<(U_u).';
const pou_left  : string = '.(u_U)>';
const food: string = '@';

var game_loop: boolean = true;


var pou_x: integer = 1;
var pou_y: integer = 1;

var food_x: integer;
var food_y: integer;

var state: byte = 0;
var points: integer = 0;
var key: char;

begin

    randomize;

    food_x := random(windmaxx) + 1;
    food_y := random(windmaxY) + 1;
    while game_loop do
        begin


            { render }
            clrscr;
            gotoxy(pou_x, pou_y);

            case state of
                0 : write(pou_stare);
                1 : write(pou_right);
                2 : write(pou_left);
            end;
            gotoxy(food_x, food_y);
            write(food);

            gotoxy(2, windmaxy -1);
            write('Points: ', points);

            { update }
            key := readkey;

            case key of
                's':
                    begin
                        pou_y := pou_y +1;
                        state := 0;
                    end;
                'w':
                    begin
                        pou_y := pou_y -1;
                        state := 0;
                    end;
                'd':
                    begin
                        pou_x := pou_x +1;
                        state := 1;
                    end;
                'a':
                    begin
                        pou_x := pou_x -1;
                        state := 2;
                    end;
                'q' : game_loop := false;


            end;

            if ((pou_x <= food_x) and (food_x < pou_x +7)) and (pou_y = food_y) then
                begin
                    food_x := random(windmaxx) + 1;
                    food_y := random(windmaxy) + 1;

                    points := points +1;
                end;


        end;

end.
