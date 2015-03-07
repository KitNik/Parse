//
//  LogInRequest.h
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "RequestBase.h"
#import "User.h"

@protocol LogInResponseDelegate <NSObject>

- (void)responseLogInWithUser:(User *)user andError:(NSError *)error;

@end

@interface LogInRequest : RequestBase

- (void)logInUserByEmail:(NSString *)eMail andPassword:(NSString *)password;

@property (nonatomic, strong)id <LogInResponseDelegate> delegateLoginResponse;

@end
