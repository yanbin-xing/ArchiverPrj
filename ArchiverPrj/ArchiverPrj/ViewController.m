//
//  ViewController.m
//  ArchiverPrj
//
//  Created by yb.xing on 2018/1/4.
//  Copyright © 2018年 yb.xing. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"
#import "Method.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)singleStore:(id)sender
{
    UserInfo *usr = [[UserInfo alloc] init];
    usr.userID = @"1";
    [Method archiverObject:usr];
}

- (IBAction)singleRead:(id)sender
{
    UserInfo *usr = [Method unArchiverObject:[UserInfo class]];
    NSLog(@"usr:%@",usr.description);
}

- (IBAction)arrStore:(id)sender
{
    UserInfo *usr = [[UserInfo alloc] init];
    usr.userID = @"2";
    
    UserInfo *usr1 = [[UserInfo alloc] init];
    usr1.userID = @"3";
    
    UserInfo *usr2 = [[UserInfo alloc] init];
    usr2.userID = @"4";
    [Method archiverObjects:@[usr,usr1,usr2]];
}

- (IBAction)arrRead:(id)sender
{
    NSArray *usrs = [Method unArchiverObjects:[UserInfo class]];
    for (UserInfo *usr in usrs)
    {
        NSLog(@"usr:%@",usr);
    }
}

- (IBAction)clearArchiver:(id)sender
{
    [Method removeArchiver:[UserInfo class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
