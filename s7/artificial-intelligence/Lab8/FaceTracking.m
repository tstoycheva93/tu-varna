videoFileReader = vision.VideoFileReader('cars.mp4');
videoPlayer = vision.VideoPlayer('Position',[100,100,680,520]);
objectFrame = step(videoFileReader);

figure; imshow(objectFrame);
objectRegion=round(getPosition(imrect))

objectImage = insertShape(objectFrame,'Rectangle',objectRegion,'Color','red');
figure;
imshow(objectImage);
title('Red box shows object region');
points = detectMinEigenFeatures(rgb2gray(objectFrame),'ROI',objectRegion);
pointImage = insertMarker(objectFrame,points.Location,'+','Color','white');
figure;
imshow(pointImage);
title('Detected interest points');
tracker = vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker,points.Location,objectFrame);
while ~isDone(videoFileReader)
      frame = step(videoFileReader);
        [points,validity] =step(tracker,frame);
      out = insertMarker(frame,points(validity, :),'+');
      step(videoPlayer,out);
end
release(videoPlayer);
release(videoFileReader);