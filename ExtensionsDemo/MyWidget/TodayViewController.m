//
//  TodayViewController.m
//  MyWidget
//
//  Created by clee on 14-7-8.
//  Copyright (c) 2014年 clee. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

static NSString * const kSuitName = @"group.lixiang";

@interface TodayViewController () <NCWidgetProviding, UIContentContainer>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = CGSizeMake(320, 100);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self readSharedDataFromUserdefaults];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Action:(UIButton *)sender {
    [sender setTitle:@"设置" forState:UIControlStateNormal];
//    [self.extensionContext openURL:[NSURL URLWithString:@"demo123://1"] completionHandler:^(BOOL success) {
//        NSLog(@"%d", success);
//    }];
}

- (IBAction)button2Action:(id)sender {
    [sender setTitle:@"设置" forState:UIControlStateNormal];

//    [self.extensionContext openURL:[NSURL URLWithString:@"demo123://2"] completionHandler:^(BOOL success) {
//        NSLog(@"%d", success);
//    }];
}

- (IBAction)button3Action:(id)sender {
    [sender setTitle:@"设置" forState:UIControlStateNormal];
//    [self.extensionContext openURL:[NSURL URLWithString:@"demo123://3"] completionHandler:^(BOOL success) {
//        NSLog(@"%d", success);
//    }];
}

- (IBAction)openAction:(id)sender {
    [self.extensionContext openURL:[NSURL URLWithString:@"demo123://x=aaa"] completionHandler:^(BOOL success) {
        
    }];
}

- (void)readSharedDataFromUserdefaults {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:kSuitName];
    NSString *content = [userDefaults objectForKey:@"content"];
    if (content) {
//        self.lblContent.text = content;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

// Widgets wishing to customize the default margin insets can return their preferred values.
// Widgets that choose not to implement this method will receive the default margin insets.
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    NSLog(@"NSStringFromUIEdgeInsets(defaultMarginInsets:%@", NSStringFromUIEdgeInsets(defaultMarginInsets));
    return UIEdgeInsetsMake(0, 0, 0, 0);
    //return defaultMarginInsets;
}

@end
