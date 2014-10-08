//
//  YGHRegisterViewController.h
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHModle.h"
@interface YGHRegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *Scroll;

- (IBAction)back:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *password1;
@property (weak, nonatomic) IBOutlet UIStepper *agestep;
@property (weak, nonatomic) IBOutlet UILabel *agevalue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
- (IBAction)registers:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *tele;
- (IBAction)agestep:(UIStepper *)sender;
@property(strong,nonatomic)UIAlertView *vie;
- (IBAction)password:(UITextField *)sender;
- (IBAction)tel:(UITextField *)sender;
@property(strong,nonatomic) YGHModle * Dic;
- (IBAction)Account:(UITextField *)sender;
- (IBAction)password1:(UITextField *)sender;
@end
