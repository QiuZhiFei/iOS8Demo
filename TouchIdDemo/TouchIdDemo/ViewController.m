//
//  ViewController.m
//  TouchIdDemo
//
//  Created by clee on 14-7-11.
//  Copyright (c) 2014年 clee. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"输密码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnAction:(id)sender {

    LAContext *context = [[LAContext alloc] init];
    NSError *err = nil;
    NSString *reason = @"需要验证";
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                             error:&err]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reason
                          reply:^(BOOL success, NSError *error) {
                              if (success) {
                                  NSLog(@"验证成功！");
                              } else {
                                  NSLog([error localizedDescription]);
                              }
                          }];
    } else {
        NSLog(@"该设备不支持TouchID");
    }
}

@end
