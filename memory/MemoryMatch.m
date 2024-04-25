classdef MemoryMatch < matlab.apps.AppBase
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        GridLayout          matlab.ui.container.GridLayout

        Menu                matlab.ui.container.Menu
        CheatConsoleItem    matlab.ui.container.Menu
        ExitItem            matlab.ui.container.Menu

        LevelLabel          matlab.ui.control.Label
        LevelIdentifier     int8

        TitleLabel          matlab.ui.control.Label
                
        StageLabel          matlab.ui.control.Label
        StageIdentifier     int8

        TimerLabel          matlab.ui.control.Label

        Level
        Stage
        Row
        Column
        Selection       
        
        Countdown
        History
        Timer

        StartButton         matlab.ui.control.Button
        PauseButton         matlab.ui.control.Button
        StopButton          matlab.ui.control.Button
    end

    properties (Access = public, SetObservable) 
        Cheat
        IsLevelClear        int8
        IsStageClear        int8
        State               string
        SquareRemaining     int8
    end

    methods (Access = private)
        function OpenConsole(app)
            if ~strcmpi(app.State, 'off')
                prompt = {'Enter cheat:'};
                title = 'Cheat';
                dimension = [1 35];
                userinput = {'', 'hsv'};
    
                app.Cheat = inputdlg( ...
                    prompt, ...
                    title, ...
                    dimension, ...
                    userinput ...
                );
            end
        end

        function CheatConsole(app, event)
            if event.Key == 'c'
                OpenConsole(app);
            end
        end

        function DeleteTimer(app)
            if isa(app.Timer, 'timer')
                if isvalid(app.Timer)
                    stop(app.Timer);
                    delete(app.Timer);
                end
            end
        end

        function ResetControl(app)
            handle = findobj( ...
                app.GridLayout.Children, ...
                '-class', ...
                'matlab.ui.control.Image',...
                '-or',...
                '-class',...
                'matlab.ui.control.Label'...
            );
    
            if isempty(handle)
                return
            end
            
            app.DeleteTimer();
            delete(handle);
        end

        function StartLevel(app)
            import level.*
            import stage.*
            
            % If the state was paused, then resume it
            if isa(app.Timer, 'timer')
                if strcmpi(app.State, 'pause')
                    app.ResumeLevel();
                end
            end

            % Reset the UI
            app.ResetControl();

            % Create LevelLabel
            app.LevelLabel = uilabel(app.GridLayout);
            app.LevelLabel.HorizontalAlignment = 'center';
            app.LevelLabel.FontSize = 24;
            app.LevelLabel.FontColor = '#ffffff';
            app.LevelLabel.Layout.Row = 1;
            app.LevelLabel.Layout.Column = 2;
            app.LevelLabel.Text = 'Level ' + string(app.LevelIdentifier);
            app.LevelLabel.Tag = 'LevelLabel';

            image = uiimage(app.GridLayout);
            image.Layout.Row = 1;
            image.Layout.Column = 4;
            image.ImageSource = 'asset/logo.png';

            % Create StageLabel
            app.StageLabel = uilabel(app.GridLayout);
            app.StageLabel.HorizontalAlignment = 'center';
            app.StageLabel.FontSize = 24;
            app.StageLabel.FontColor = '#ffffff';
            app.StageLabel.Layout.Row = 1;
            app.StageLabel.Layout.Column = 6;
            app.StageLabel.Text = 'Stage ' + string(app.StageIdentifier);
            app.StageLabel.Tag = 'StageLabel';

            stage = Stage(app.StageIdentifier);
            level = stage.collection(app.LevelIdentifier);
    
            app.Stage = stage;
            app.Level = level;
            app.State = 'on';

            % Create a timer
            app.Countdown = app.Stage.limit;

            app.Timer = timer( ...
                'Period', ...
                1,...
                'ExecutionMode', ...
                'fixedSpacing', ...
                'TasksToExecute', ...
                Inf ...
            );

            app.Timer.TimerFcn = createCallbackFcn(app, @OnTime, true);

            app.LoadLevel();
        end

        function ResetLevel(app)
            app.DeleteTimer();

            app.PauseButton.Text = 'Pause';
            app.History = containers.Map();
            app.Row = [];
            app.Column = [];
            app.Selection = [];
            app.Cheat = []; 
            app.State = 'off';  
            app.SquareRemaining = [];
            app.LevelIdentifier = 1;
            app.StageIdentifier = 1;
        end

        function LoadLevel(app)
            fprintf("[%s, %s] \n", app.StageLabel.Text, app.LevelLabel.Text);
            disp(app.Level.board);
    
            midpoint = ceil(app.Level.x * app.Level.x / 2);
            app.SquareRemaining = midpoint - 1;

            for i = 1:app.Level.x
                for j = 1:app.Level.x
                    % Row major
                    index = ((j - 1) * app.Level.x) + i;

                    if index == midpoint
                        app.TimerLabel = uilabel(app.GridLayout);
                        app.TimerLabel.HorizontalAlignment = 'center';
                        app.TimerLabel.FontSize = 24;
                        app.TimerLabel.FontColor = '#a9acb7';
                        app.TimerLabel.Layout.Row = 5;
                        app.TimerLabel.Layout.Column = 4;
                        app.TimerLabel.Text = string(app.Stage.limit);

                        continue;
                    end

                    identifier = app.Level.board(index);

                    row = i + 2;
                    column = j + 1;

                    img = uiimage(app.GridLayout);
                    img.Layout.Row = row;
                    img.Layout.Column = column;
                    img.ImageSource = 'asset/placeholder.png';
                    img.ScaleMethod = 'fit';
                    img.UserData = identifier;

                    img.ImageClickedFcn = {
                        @app.OnSelection,... 
                        identifier,...
                        [row, column]
                    };
                end
            end

            start(app.Timer);
        end

        function PauseLevel(app, ~)
            handle = findobj( ...
                app.GridLayout.Children, ...
                '-class', ...
                'matlab.ui.control.Image'...
            );
    
            if isempty(handle)
                return
            end

            stop(app.Timer);

            set(app.PauseButton, 'Text', 'Resume');
            set(handle, 'Enable', 'off');

            app.State = 'pause';
            app.TimerLabel.FontColor = '#505460';
            app.LevelLabel.FontColor = '#505460';
            app.StageLabel.FontColor = '#505460';
        end

        function ResumeLevel(app, ~)
            handle = findobj( ...
                app.GridLayout.Children, ...
                '-class', ...
                'matlab.ui.control.Image'...
            );
    
            if isempty(handle)
                return
            end

            start(app.Timer);

            set(app.PauseButton, 'Text', 'Pause');
            set(handle, 'Enable', 'on');

            app.State = 'on';
            app.TimerLabel.FontColor = '#a9acb7';
            app.LevelLabel.FontColor = '#ffffff';
            app.StageLabel.FontColor = '#ffffff';
        end

        function OnTime(app, ~, ~)
            app.Countdown = app.Countdown - 1;
            app.TimerLabel.Text = string(app.Countdown);

            if all(isequal(app.Timer.Running, 'on') & app.Countdown == 0) 
                app.ResetLevel();
                app.ResetControl();
            end
        end

        function OnCheat(app, ~, ~)
            if any(strcmpi(app.State, 'off') | app.Countdown == 0)
                return;
            end

            if ~isempty(app.Cheat)
                if strcmpi(app.Cheat, 'level')
                    app.IsLevelClear = true;
                elseif strcmpi(app.Cheat, 'stage')
                    app.LevelIdentifier = 1;
                    app.IsStageClear = true;
                elseif strcmpi(app.Cheat, 'time')
                    app.DeleteTimer();
                else
                    msgbox('Invalid cheatcode', 'Error', 'error');
                end
            end

            focus(app.UIFigure);
        end

        function OnLevelClear(app, ~, ~)
            app.IsLevelClear = false;

            if app.LevelIdentifier == length(app.Stage.collection)
                app.LevelIdentifier = 1;
                app.StageIdentifier = app.StageIdentifier + 1;
            else
                app.LevelIdentifier = app.LevelIdentifier + 1;
            end
            
            app.History = containers.Map();

            app.StartLevel();
        end

        function OnStageClear(app, ~, ~)
            app.IsStageClear = false;

            app.StageIdentifier = app.StageIdentifier + 1;
            app.StartLevel();
        end

        function OnSquareRemaining(app, ~, ~)
            if app.SquareRemaining == 0
                app.IsLevelClear = true;
            end
        end

        function OnSelection(app, ~, ~, index, coordinates)
            focus(app.UIFigure);

            % The queue is full; do not accept a selection unless cleared
            if length(app.Selection) == 2
                return;
            end

            % Unpack coordinates into row and column
            row = coordinates(1);
            column = coordinates(2);

            % Prevent the user from selecting the same square
            if any(app.Row == row & app.Column == column)
                return;
            end

            % Store row and column to compare against next selection
            app.Row = row;
            app.Column = column;

            strindex = string(index);
            element = 1;

            % If the selected square is in the history, then compare its 
            % coordinates to that of the previously selected square. This
            % is to determine which square to show
            if isKey(app.History, strindex)
                if ~isequal(app.History(strindex), coordinates)
                    element = 2;
                end
            else
                app.History(strindex) = [row, column];
            end

            app.Selection = [app.Selection, index];

            % Find the handle of a specific row/column selection
            handle = findobj( ...
                app.GridLayout.Children, ...
                 '-function',...
                @(x) x.Layout.Row == row,...
                '-and',...
                '-function',...
                @(x) x.Layout.Column == column,...
                'UserData',...
                index,...
                '-class', ...
                'matlab.ui.control.Image'...
            );

            pair = app.Level.match(index);
            source = pair(element);

            if strcmpi(app.Level.name, 'image')
                handle.ImageSource = string(source);
            else
                set(handle, 'Visible', 'off');

                label = uilabel(app.GridLayout);
                label.HorizontalAlignment = 'center';
                label.FontSize = 14;
                label.FontWeight = 'bold';
                label.FontColor = '#a9acb7';
                label.Layout.Row = row;
                label.Layout.Column = column;
                label.Text = source{1};
                label.UserData = index;
            end

            if length(app.Selection) == 2
                if app.Selection(1) == app.Selection(2)
                    pause(0.5);
    
                    if strcmpi(app.Level.name, 'image')
                        handle = findobj( ...
                            app.GridLayout.Children, ...
                            'UserData',...
                            index,...
                            '-class', ...
                            'matlab.ui.control.Image'...
                        );
                    else
                        handle = findobj( ...
                            app.GridLayout.Children, ...
                            'UserData',...
                            index,...
                            '-class', ...
                            'matlab.ui.control.Label'...
                        );
                    end

                    set(handle, 'Visible', 'off');
                    app.SquareRemaining = app.SquareRemaining - 1;
                else
                    pause(1);

                    for i = app.Selection
                        if strcmpi(app.Level.name, 'image')
                            handle = findobj( ...
                                app.GridLayout.Children, ...
                                'UserData',...
                                i,...
                                '-class', ...
                                'matlab.ui.control.Image'...
                            );
    
                            set(handle, 'ImageSource', 'asset/placeholder.png');
                        else
                            handle = findobj( ...
                                app.GridLayout.Children, ...
                                'UserData',...
                                i,...
                                '-class', ...
                                'matlab.ui.control.Label'...
                            );
    
                            delete(handle);
    
                            handle = findobj( ...
                                app.GridLayout.Children, ...
                                'UserData',...
                                i,...
                                '-class', ...
                                'matlab.ui.control.Image'...
                            );
                            
                            set(handle, 'Visible', 'on');
                        end
                    end
                end
                
                % Clear temporary properties
                app.Selection = [];
                app.Row = [];
                app.Column = [];
            end
        end

        % Start the game by pressing the "Start" button
        function StartButtonPushed(app, ~)
            focus(app.UIFigure);

            if strcmpi(app.State, 'on')
                return;
            end
            
            app.StartLevel();
        end

        % Pause the game by pressing the "Pause" button
        function PauseButtonPushed(app, ~)
            focus(app.UIFigure);

            if strcmpi(app.State, 'off')
                return;
            end

            if isa(app.Timer, 'timer')
                if isvalid(app.Timer)
                    if strcmpi(get(app.Timer, 'Running'),'on')
                        app.PauseLevel();
                    else
                        app.ResumeLevel();
                    end
                end
            end
        end

        % Stop the game by pressing the "Stop" button
        function StopButtonPushed(app, ~)
            focus(app.UIFigure);

            if strcmpi(app.State, 'off')
                return;
            end

            app.ResetLevel();
            app.ResetControl();
        end
    end

    % Component initialization
    methods (Access = private)
        % Create UIFigure and components
        function createComponents(app)
            % Color palette
            BackgroundColor = '#0c0c0e';
            StartButtonColor = '#6746ed';
            StartButtonFontColor = '#ffffff';
            PauseButtonColor = '#1e1f22';
            PauseButtonFontColor = '#ffffff';
            StopButtonColor = '#0c0c0e';
            StopButtonFontColor = '#ffffff';

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.KeyPressFcn = createCallbackFcn(app, @CheatConsole, true);
            app.UIFigure.Position = [100 100 657 665];
            app.UIFigure.Color = BackgroundColor;
            app.UIFigure.Name = 'Memory Match';

            app.History = containers.Map();

            % Event listener(s)
            addlistener(app, 'Cheat', 'PostSet', @app.OnCheat);
            addlistener(app, 'IsLevelClear', 'PostSet', @app.OnLevelClear);
            addlistener(app, 'IsStageClear', 'PostSet', @app.OnStageClear);
            addlistener(app, 'SquareRemaining', 'PostSet', @app.OnSquareRemaining);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.ColumnSpacing = 3;
            app.GridLayout.RowSpacing = 3;
            app.GridLayout.BackgroundColor = BackgroundColor;

            % Create StartButton
            app.StartButton = uibutton(app.GridLayout, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.BackgroundColor = StartButtonColor;
            app.StartButton.FontSize = 16;
            app.StartButton.FontWeight = 'bold';
            app.StartButton.FontColor = StartButtonFontColor;
            app.StartButton.Layout.Row = 10;
            app.StartButton.Layout.Column = 2;
            app.StartButton.Text = 'Start';

            % Create PauseButton
            app.PauseButton = uibutton(app.GridLayout, 'push');
            app.PauseButton.ButtonPushedFcn = createCallbackFcn(app, @PauseButtonPushed, true);
            app.PauseButton.BackgroundColor = PauseButtonColor;
            app.PauseButton.FontSize = 16;
            app.PauseButton.FontWeight = 'bold';
            app.PauseButton.FontColor = PauseButtonFontColor;
            app.PauseButton.Layout.Row = 10;
            app.PauseButton.Layout.Column = 4;
            app.PauseButton.Text = 'Pause';

            % Create StopButton
            app.StopButton = uibutton(app.GridLayout, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.BackgroundColor = StopButtonColor;
            app.StopButton.FontSize = 16;
            app.StopButton.FontWeight = 'bold';
            app.StopButton.FontColor = StopButtonFontColor;
            app.StopButton.Layout.Row = 10;
            app.StopButton.Layout.Column = 6;
            app.StopButton.Text = 'Stop';

            app.LevelIdentifier = 1;
            app.StageIdentifier = 1;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)
        % Construct app
        function app = MemoryMatch
            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            screen = get(0, 'screensize');
            width = screen(3);
            height = screen(4);

            app.UIFigure.Position = [
                width / 4 ...,
                height / 4 ..., 
                width / 2 ..., 
                height / 2
            ];

            if nargout == 0
                clear app
            end
        end

        function delete(app)
            app.DeleteTimer();
            delete(app.UIFigure)
        end
    end
end