//
//  UserInfo.m
//  ArchiverPrj
//
//  Created by yb.xing on 2018/1/4.
//  Copyright © 2018年 yb.xing. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (id)init
{
    self = [super init];
    if (self)
    {
        self.userID = @"0";
        self.userName = @"xxx";
        self.age = 0;
        self.height = 0.0f;
        self.isMale = NO;
        self.schools = @[@"大学",@"中学",@"小学"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userID forKey:@"userID"];
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeFloat:_height forKey:@"height"];
    [aCoder encodeBool:_isMale forKey:@"isMale"];
    [aCoder encodeObject:_schools forKey:@"schools"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.userID = [aDecoder decodeObjectForKey:@"userID"];
    self.userName = [aDecoder decodeObjectForKey:@"userName"];
    self.age = [aDecoder decodeIntegerForKey:@"age"];
    self.height = [aDecoder decodeFloatForKey:@"height"];
    self.isMale = [aDecoder decodeBoolForKey:@"isMale"];
    self.schools = [aDecoder decodeObjectForKey:@"schools"];
    return self;
}

- (NSString *)description
{
    return _userID;
}
@end
