//
//  YGHEditViewController.h
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHPerson.h"
#import "YGHEdit.h"
@interface YGHEditViewController : UIViewController
@property(nonatomic,strong)YGHPerson *person;
@property (nonatomic,assign)NSUInteger section;
@property(nonatomic,assign)NSUInteger row;
@property(nonatomic,strong)id<YGHEdit>delegate;
@property (weak, nonatomic) IBOutlet UITextField *account;
- (IBAction)agekey:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIStepper *agekey;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@end
