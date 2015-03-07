//
//  ResetPasswordRequest.h
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "RequestBase.h"

@protocol ResetPasswordResponseDelegate <NSObject>

- (void)responseResetPasswordWithSuccessed:(BOOL)successed andError:(NSError *)error;

@end

@interface ResetPasswordRequest : RequestBase

@property (nonatomic, strong)id <ResetPasswordResponseDelegate> delegateResetPasswordResponse;

- (void)resetPasswordByEmail:(NSString *)eMail;

@end
