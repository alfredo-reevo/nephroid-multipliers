clear
clc

animate = true;
transparentBackground = false;
R = 1;           % Circle Radius
n = 256;          % number of points
multiplier = 2;  % graph of multiples to plot
iterations = n-1;

t = linspace(0, 2*pi, 100);
x = R*cos(t);
y = R*sin(t);
xLim = [-R, R];
yLim = [-R, R];
points = zeros(n, 2);

% COLOUR MATRICES
%{
    first row is the background colour,
    second row is the edge colour,
    third row is the point colour
%}

c0 = [  0/255,   0/255,   0/255;    % Default
      255/255, 255/255, 255/255;
      255/255,   0/255,   0/255];
c1 = [148/255, 168/255, 154/255;
      212/255, 224/255, 155/255;
      164/255,  74/255,  63/255];
c2 = [ 93/255,  46/255,  70/255;
      232/255, 214/255, 203/255;
      173/255, 106/255, 108/255];
c3 = [ 82/255,  42/255,  39/255;
      156/255, 179/255, 128/255;
      197/255, 152/255, 73/255];
c4 = [ 82/255, 183/255, 136/255;
      178/255, 211/255, 168/255;
      237/255, 229/255, 166/255];

C = c0;

% Initialising Points Array
for p = 1:n
    P = [-cos(2*pi*(p-1)/n), sin(2*pi*(p-1)/n)];
    points(p, :) = P;
end
% Plotting Edges
if ~animate
hold on
    for i = 0:iterations
        result = multiplier * i;
        plot([points(i+1, 1), points(mod(result, n) + 1, 1)], [points(i+1, 2), points(mod(result, n) + 1, 2)], "-", Color=C(3, :), LineWidth=2)
    end
    %plot(x, y, "k", lineWidth = 2)
    for p = 1:n
        scatter(points(p, 1), points(p, 2), 25, C(2, :), "filled")
        %plot(points(p, 1), points(p, 2), "r.", MarkerSize=25)
    end
    
    h = get(gca, "Children");
    axis equal
    axis off
    fig = gcf;
    if transparentBackground
        fig.Color = "none";
    else
        fig.Color = C(1, :);
    end
    str1 = "${\lambda = " + multiplier + "}$";
    annotation("textbox",[.8 .7 .3 .2], "String", str1, "FitBoxToText", "on", "Color", "w", "FontSize", 28, "Interpreter", "latex", LineStyle="none")
    str2 = "${n = " + n + "}$";
    annotation("textbox",[.8 .6 .3 .2], "String", str2, "FitBoxToText", "on", "Color", "w", "FontSize", 28, "Interpreter", "latex", LineStyle="none")
    fig.Position = [200, 200, 1280, 720];
    xlim([xLim(1) - 0.25, xLim(2) + 0.25])
    ylim([yLim(1) - 0.25, yLim(2) + 0.25])
else
    percentage = 0;
    for p = 1:n
        scatter(points(p, 1), points(p, 2), 25, C(2, :), "filled")
        hold on
    end
    str1 = "${\lambda = " + multiplier + "}$";
    annotation("textbox",[.8 .7 .3 .2], "String", str1, "FitBoxToText", "on", "Color", "w", "FontSize", 28, "Interpreter", "latex", LineStyle="none")
    str2 = "${n = " + n + "}$";
    annotation("textbox",[.8 .6 .3 .2], "String", str2, "FitBoxToText", "on", "Color", "w", "FontSize", 28, "Interpreter", "latex", LineStyle="none")
    for i = 0:iterations
        percentage = (i/(iterations))*100;
        disp(round(percentage, 2) + "% saved")
        result = multiplier * i;
        plot([points(i+1, 1), points(mod(result, n) + 1, 1)], [points(i+1, 2), points(mod(result, n) + 1, 2)], "-", Color=C(3, :), LineWidth=2)
        axis equal
        axis off
        fig = gcf;
        if transparentBackground
            fig.Color = "none";
        else
            fig.Color = C(1, :);
        end
        fig.Position = [200, 200, 1280, 720];
        xlim([xLim(1) - 0.25, xLim(2) + 0.25])
        ylim([yLim(1) - 0.25, yLim(2) + 0.25])
        h = get(gca, "Children");
        set(gca, "Children", [h(2:end); h(1)])
        filename = sprintf("%s/frame_%03d.png", "C:\Users\reeve\OneDrive\Documents\MATLAB\times\frames", i);
        F = getframe(gcf);
        imwrite(F.cdata, filename);
    end

end
    
