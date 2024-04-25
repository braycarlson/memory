classdef Level
    properties (Access = public)
        board;
        difficulty;
        element;
        match;
        name;
        x;
        y;
    end

    methods (Static)
        function zero = zeros(varargin)
            % Overload the zeros() function
            if (nargin == 0)
                zero = Level('easy');
            elseif any([varargin{:}] <= 0)
                zero = Level.empty( ...
                    varargin{:} ...
                );
            else
                zero = repmat( ...
                    Level('easy'), ...
                    varargin{:} ...
                );
            end
        end
   end

    methods (Access = public)
        function level = Level(difficulty)
            import type.*

            type = Type(difficulty);
            element = type.element;
            name = type.name;

            level.x = 5;
            level.y = 5;
            level.difficulty = difficulty;
            level.element = element;
            level.name = name;

            % Create an identifier for each pair
            id = 1:length(element);

            % Map the identifier to each pair
            level.match = containers.Map(id, element);

            % Shuffle the board
            level.board = level.shuffle();
        end

        function board = shuffle(self)
            id = 1:self.match.Count;

            % Repeat the identifier for each pair
            id = repelem(id, 2);
            size = length(id);
            
            % Shuffle the vector
            id = id(randperm(size));
            
            % Get the index of the middle point
            index = floor(size / 2);
            
            % Insert a zero into the middle of the vector
            board = [ ...
                id(1:index), ...
                0, ...
                id(index + 1:end) ...
            ];

            % Create the board
            board = reshape(board, self.x, []);
        end
    end
end