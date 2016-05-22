//
//  ShameeViewController.h
//  ShameOnYou
//
//  Created by Erica Correa on 5/20/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/SocialDefines.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>







@interface ShameeViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

@property (nonatomic) NSString * shamee;
@property (weak, nonatomic) IBOutlet UILabel *shameeName;
@property (weak, nonatomic) IBOutlet UITextField *customShameMsgTextField;

- (IBAction)shameTheShameeButton:(id)sender;

@end
