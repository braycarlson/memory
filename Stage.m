classdef Stage
    properties (Access = public)
        collection;
        limit;
    end

    methods (Access = public)
        function stage = Stage(amount)
            limit = 200;

            switch amount
                case 1
                    collection = stage.create(2, 'easy');
                    limit = limit - 20;
                case 2
                    collection = stage.create(2, 'easy');
                    limit = limit - 40;
                case 3
                    collection = stage.create(2, 'medium');
                    limit = limit - 60;
                case 4
                    collection = stage.create(2, 'medium');
                    limit = limit - 60;
                case 5
                    collection = stage.create(2, 'hard');
                    limit = limit - 60;
                case 6
                    collection = stage.create(2, 'hard');
                    limit = limit - 60;
                otherwise
                    collection = stage.create(2, 'impossible');
                    limit = limit - 80;
            end

            stage.collection = collection;
            stage.limit = limit;
        end
       
        function collection = create(~, amount, difficulty)
            import level.*
            collection = zeros(amount, 1, 'Level');

            for i = 1:amount
                level = Level(difficulty);
                collection(i) = level;
            end
        end
    end
end