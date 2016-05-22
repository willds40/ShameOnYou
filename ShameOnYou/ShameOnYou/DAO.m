//
//  DAO.m
//  ShameOnYou
//
//  Created by Erica Correa on 5/20/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import "DAO.h"
#import "HallOfShameTableViewController.h"

@implementation DAO

+ (DAO *)sharedInstance {
    
    static DAO *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DAO alloc]init];
        [_sharedInstance getNamesFromWiki]; 
    });
    return _sharedInstance;
}

-(void)getNamesFromWiki{
    
    NSString * getNameString = @"http://www.sourcewatch.org/api.php?action=query&titles=Climate_Change_Deniers&prop=revisions&rvprop=content&format=json";
    
    NSURLSession * session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:getNameString] completionHandler:^(NSData *data, NSURLResponse * response, NSError * error) {
        
        // handle response
        NSString * denierNames = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        
        NSMutableArray * arrayOfNames1 = [[NSMutableArray alloc]init];
        
        //going to add names to this final list
        self.arrayOfNames = [[NSMutableArray alloc]init];
        
        NSString * subString = [denierNames substringWithRange:NSMakeRange(4005, 2156)];
        
        //this seperates names
        NSArray * strings = [subString componentsSeparatedByString:@"\\n*"];
        
        //this loops through the name and replaces brackets
        for (int i = 1; i < [strings count]; i++) {
            
            NSString * string3 = [strings[i] stringByReplacingOccurrencesOfString:@"[[" withString:@" "];
            
            [arrayOfNames1 addObject:string3];
        }
            
        for (int i = 0; i < [arrayOfNames1 count]; i++) {
            NSString *string4 = [arrayOfNames1[i] stringByReplacingOccurrencesOfString:@"]]" withString:@" "];
            [self.arrayOfNames addObject:string4];
        }
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Reload" object:nil];
    
    }] resume];
}

// this hsould be changed to uibutton action
//we need to the Social.framework in the linked library
// add this <UIActionSheetDelegate>
// add uialertview delegate


//- (void)share{
//    
//    UIActionSheet *sharingSheet = [[UIActionSheet alloc] initWithTitle:@"Share" delegate:self
//                                                     cancelButtonTitle:@"Cancel"
//                                                destructiveButtonTitle:nil
//                                                     otherButtonTitles:@"Tweet",
//                                   @"Share on Facebook", nil];
//    [sharingSheet showInView:self.view];
//    
//}
//
//#pragma mark - UIActionSheetDelegate Methods
//
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    if (index == 0) {
//        NSLog(@"Tweet Button Pressed.");
//        // Twitter
//        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
//            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
//            [tweet setInitialText:@"I just completed the Social.framework Tutorial by @iosdevtutorials !"];
//            [tweet setCompletionHandler:^(SLComposeViewControllerResult result)
//             {
//                 if (result == SLComposeViewControllerResultCancelled)
//                 {
//                     NSLog(@"The user cancelled.");
//                 }
//                 else if (result == SLComposeViewControllerResultDone)
//                 {
//                     NSLog(@"The user sent the tweet");
//                 }
//             }];
//            [self presentViewController:tweet animated:YES completion:nil];
//        } else {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter"
//                                                            message:@"Twitter integration is not available.  A Twitter account must be set up on your device."
//                                                           delegate:self
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//        }
//    } else if (index == 1) {
//        NSLog(@"Share on Facebook Button Pressed.");
//        
//        // Facebook
//        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//            [tweet setInitialText:@"I just completed the Social.framework Tutorial by @iosdevtutorials !"];
//            [tweet setCompletionHandler:^(SLComposeViewControllerResult result) {
//                 if (result == SLComposeViewControllerResultCancelled) {
//                     NSLog(@"The user cancelled.");
//                 } else if (result == SLComposeViewControllerResultDone) {
//                     NSLog(@"The user posted to Facebook");
//                 }
//             }];
//            [self presentViewController:tweet animated:YES completion:nil];
//        } else {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook"
//                                                            message:@"Facebook integration is not available.  A Facebook account must be set up on your device."
//                                                           delegate:self
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//        }
//    }
//}

@end
