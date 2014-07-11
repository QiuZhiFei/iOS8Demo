//
//  ViewController.m
//  ExtensionsDemo
//
//  Created by clee on 14-7-8.
//  Copyright (c) 2014年 clee. All rights reserved.
//

#import "ViewController.h"
#import <NotificationCenter/NotificationCenter.h>

static NSString * const kSuitName = @"group.lixiang";

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"++++++++++++++++++++++++viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserverForName:@"change"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      NSString *ss = [note object];
                                                      if ([ss isEqualToString:@"1"]) {
                                                          self.tfContent.text = @"轻相机";
                                                      } else if ([ss isEqualToString:@"2"]) {
                                                          self.tfContent.text = @"情景相机";
                                                      } else if ([ss isEqualToString:@"3"]) {
                                                          self.tfContent.text = @"证件照";
                                                      } else {
                                                          self.tfContent.text = @"";
                                                      }
                                                  }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)confirmAction:(id)sender {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:kSuitName];
    [userDefaults setObject:self.tfContent.text forKey:@"content"];
    [userDefaults synchronize];
}

- (IBAction)changed:(UISwitch *)sender {
    if (sender.isOn) {
        [[NCWidgetController widgetController] setHasContent:YES forWidgetWithBundleIdentifier:@"com.lixiang.ExtensionsDemo.MyWidget"];
    } else {
        [[NCWidgetController widgetController] setHasContent:NO forWidgetWithBundleIdentifier:@"com.lixiang.ExtensionsDemo.MyWidget"];
    }
}

@end
