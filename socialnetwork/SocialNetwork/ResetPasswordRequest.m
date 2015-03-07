//
//  ResetPasswordRequest.m
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "ResetPasswordRequest.h"

@implementation ResetPasswordRequest

- (void)resetPasswordByEmail:(NSString *)eMail {
    [PFUser requestPasswordResetForEmailInBackground:eMail block:^(BOOL succeeded, NSError *error) {
        id <ResetPasswordResponseDelegate> delegateReset = self.delegateResetPasswordResponse;
        if ([delegateReset respondsToSelector:@selector(responseResetPasswordWithSuccessed:andError:)]) {
            [delegateReset responseResetPasswordWithSuccessed:succeeded andError:error];
        }
    }];
}

@end
