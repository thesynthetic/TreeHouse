//
//  SplashViewController.m
//  TreeHouse
//
//  Created by Ryan Hittner on 1/12/13.
//
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

@synthesize splashImageView;
@synthesize splashFrames;
@synthesize splashImageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    splashImageIndex = 0;
    splashFrames = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"Splash_Page_Image_1.jpg"],
                                [UIImage imageNamed:@"Splash_Page_Image_2.jpg"],
                                nil];
    
    
    [NSTimer scheduledTimerWithTimeInterval:7.0 target:self selector:@selector(transitionPhase1) userInfo:nil repeats:YES];

    
    // See if we have a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
        NSLog(@"Facebook: Logged-in");
    } else {
        // No, display the login page.
        NSLog(@"Facebook: Not Logged-In");
    }
    
	// Do any additional setup after loading the view.
}


-(void)transitionPhase1{
    
    if (splashImageIndex < [self.splashFrames count] - 1){
        splashImageIndex++;
    }else{
        splashImageIndex = 0;
    }
    
    
    [UIView transitionWithView:splashImageView
                    duration:1.5
                    options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                            [splashImageView setAlpha:0.0];
                    }
                    completion:^(BOOL finished) { [self transitionPhase2]; }];
}

-(void)transitionPhase2{
    
    [UIView transitionWithView:splashImageView
                    duration:1.5
                    options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [splashImageView setAlpha:1.0];
                        [splashImageView setImage:[splashFrames objectAtIndex:splashImageIndex]];
                    }
                    completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen: {
            UIViewController *topViewController =
            [self.navController topViewController];
            if ([[topViewController modalViewController]
                 isKindOfClass:[SCLoginViewController class]]) {
                [topViewController dismissModalViewControllerAnimated:YES];
            }
        }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            // Once the user has logged in, we want them to
            // be looking at the root view.
            [self.navController popToRootViewControllerAnimated:NO];
            
            [FBSession.activeSession closeAndClearTokenInformation];
            
            [self showLoginView];
            break;
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }    
}

*/

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    
}


- (IBAction)openSession:(id)sender
{
    [FBSession openActiveSessionWithReadPermissions:nil
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {

         [self sessionStateChanged:session state:state error:error];
         
     }];
}




@end
