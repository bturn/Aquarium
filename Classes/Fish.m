//
//  Fish.m
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "Fish.h"
@class AquariumViewController;

@implementation Fish

-(id)initWithAquarium:(AquariumViewController *)aq {
	self.x = random() % 480;
	self.y = random() % 320;
	
	CGPoint myPoint = CGPointMake(x, y);
	
	[self initWithPosition:myPoint andAquarium:aq];
	
	return self;
}

-(id)initWithPosition:(CGPoint)pos andAquarium:(AquariumViewController *)aq {
	[super initWithPosition:pos andAquarium:aq];
	[self setBackgroundColor:[UIColor greenColor]];
	hunger = 10;
	goldMultiplier = 1;
	carnivore = NO;
	
	
	return self;
}

-(void)update {
	float radian = atan(x/y);
	
	float deviation = ((arc4random() % 200)/100.00) -1;
	float angel = radian + deviation;
	NSLog(@"radian %f + deviation %f = angel %f",radian, deviation, 
		  angel);
	[super update];
	
}


@end
