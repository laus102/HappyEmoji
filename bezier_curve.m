CGFloat initialScale = mySprite.xScale;
SKAction *scaleAction = [SKAction customActionWithDuration:duration actionBlock:^(SKNode *node, CGFloat elapsedTime) {
  CGFloat t = elapsedTime/duration;
  CGFloat p = t*t;
  CGFloat s = initialScale*(1-p) + scale * p;
  [node setScale:s];
}];
[mySprite runAction:scaleAction];




CGMutablePathRef cgpath = CGPathCreateMutable();

CGPoint startingPoint = CGPointMake(50, 100);
CGPoint controlPoint1 = CGPointMake(160, 250);
CGPoint controlPoint2 = CGPointMake(200, 140);
CGPoint endingPoint = CGPointMake(303, 100);


CGPathMoveToPoint(cgpath, NULL, startingPoint.x, startingPoint.y);
CGPathAddCurveToPoint(cgpath, NULL, controlPoint1.x, controlPoint1.y,
                      controlPoint2.x, controlPoint2.y,
                      endingPoint.x, endingPoint.y);


SKAction *enemyCurve = [SKAction followPath:cgpath asOffset:NO orientToPath:YES duration:5];

[enemy runAction:[SKAction sequence:@[[SKAction waitForDuration:1],enemyCurve]]];

