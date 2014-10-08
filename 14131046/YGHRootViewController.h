//
//  YGHRootViewController.h
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHModle.h"
#import <QuartzCore/QuartzCore.h>
@interface YGHRootViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Account;
- (IBAction)Accountaction:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)Passwordaction:(UITextField *)sender;
@property(strong,nonatomic) YGHModle * Dic;
- (IBAction)singin:(UIButton *)sender;
@property(strong,nonatomic)UIAlertView *vie;
@end
