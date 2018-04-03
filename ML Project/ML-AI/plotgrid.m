close all

% Inputting the matrix
grid = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0;0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;];

%Finding the dimensions of input matrix
grid_size = size(grid);

% Generating the coordinates for the grid
x = linspace(0,grid_size(1,1),grid_size(1,1)+1);
y = linspace(0,grid_size(1,2),grid_size(1,2)+1);

% Horizontal grid
for k = 1:length(y)
    line([x(1) x(end)], [y(k) y(k)])
end

% Vertical grid
for k = 1:length(x)
    line([x(k) x(k)], [y(1) y(end)])
end

% Overlayig the grid with squares
for i = 1:length(x)-1
    for j = 1:length(y)-1
        %Marking path with 0
        if grid(j,i)==1
            rectangle('Position',[i-1 20-j 1 1],'FaceColor',[1 0 0],'EdgeColor',[1 0 0])
        end
        %Marking path with 1
        if grid(j,i)==3
            rectangle('Position',[i-1 20-j 1 1],'FaceColor',[0 0 0],'EdgeColor',[0 0 0])
        end
%         %Marking path with 1
%         if grid(j,i)==0
%             rectangle('Position',[20-1-i 20-1-j 1 1],'FaceColor',[0 .5 .5],'EdgeColor',[0 .5 .5])
%         end
    end
end

% Recreating the grid
% Horizontal grid
for k = 1:length(y)
    line([x(1) x(end)], [y(k) y(k)])
end
% Vertical grid
for k = 1:length(x)
    line([x(k) x(k)], [y(1) y(end)])
end
axis square