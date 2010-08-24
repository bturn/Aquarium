//
//  AquariumViewController.h
//  Aquarium
//
//  Created by Brian Turner on 8/22/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Aquarium;
@class CustomObject;

@interface AquariumViewController : UIViewController {
	IBOutlet Aquarium *aqView;

	CustomObject *customObject;
	
	NSMutableArray *fishesArray;
	
	int fishChoice;
	
	IBOutlet UISegmentedControl *segmentedController;
	

}
@property (nonatomic, retain) NSMutableArray *fishesArray;

-(void)updateAQ;
-(void)renderAQ;

@end
