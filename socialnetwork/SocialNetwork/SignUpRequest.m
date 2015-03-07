//
//  SignUpRequest.m
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "SignUpRequest.h"

@implementation SignUpRequest

- (void)signUpUserLogInByEMail:(NSString *)logIn password:(NSString *)password {
    PFUser *user = [PFUser user];
    user.username = logIn;
    user.password = password;
    user.email = logIn;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {        
        id <SignUpResponseDelegate> delegateSignUp = self.delegateSignUpResponse;
        if ([delegateSignUp respondsToSelector:@selector(responseSignUpWithSuccesed:andError:)]) {
            [delegateSignUp responseSignUpWithSuccesed:succeeded andError:error];
        }
    }];
}

@end
