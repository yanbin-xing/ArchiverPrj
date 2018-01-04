//
//  UserInfo.h
//  ArchiverPrj
//
//  Created by yb.xing on 2018/1/4.
//  Copyright © 2018年 yb.xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>

@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *userName;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) BOOL isMale;
@property (strong, nonatomic) NSArray *schools;
@end
