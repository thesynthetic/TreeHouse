//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"

@implementation InitialSlidingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    UIStoryboard *storyboard;

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
    }

    //This should be replaced with Generic Authentication Test
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
        NSLog(@"Facebook: Logged-in");
        self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"FirstTop"];
    } else {
        // No, display the login page.
        NSLog(@"Facebook: Not Logged-In");
        self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"SplashPage"];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}

@end
