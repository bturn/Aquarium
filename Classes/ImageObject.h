//
//  ImageObject.h
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class AquariumViewController;

@interface ImageObject : UIControl {
	float x;
	float y;
	
	float width;
	float height;
	
	UIImage *imageToSet;
	CGPoint movement;
	
	float newX;
	float newY;
	float newWidth;
	float newHeight;
	
	BOOL bounceOnScreenLimit;
	BOOL wrapOnScreenLimit;
	
	AquariumViewController *passedAQ;
}
@property (assign) float x,y;
@property (assign) float width,height;
@property (assign) CGPoint movement;
@property (assign) BOOL bounceOnScreenLimit;
@property (assign) BOOL wrapOnScreenLimit;

-(id)initWithPosition:(CGPoint)pos andAquarium:(AquariumViewController *)aq;
-(void)update;
-(void)render;


@end
