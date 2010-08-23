//
//  AquariumAppDelegate.h
//  Aquarium
//
//  Created by Brian Turner on 8/22/10.
//  Copyright Apple Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AquariumViewController;

@interface AquariumAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	AquariumViewController *aqViewController;
}

-(void)gameLoop:(id)sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

