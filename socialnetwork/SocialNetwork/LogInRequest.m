//
//  LogInRequest.m
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "LogInRequest.h"

@implementation LogInRequest

- (void)logInUserByEmail:(NSString *)eMail andPassword:(NSString *)password {
    
    [PFUser logInWithUsernameInBackground:eMail password:password block:^(PFUser *user, NSError *error) {
        User *localUser = [User new];
        localUser.ID = user.objectId;
        localUser.name = user.username;
        localUser.eMail = user.email;
        localUser.createdAt = user.createdAt;
        localUser.updatedAt = user.updatedAt;
        localUser.eMailVerfied = [user objectForKey:@"emailVerified"];
        
        id <LogInResponseDelegate> delegateLogIn = self.delegateLoginResponse;
        if ([delegateLogIn respondsToSelector:@selector(responseLogInWithUser:andError:)]) {
            [delegateLogIn responseLogInWithUser:localUser andError:error];
        }
    }];
}

@end
