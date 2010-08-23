//
//  Fish.h
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageObject.h"

@interface Fish : ImageObject {
	float hunger;	
	float goldMultiplier;
	BOOL carnivore;
	
}
-(id)initWithAquarium:(AquariumViewController *)aq;



@end
