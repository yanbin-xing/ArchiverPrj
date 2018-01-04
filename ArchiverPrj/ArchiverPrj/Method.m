//
//  Method.m
//  ArchiverPrj
//
//  Created by yb.xing on 2018/1/4.
//  Copyright © 2018年 yb.xing. All rights reserved.
//

#import "Method.h"

@implementation Method

+ (NSString *)getArchiverPath:(Class)cls
{
    return NSStringFromClass(cls);
}

+ (void)archiverObject:(id)obj
{
    NSString *foldPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [foldPath stringByAppendingPathComponent:[self getArchiverPath:[obj class]]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    BOOL ret = [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
    if (ret)
    {
        NSLog(@"序列化成功");
    }
    else
    {
        NSLog(@"序列化失败:%@",obj);
    }
}

+ (id)unArchiverObject:(Class)cls
{
    NSString *foldPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [foldPath stringByAppendingPathComponent:[self getArchiverPath:cls]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    return [[cls alloc] init];
}

+ (void)archiverObjects:(NSArray *)arr
{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    __block NSString *clsStr = nil;
    for (NSInteger i=0; i<[arr count]; i++)
    {
        id obj = arr[i];
        if (i == 0)
        {
            clsStr = [self getArchiverPath:[obj class]];
        }
        NSString *key = [NSString stringWithFormat:@"%@%ld",clsStr,(long)i];
        [archiver encodeObject:obj forKey:key];
    }
    [archiver finishEncoding];
    NSString *foldPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [foldPath stringByAppendingPathComponent:clsStr];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    [data writeToFile:filePath atomically:YES];
}

+ (NSArray *)unArchiverObjects:(Class)cls
{
    NSString *foldPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [foldPath stringByAppendingPathComponent:[self getArchiverPath:cls]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        NSMutableArray *tmpArray = [NSMutableArray array];
        int i=0;
        NSString *key = [NSString stringWithFormat:@"%@%d",[self getArchiverPath:cls],i];
        while ([unArchiver decodeObjectForKey:key])
        {
            [tmpArray addObject:[unArchiver decodeObjectForKey:key]];
            ++i;
            key = [NSString stringWithFormat:@"%@%d",[self getArchiverPath:cls],i];
        }
        [unArchiver finishDecoding];
        return tmpArray;
    }
    return [NSArray array];
}

+ (void)removeArchiver:(Class)cls
{
    NSString *foldPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [foldPath stringByAppendingPathComponent:[self getArchiverPath:cls]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}
@end
