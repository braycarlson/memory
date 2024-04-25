classdef Type
    properties (Access = public)
        name;
        difficulty;
        element;
    end

    methods (Access = public)
        function type = Type(difficulty)
            import image.*;
            import text.*;
            
            selection = randi([0, 1], 1, 1);

            switch selection
                case 0
                    name = 'image';

                    image = Image();
                    element = image.get(difficulty);
                otherwise
                    name = 'text';

                    text = Text();
                    element = text.get(difficulty);
            end

            type.name = name;
            type.element = element;
        end
    end
end