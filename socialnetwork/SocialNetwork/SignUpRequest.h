//
//  SignUpRequest.h
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "RequestBase.h"

@protocol SignUpResponseDelegate <NSObject>

- (void)responseSignUpWithSuccesed:(BOOL)successed andError:(NSError *)error;

@end

@interface SignUpRequest : RequestBase

@property (nonatomic, strong)id <SignUpResponseDelegate> delegateSignUpResponse;

- (void)signUpUserLogInByEMail:(NSString *)logIn password:(NSString *)password;

@end
