//
//  SplashViewController.h
//  TreeHouse
//
//  Created by Ryan Hittner on 1/12/13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <FacebookSDK/FacebookSDK.h>


@interface SplashViewController : UIViewController
{

}

@property (nonatomic) NSInteger splashImageIndex;
@property (nonatomic, retain) NSArray *splashFrames;
@property (nonatomic, retain) IBOutlet UIImageView *splashImageView;

- (IBAction)openSession:(id)sender;

@end
