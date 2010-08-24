//
//  CustomObject.m
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CustomObject.h"
#import "AquariumAppDelegate.h"



@implementation CustomObject

@synthesize scale;
@synthesize movement;
@synthesize bounceOnScreenLimit;


#pragma mark -
#pragma mark initMethods
-(id)initWithPosition:(CGPoint)pos andAquarium:(AquariumViewController *)aq andImage:(UIImage *)image {
	self = [super initWithFrame:objectRect];
	NSLog(@"initWith position");
	
	imageToSet = image;
	[imageToSet retain];
	
	
	
	centerX = pos.x;
	centerY = pos.y;
	
	// ------------------  test to see if an image was passed -----------------
	//if it wasnt, jsut set default width and height
	if (!imageToSet) {
		initWidth = 20;
		initHeight = initWidth;
	}
	
	//if it was execute here
	else {
		
		//we grab the image width and height and set the object dimensions as such
		initWidth = imageToSet.size.width;
		initHeight = imageToSet.size.height;
		CGRect fullRect = CGRectMake(0, 0, initWidth, initHeight);
		
		//create the uiimageview
		imageView = [[UIImageView alloc] initWithImage:imageToSet];
		[imageView setFrame:fullRect];
		
		//add it to the subview
		//		[self addSubview:imageView];
		
		
	}
	
	scale = 1;
	
	//init object with random movements between 4, and -4;
	float yMovement = ((arc4random() % 800)/100.00) -4;
	float xMovement = ((arc4random() % 800)/100.00) -4;
	
	//if the movement is between -1 and 1, than set it to be 1;
	if (abs(xMovement) <= 1) {
		xMovement = 2;
	}
	if (abs(yMovement) <= 1) {
		yMovement = 2;
	}
	movement = CGPointMake(xMovement, yMovement);
	
	bounceOnScreenLimit = YES;	
	
	
	
	[self setBackgroundColor:[UIColor redColor]];	
	return self;
}




#pragma mark -
#pragma mark RunTime

-(void)update {
	width = initWidth * scale;
	height = initHeight * scale;
	
	
	
	
	
	//if the object should bounce off the walls is turned on
	if (bounceOnScreenLimit) {
		
		//test for screen side collision 
		if (centerX+width/2 > 320) {
			centerX = 320 - width/2;
			movement.x = -movement.x;
		}
		if (centerX-width/2 < 0) {
			centerX = 0 + width/2;
			movement.x = -movement.x;
		}
		if (centerY+height/2 > 480){
			movement.y = -movement.y;
			centerY = 480-height/2;
		}
		if (centerY-height/2 < 0) {
			movement.y = -movement.y;
			centerY = 0 + height/2;
		}

		
	}
	else {
		
		if (centerX >= 320 || centerX <= 0) {
			centerX = abs(centerX-320);
			
		}
		if (centerY  >= 480 || centerY  <= 0){
			centerY = abs(centerY-480);
		}
	}
	
	
	centerX = centerX + movement.x;
	centerY = centerY + movement.y;
	
	
	objectRect = CGRectMake(centerX-width/2, centerY-height/2, width, height);
	
}

-(void)render {
	if (imageView) {
		[self addSubview:imageView];
	}
	
	self.frame = objectRect;
	
	
	
}

@end

