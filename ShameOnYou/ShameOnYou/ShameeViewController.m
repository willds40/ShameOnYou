//
//  ShameeViewController.m
//  ShameOnYou
//
//  Created by Erica Correa on 5/20/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import "ShameeViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ShameeViewController ()


@end

@implementation ShameeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.shameeName.text = self.shamee;
    
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    UIImage *image = [UIImage imageNamed:@"ShameOnYou.png"];
    photo.image = image;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
    
    // adding share button
    
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    
    //adding contraints programmatically to button
    //Places 50 above bottom of view
    NSLayoutConstraint *buttonConstraint1 = [NSLayoutConstraint constraintWithItem:shareButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50];
    
    //Adds constraints that the buttom is center
    NSLayoutConstraint *buttonConstraint2 = [NSLayoutConstraint constraintWithItem:shareButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:self.view.frame.size.width/2.5];
    
    //Need this to make sure it doesn't resize.
    shareButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:shareButton];
    [self.view addConstraint:buttonConstraint1];
    [self.view addConstraint:buttonConstraint2];
    
    

    
}
        
    

//- (IBAction)shameTheShameeButton:(id)sender {
//    
//    
//    
//    
//    
//    
//    
//                                   }
//
//
//}
@end
