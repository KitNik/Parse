//
//  ViewController.h
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "SignUpRequest.h"
#import "LogInRequest.h"
#import "ResetPasswordRequest.h"

@interface RootViewController : UIViewController <UITextFieldDelegate, SignUpResponseDelegate, LogInResponseDelegate, ResetPasswordResponseDelegate>

@end