//
//  CustomObject.h
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class AquariumViewController;

@interface CustomObject : UIControl {

//-------------------------objects user can set------------------------------------//
	//this will determine how the object interacts with the side of the wall
	BOOL bounceOnScreenLimit;
	
	//this is how fast, and in what direction the object will move
	CGPoint movement;
	
	//this will scale the image while preseving the proper perspective
	float scale;
	

	
	float centerX;
	float centerY;
	
	float width;
	float height;
	
	float initWidth;
	float initHeight;
	
	CGRect objectRect;
	
	UIImage *imageToSet;
	UIImageView *imageView;
		
	AquariumViewController *passedAQ;
}

@property (assign) float scale;
@property (assign) CGPoint movement;
@property (assign) BOOL bounceOnScreenLimit;



//initializers
-(id)initWithPosition:(CGPoint)pos andAquarium:(AquariumViewController *)aq andImage:(UIImage *)image;


//run time
-(void)update;
-(void)render;



@end
