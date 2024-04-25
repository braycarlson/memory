classdef Image
    properties (Access = public)
        easy = struct;
        medium = struct;
        hard = struct;
        impossible = struct;
    end

    methods (Access = public)
        function image = Image()
            % Easy
            image.easy.a = {
                {fullfile('asset/level/easy/a/01.jpg'), fullfile('asset/level/easy/a/01.jpg')}, ...
                {fullfile('asset/level/easy/a/02.jpg'), fullfile('asset/level/easy/a/02.jpg')}, ...
                {fullfile('asset/level/easy/a/03.jpg'), fullfile('asset/level/easy/a/03.jpg')}, ...
                {fullfile('asset/level/easy/a/04.jpg'), fullfile('asset/level/easy/a/04.jpg')}, ...
                {fullfile('asset/level/easy/a/05.jpg'), fullfile('asset/level/easy/a/05.jpg')}, ...
                {fullfile('asset/level/easy/a/06.jpg'), fullfile('asset/level/easy/a/06.jpg')}, ...
                {fullfile('asset/level/easy/a/07.jpg'), fullfile('asset/level/easy/a/07.jpg')}, ...
                {fullfile('asset/level/easy/a/08.jpg'), fullfile('asset/level/easy/a/08.jpg')}, ...
                {fullfile('asset/level/easy/a/09.jpg'), fullfile('asset/level/easy/a/09.jpg')}, ...
                {fullfile('asset/level/easy/a/10.jpg'), fullfile('asset/level/easy/a/10.jpg')}, ...
                {fullfile('asset/level/easy/a/11.jpg'), fullfile('asset/level/easy/a/11.jpg')}, ...
                {fullfile('asset/level/easy/a/12.jpg'), fullfile('asset/level/easy/a/12.jpg')} ...
            };

            image.easy.b = {
                {fullfile('asset/level/easy/b/01.jpg'), fullfile('asset/level/easy/b/01.jpg')}, ...
                {fullfile('asset/level/easy/b/02.jpg'), fullfile('asset/level/easy/b/02.jpg')}, ...
                {fullfile('asset/level/easy/b/03.jpg'), fullfile('asset/level/easy/b/03.jpg')}, ...
                {fullfile('asset/level/easy/b/04.jpg'), fullfile('asset/level/easy/b/04.jpg')}, ...
                {fullfile('asset/level/easy/b/05.jpg'), fullfile('asset/level/easy/b/05.jpg')}, ...
                {fullfile('asset/level/easy/b/06.jpg'), fullfile('asset/level/easy/b/06.jpg')}, ...
                {fullfile('asset/level/easy/b/07.jpg'), fullfile('asset/level/easy/b/07.jpg')}, ...
                {fullfile('asset/level/easy/b/08.jpg'), fullfile('asset/level/easy/b/08.jpg')}, ...
                {fullfile('asset/level/easy/b/09.jpg'), fullfile('asset/level/easy/b/09.jpg')}, ...
                {fullfile('asset/level/easy/b/10.jpg'), fullfile('asset/level/easy/b/10.jpg')}, ...
                {fullfile('asset/level/easy/b/11.jpg'), fullfile('asset/level/easy/b/11.jpg')}, ...
                {fullfile('asset/level/easy/b/12.jpg'), fullfile('asset/level/easy/b/12.jpg')} ...
            };

            % Medium
            image.medium.a = {
                {fullfile('asset/level/medium/a/01.jpg'), fullfile('asset/level/medium/a/01.jpg')}, ...
                {fullfile('asset/level/medium/a/02.jpg'), fullfile('asset/level/medium/a/02.jpg')}, ...
                {fullfile('asset/level/medium/a/03.jpg'), fullfile('asset/level/medium/a/03.jpg')}, ...
                {fullfile('asset/level/medium/a/04.jpg'), fullfile('asset/level/medium/a/04.jpg')}, ...
                {fullfile('asset/level/medium/a/05.jpg'), fullfile('asset/level/medium/a/05.jpg')}, ...
                {fullfile('asset/level/medium/a/06.jpg'), fullfile('asset/level/medium/a/06.jpg')}, ...
                {fullfile('asset/level/medium/a/07.jpg'), fullfile('asset/level/medium/a/07.jpg')}, ...
                {fullfile('asset/level/medium/a/08.jpg'), fullfile('asset/level/medium/a/08.jpg')}, ...
                {fullfile('asset/level/medium/a/09.jpg'), fullfile('asset/level/medium/a/09.jpg')}, ...
                {fullfile('asset/level/medium/a/10.jpg'), fullfile('asset/level/medium/a/10.jpg')}, ...
                {fullfile('asset/level/medium/a/11.jpg'), fullfile('asset/level/medium/a/11.jpg')}, ...
                {fullfile('asset/level/medium/a/12.jpg'), fullfile('asset/level/medium/a/12.jpg')} ...
            };

            image.medium.b = {
                {fullfile('asset/level/medium/b/01.jpg'), fullfile('asset/level/medium/b/01.jpg')}, ...
                {fullfile('asset/level/medium/b/02.jpg'), fullfile('asset/level/medium/b/02.jpg')}, ...
                {fullfile('asset/level/medium/b/03.jpg'), fullfile('asset/level/medium/b/03.jpg')}, ...
                {fullfile('asset/level/medium/b/04.jpg'), fullfile('asset/level/medium/b/04.jpg')}, ...
                {fullfile('asset/level/medium/b/05.jpg'), fullfile('asset/level/medium/b/05.jpg')}, ...
                {fullfile('asset/level/medium/b/06.jpg'), fullfile('asset/level/medium/b/06.jpg')}, ...
                {fullfile('asset/level/medium/b/07.jpg'), fullfile('asset/level/medium/b/07.jpg')}, ...
                {fullfile('asset/level/medium/b/08.jpg'), fullfile('asset/level/medium/b/08.jpg')}, ...
                {fullfile('asset/level/medium/b/09.jpg'), fullfile('asset/level/medium/b/09.jpg')}, ...
                {fullfile('asset/level/medium/b/10.jpg'), fullfile('asset/level/medium/b/10.jpg')}, ...
                {fullfile('asset/level/medium/b/11.jpg'), fullfile('asset/level/medium/b/11.jpg')}, ...
                {fullfile('asset/level/medium/b/12.jpg'), fullfile('asset/level/medium/b/12.jpg')} ...
            };

            % Hard
            image.hard.a = {
                {fullfile('asset/level/hard/a/01.jpg'), fullfile('asset/level/hard/a/01.jpg')}, ...
                {fullfile('asset/level/hard/a/02.jpg'), fullfile('asset/level/hard/a/02.jpg')}, ...
                {fullfile('asset/level/hard/a/03.jpg'), fullfile('asset/level/hard/a/03.jpg')}, ...
                {fullfile('asset/level/hard/a/04.jpg'), fullfile('asset/level/hard/a/04.jpg')}, ...
                {fullfile('asset/level/hard/a/05.jpg'), fullfile('asset/level/hard/a/05.jpg')}, ...
                {fullfile('asset/level/hard/a/06.jpg'), fullfile('asset/level/hard/a/06.jpg')}, ...
                {fullfile('asset/level/hard/a/07.jpg'), fullfile('asset/level/hard/a/07.jpg')}, ...
                {fullfile('asset/level/hard/a/08.jpg'), fullfile('asset/level/hard/a/08.jpg')}, ...
                {fullfile('asset/level/hard/a/09.jpg'), fullfile('asset/level/hard/a/09.jpg')}, ...
                {fullfile('asset/level/hard/a/10.jpg'), fullfile('asset/level/hard/a/10.jpg')}, ...
                {fullfile('asset/level/hard/a/11.jpg'), fullfile('asset/level/hard/a/11.jpg')}, ...
                {fullfile('asset/level/hard/a/12.jpg'), fullfile('asset/level/hard/a/12.jpg')} ...
            };

            image.hard.b = {
                {fullfile('asset/level/hard/b/01.jpg'), fullfile('asset/level/hard/b/01.jpg')}, ...
                {fullfile('asset/level/hard/b/02.jpg'), fullfile('asset/level/hard/b/02.jpg')}, ...
                {fullfile('asset/level/hard/b/03.jpg'), fullfile('asset/level/hard/b/03.jpg')}, ...
                {fullfile('asset/level/hard/b/04.jpg'), fullfile('asset/level/hard/b/04.jpg')}, ...
                {fullfile('asset/level/hard/b/05.jpg'), fullfile('asset/level/hard/b/05.jpg')}, ...
                {fullfile('asset/level/hard/b/06.jpg'), fullfile('asset/level/hard/b/06.jpg')}, ...
                {fullfile('asset/level/hard/b/07.jpg'), fullfile('asset/level/hard/b/07.jpg')}, ...
                {fullfile('asset/level/hard/b/08.jpg'), fullfile('asset/level/hard/b/08.jpg')}, ...
                {fullfile('asset/level/hard/b/09.jpg'), fullfile('asset/level/hard/b/09.jpg')}, ...
                {fullfile('asset/level/hard/b/10.jpg'), fullfile('asset/level/hard/b/10.jpg')}, ...
                {fullfile('asset/level/hard/b/11.jpg'), fullfile('asset/level/hard/b/11.jpg')}, ...
                {fullfile('asset/level/hard/b/12.jpg'), fullfile('asset/level/hard/b/12.jpg')} ...
            };

            % Impossible
            image.impossible.a = {
                {fullfile('asset/level/impossible/a/01.jpg'), fullfile('asset/level/impossible/a/02.jpg')}, ...
                {fullfile('asset/level/impossible/a/03.jpg'), fullfile('asset/level/impossible/a/04.jpg')}, ...
                {fullfile('asset/level/impossible/a/05.jpg'), fullfile('asset/level/impossible/a/06.jpg')}, ...
                {fullfile('asset/level/impossible/a/07.jpg'), fullfile('asset/level/impossible/a/08.jpg')}, ...
                {fullfile('asset/level/impossible/a/09.jpg'), fullfile('asset/level/impossible/a/10.jpg')}, ...
                {fullfile('asset/level/impossible/a/11.jpg'), fullfile('asset/level/impossible/a/12.jpg')}, ...
                {fullfile('asset/level/impossible/a/13.jpg'), fullfile('asset/level/impossible/a/14.jpg')}, ...
                {fullfile('asset/level/impossible/a/15.jpg'), fullfile('asset/level/impossible/a/16.jpg')}, ...
                {fullfile('asset/level/impossible/a/17.jpg'), fullfile('asset/level/impossible/a/18.jpg')}, ...
                {fullfile('asset/level/impossible/a/19.jpg'), fullfile('asset/level/impossible/a/20.jpg')}, ...
                {fullfile('asset/level/impossible/a/21.jpg'), fullfile('asset/level/impossible/a/22.jpg')}, ...
                {fullfile('asset/level/impossible/a/23.jpg'), fullfile('asset/level/impossible/a/24.jpg')} ...
            };

            image.impossible.b = {
                {fullfile('asset/level/impossible/b/01.jpg'), fullfile('asset/level/impossible/b/02.jpg')}, ...
                {fullfile('asset/level/impossible/b/03.jpg'), fullfile('asset/level/impossible/b/04.jpg')}, ...
                {fullfile('asset/level/impossible/b/05.jpg'), fullfile('asset/level/impossible/b/06.jpg')}, ...
                {fullfile('asset/level/impossible/b/07.jpg'), fullfile('asset/level/impossible/b/08.jpg')}, ...
                {fullfile('asset/level/impossible/b/09.jpg'), fullfile('asset/level/impossible/b/10.jpg')}, ...
                {fullfile('asset/level/impossible/b/11.jpg'), fullfile('asset/level/impossible/b/12.jpg')}, ...
                {fullfile('asset/level/impossible/b/13.jpg'), fullfile('asset/level/impossible/b/14.jpg')}, ...
                {fullfile('asset/level/impossible/b/15.jpg'), fullfile('asset/level/impossible/b/16.jpg')}, ...
                {fullfile('asset/level/impossible/b/17.jpg'), fullfile('asset/level/impossible/b/18.jpg')}, ...
                {fullfile('asset/level/impossible/b/19.jpg'), fullfile('asset/level/impossible/b/20.jpg')}, ...
                {fullfile('asset/level/impossible/b/21.jpg'), fullfile('asset/level/impossible/b/22.jpg')}, ...
                {fullfile('asset/level/impossible/b/23.jpg'), fullfile('asset/level/impossible/b/24.jpg')} ...
            };

            image.impossible.c = {
                {fullfile('asset/level/impossible/c/01.jpg'), fullfile('asset/level/impossible/c/02.jpg')}, ...
                {fullfile('asset/level/impossible/c/03.jpg'), fullfile('asset/level/impossible/c/04.jpg')}, ...
                {fullfile('asset/level/impossible/c/05.jpg'), fullfile('asset/level/impossible/c/06.jpg')}, ...
                {fullfile('asset/level/impossible/c/07.jpg'), fullfile('asset/level/impossible/c/08.jpg')}, ...
                {fullfile('asset/level/impossible/c/09.jpg'), fullfile('asset/level/impossible/c/10.jpg')}, ...
                {fullfile('asset/level/impossible/c/11.jpg'), fullfile('asset/level/impossible/c/12.jpg')}, ...
                {fullfile('asset/level/impossible/c/13.jpg'), fullfile('asset/level/impossible/c/14.jpg')}, ...
                {fullfile('asset/level/impossible/c/15.jpg'), fullfile('asset/level/impossible/c/16.jpg')}, ...
                {fullfile('asset/level/impossible/c/17.jpg'), fullfile('asset/level/impossible/c/18.jpg')}, ...
                {fullfile('asset/level/impossible/c/19.jpg'), fullfile('asset/level/impossible/c/20.jpg')}, ...
                {fullfile('asset/level/impossible/c/21.jpg'), fullfile('asset/level/impossible/c/22.jpg')}, ...
                {fullfile('asset/level/impossible/c/23.jpg'), fullfile('asset/level/impossible/c/24.jpg')} ...
            };

            image.impossible.d = {
                {fullfile('asset/level/impossible/d/01.jpg'), fullfile('asset/level/impossible/d/02.jpg')}, ...
                {fullfile('asset/level/impossible/d/03.jpg'), fullfile('asset/level/impossible/d/04.jpg')}, ...
                {fullfile('asset/level/impossible/d/05.jpg'), fullfile('asset/level/impossible/d/06.jpg')}, ...
                {fullfile('asset/level/impossible/d/07.jpg'), fullfile('asset/level/impossible/d/08.jpg')}, ...
                {fullfile('asset/level/impossible/d/09.jpg'), fullfile('asset/level/impossible/d/10.jpg')}, ...
                {fullfile('asset/level/impossible/d/11.jpg'), fullfile('asset/level/impossible/d/12.jpg')}, ...
                {fullfile('asset/level/impossible/d/13.jpg'), fullfile('asset/level/impossible/d/14.jpg')}, ...
                {fullfile('asset/level/impossible/d/15.jpg'), fullfile('asset/level/impossible/d/16.jpg')}, ...
                {fullfile('asset/level/impossible/d/17.jpg'), fullfile('asset/level/impossible/d/18.jpg')}, ...
                {fullfile('asset/level/impossible/d/19.jpg'), fullfile('asset/level/impossible/d/20.jpg')}, ...
                {fullfile('asset/level/impossible/d/21.jpg'), fullfile('asset/level/impossible/d/22.jpg')}, ...
                {fullfile('asset/level/impossible/d/23.jpg'), fullfile('asset/level/impossible/d/24.jpg')} ...
            };

            image.impossible.e = {
                {fullfile('asset/level/impossible/e/01.jpg'), fullfile('asset/level/impossible/e/02.jpg')}, ...
                {fullfile('asset/level/impossible/e/03.jpg'), fullfile('asset/level/impossible/e/04.jpg')}, ...
                {fullfile('asset/level/impossible/e/05.jpg'), fullfile('asset/level/impossible/e/06.jpg')}, ...
                {fullfile('asset/level/impossible/e/07.jpg'), fullfile('asset/level/impossible/e/08.jpg')}, ...
                {fullfile('asset/level/impossible/e/09.jpg'), fullfile('asset/level/impossible/e/10.jpg')}, ...
                {fullfile('asset/level/impossible/e/11.jpg'), fullfile('asset/level/impossible/e/12.jpg')}, ...
                {fullfile('asset/level/impossible/e/13.jpg'), fullfile('asset/level/impossible/e/14.jpg')}, ...
                {fullfile('asset/level/impossible/e/15.jpg'), fullfile('asset/level/impossible/e/16.jpg')}, ...
                {fullfile('asset/level/impossible/e/17.jpg'), fullfile('asset/level/impossible/e/18.jpg')}, ...
                {fullfile('asset/level/impossible/e/19.jpg'), fullfile('asset/level/impossible/e/20.jpg')}, ...
                {fullfile('asset/level/impossible/e/21.jpg'), fullfile('asset/level/impossible/e/22.jpg')}, ...
                {fullfile('asset/level/impossible/e/23.jpg'), fullfile('asset/level/impossible/e/24.jpg')} ...
            };

            image.impossible.f = {
                {fullfile('asset/level/impossible/f/01.jpg'), fullfile('asset/level/impossible/f/02.jpg')}, ...
                {fullfile('asset/level/impossible/f/03.jpg'), fullfile('asset/level/impossible/f/04.jpg')}, ...
                {fullfile('asset/level/impossible/f/05.jpg'), fullfile('asset/level/impossible/f/06.jpg')}, ...
                {fullfile('asset/level/impossible/f/07.jpg'), fullfile('asset/level/impossible/f/08.jpg')}, ...
                {fullfile('asset/level/impossible/f/09.jpg'), fullfile('asset/level/impossible/f/10.jpg')}, ...
                {fullfile('asset/level/impossible/f/11.jpg'), fullfile('asset/level/impossible/f/12.jpg')}, ...
                {fullfile('asset/level/impossible/f/13.jpg'), fullfile('asset/level/impossible/f/14.jpg')}, ...
                {fullfile('asset/level/impossible/f/15.jpg'), fullfile('asset/level/impossible/f/16.jpg')}, ...
                {fullfile('asset/level/impossible/f/17.jpg'), fullfile('asset/level/impossible/f/18.jpg')}, ...
                {fullfile('asset/level/impossible/f/19.jpg'), fullfile('asset/level/impossible/f/20.jpg')}, ...
                {fullfile('asset/level/impossible/f/21.jpg'), fullfile('asset/level/impossible/f/22.jpg')}, ...
                {fullfile('asset/level/impossible/f/23.jpg'), fullfile('asset/level/impossible/f/24.jpg')} ...
            };
        end

        function field = select(~, s)
            fields = fieldnames(s);
            first = fields(1);
            last = fields(end);
            index = char(first):char(last);
            field = index(randi(length(index)));
        end

        function element = get(text, difficulty)
            switch difficulty
                case 'easy'
                    field = text.select(text.easy);
                    element = text.easy.(field);
                case 'medium'
                    field = text.select(text.medium);
                    element = text.medium.(field);
                case 'hard'
                    field = text.select(text.hard);
                    element = text.hard.(field);
                otherwise
                    field = text.select(text.impossible);
                    element = text.impossible.(field);
            end
        end
    end
end