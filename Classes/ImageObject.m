//
//  ImageObject.m
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ImageObject.h"
#import "AquariumViewController.h";

@implementation ImageObject
@synthesize x,y,width,height;
@synthesize movement;
@synthesize bounceOnScreenLimit,wrapOnScreenLimit;


-(void)objectSelected:(id)sender {

	[[passedAQ fishesArray] removeObject:self];
	[self removeFromSuperview];

}


-(id)initWithPosition:(CGPoint)pos andAquarium:(AquariumViewController *)aq {
//	[super initWithImage:[UIImage imageNamed:@"ball.png"]];	
	passedAQ= aq;

	[self addTarget:self action:@selector(objectSelected:) forControlEvents:UIControlEventTouchDown];
	width = 20;
	height = width;
	
	[super initWithFrame:CGRectMake(0, 0, width, height)];
	[self setBackgroundColor:[UIColor redColor]];
	x = pos.x;
	y = pos.y;

	


	int yMovement = random() % 5;
	int xMovement = random() % 5;
	movement = CGPointMake(xMovement,yMovement);
	
	
	self.center = CGPointMake(x,y);
	
	bounceOnScreenLimit = YES;
	wrapOnScreenLimit = NO;
	
	
	
	return self;
}

-(void)update {
	
	if (bounceOnScreenLimit) {
		if (newY > 480 - height/2 || newY < 20 + height/2) {
			movement.y = -movement.y;
		}
		if (newX > 320 - width/2 || newX < width/2) {
			movement.x = -movement.x;
		}
	}
	
	if (wrapOnScreenLimit) {

		if (newX > 320 || newX < 0) {
			self.center = CGPointMake(abs(newX - 320), self.center.y);
		}
		if (newY > 480 || newY < 0) {
			self.center = CGPointMake(self.center.x,abs(newY - 480));
		}
	}
	
	
	newX = self.center.x + movement.x;
	newY = self.center.y + movement.y;
	


}

-(void)render {
	self.center = CGPointMake(newX, newY);
	
}

@end
