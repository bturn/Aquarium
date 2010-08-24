//
//  AquariumViewController.m
//  Aquarium
//
//  Created by Brian Turner on 8/22/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "AquariumViewController.h"
#import "Aquarium.h"
#import "CustomObject.h"


@implementation AquariumViewController
@synthesize fishesArray;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		NSLog(@"inside AquariumViewController Init");

		fishesArray = [[NSMutableArray alloc] init];
		segmentedController = [[UISegmentedControl alloc] init];

		
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"%i",[segmentedController selectedSegmentIndex]);
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView:self.view];


	
	
	switch ([segmentedController selectedSegmentIndex]) {
		case 0:
			customObject = [[CustomObject alloc] initWithPosition:p andAquarium:self andImage:nil];
			customObject.scale = 1;
			break;
		case 1:
			NSLog(@"whatever");
			UIImage *myImage = [UIImage imageNamed:@"fish.jpg"];
			customObject = [[CustomObject alloc] initWithPosition:p andAquarium:self andImage:myImage];
			customObject.scale = 1;
				[myImage release];
			break;
		case 2:
			customObject = [[CustomObject alloc] initWithPosition:p andAquarium:self andImage:nil];
			customObject.bounceOnScreenLimit= NO;
			customObject.scale = 3;
			break;
			
		default:
			break;
	}
	
	
	[self.view addSubview:customObject];
	[fishesArray addObject:customObject];
	[customObject release];

	
}

-(void)updateAQ {
	//NSLog(@"ViewController Update");
	for (CustomObject *myImageObject in fishesArray) {
		[myImageObject update];
	}
	
	
}

-(void)renderAQ {
	//		NSLog(@"ViewController Render");
//	[aqView drawRect:CGRectMake(0, 0, 320, 480)];
	for (CustomObject *myImageObject in fishesArray) {
		[myImageObject render];
	}
	
}

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
