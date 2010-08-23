//
//  AquariumViewController.m
//  Aquarium
//
//  Created by Brian Turner on 8/22/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "AquariumViewController.h"
#import "Aquarium.h"
#import "ImageObject.h"
#import "Fish.h"

@implementation AquariumViewController
@synthesize fishesArray;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		NSLog(@"inside AquariumViewController Init");
        // Custom initialization
		aqView = [[Aquarium alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
		self.view = aqView;
		fishesArray = [[NSMutableArray alloc] init];
		
		
		
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView:self.view];
	//[aqView setPosition:p];
	
//	imageView = [[ImageObject alloc] initWithPosition:p andAquarium:self];
		imageView = [[Fish alloc] initWithPosition:p andAquarium:self];
	[imageView setBounceOnScreenLimit:YES];
	[self.view addSubview:imageView];
	[fishesArray addObject:imageView];
	[imageView release];
	
}

-(void)updateAQ {
	//NSLog(@"ViewController Update");
	for (ImageObject *myImageObject in fishesArray) {
		[myImageObject update];
	}
	
	
}

-(void)renderAQ {
	//		NSLog(@"ViewController Render");
	[aqView drawRect:CGRectMake(0, 0, 320, 480)];
	for (ImageObject *myImageObject in fishesArray) {
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
