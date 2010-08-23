//
//  Aquarium.m
//  Aquarium
//
//  Created by Brian Turner on 8/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "Aquarium.h"
#import "ImageObject.h"

@implementation Aquarium


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		[self setBackgroundColor:[UIColor blueColor]];
	fishArray = [[NSMutableArray alloc] init];

    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code


	
}


- (void)dealloc {
    [super dealloc];
}


@end
