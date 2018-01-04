//
//  Method.h
//  ArchiverPrj
//
//  Created by yb.xing on 2018/1/4.
//  Copyright © 2018年 yb.xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Method : NSObject

//对象归档
+ (void)archiverObject:(id)obj;
//从归档文件读取对象
+ (id)unArchiverObject:(Class)cls;
//对象数组归档
+ (void)archiverObjects:(NSArray *)arr;
//从归档文件读取对象数组
+ (NSArray *)unArchiverObjects:(Class)cls;
//清除归档
+ (void)removeArchiver:(Class)cls;
@end
