//
//  User.h
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic)NSString *ID;
@property (nonatomic)NSString *name;
@property (nonatomic)NSString *eMail;
@property (nonatomic)NSDate* createdAt;
@property (nonatomic)NSDate* updatedAt;
@property (nonatomic)BOOL eMailVerfied;

@end
