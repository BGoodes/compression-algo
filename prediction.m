run('config.m');

mbSize = 16;
p = 7;
S = 10;

fidIn = fopen(INPUT_FILE, 'r');

% Display
fig = uifigure('Name', 'Diaporama', 'Position', [100, 100, 800, 400]);
ax1 = uiaxes(fig, 'Position', [50, 50, 320, 300]);
ax2 = uiaxes(fig, 'Position', [430, 50, 320, 300]);

% Buttons
btnPrev = uibutton(fig, 'Text', 'Précédent', 'Position', [200, 10, 100, 30], ...
    'ButtonPushedFcn', @(btn, event) updateImage(fig, -1));
btnNext = uibutton(fig, 'Text', 'Suivant', 'Position', [500, 10, 100, 30], ...
    'ButtonPushedFcn', @(btn, event) updateImage(fig, 1));

imagesOrig = cell(1, S);
imagesPred = cell(1, S);

for i = 1:S
    [compY1, compU1, ~] = yuv_readimage(fidIn);
    [compY2, compU2, ~] = yuv_readimage(fidIn);
    
    [motionVect, ~] = motionEstDS(compU1, compY2, mbSize, p);
    imgComp = motionComp(compY1, motionVect, mbSize);
    
    imagesOrig{i} = compY2;
    imagesPred{i} = imgComp;
end

fclose(fidIn);

setappdata(fig, 'imagesOrig', imagesOrig);
setappdata(fig, 'imagesPred', imagesPred);
setappdata(fig, 'currentIndex', 1);
setappdata(fig, 'ax1', ax1);
setappdata(fig, 'ax2', ax2);
setappdata(fig, 'S', S);

updateDisplay(fig);

function updateDisplay(fig)
    imagesOrig = getappdata(fig, 'imagesOrig');
    imagesPred = getappdata(fig, 'imagesPred');
    currentIndex = getappdata(fig, 'currentIndex');
    ax1 = getappdata(fig, 'ax1');
    ax2 = getappdata(fig, 'ax2');

    imshow(uint8(imagesOrig{currentIndex}), 'Parent', ax1);
    title(ax1, ['Originale ', num2str(currentIndex)], 'FontSize', 10);
    
    imshow(uint8(imagesPred{currentIndex}), 'Parent', ax2);
    title(ax2, ['Prédite ', num2str(currentIndex)], 'FontSize', 10);
end

function updateImage(fig, direction)
    currentIndex = getappdata(fig, 'currentIndex');
    S = getappdata(fig, 'S');

    currentIndex = currentIndex + direction;
    currentIndex = max(1, min(S, currentIndex));
    
    setappdata(fig, 'currentIndex', currentIndex);
    updateDisplay(fig);
end
