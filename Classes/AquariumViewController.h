//
//  AquariumViewController.h
//  Aquarium
//
//  Created by Brian Turner on 8/22/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Aquarium;
@class ImageObject;

@interface AquariumViewController : UIViewController {
	Aquarium *aqView;
	ImageObject *imageView;
	
	NSMutableArray *fishesArray;

}
@property (nonatomic, retain) NSMutableArray *fishesArray;

-(void)updateAQ;
-(void)renderAQ;

@end
