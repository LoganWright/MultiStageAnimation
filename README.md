MultiStageAnimation
===================

A Class For Adding Easy Multi Stage Animation To Your Project


###Usage:

```ObjC
// Create New Animation
MSAnimation * newAnimation = [MSAnimation newAnimationWithDuration:0.35 andOptions:UIViewAnimationOptionCurveEaseInOut];

// Add Sequence
[newAnimation addNewAnimationStage:^{
    greenView.center = CGPointMake(greenView.center.x, greenView.center.y + 100);
}];
[newAnimation addNewAnimationStage:^{
    greenView.center = CGPointMake(greenView.center.x + 100, greenView.center.y);
}];
[newAnimation addNewAnimationStage:^{
    greenView.center = CGPointMake(greenView.center.x, greenView.center.y + 100);
}];
[newAnimation addNewAnimationStage:^{
    greenView.center = CGPointMake(greenView.center.x - 50, greenView.center.y);
}];
[newAnimation addNewAnimationStage:^{
    greenView.frame = CGRectMake(0, 0, 100, 100);
}];

// Animate Your Sequence With Completion
[newAnimation animateSequenceWithCompletion:^{
    NSLog(@"All finished!");
}];
``` 

###Gives You:

<p align="center">
  <img src="http://i.stack.imgur.com/BJbZT.gif?raw=true"><img />
</p>
