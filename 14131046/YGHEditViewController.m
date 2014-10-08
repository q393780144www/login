//
//  YGHEditViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHEditViewController.h"
#import "YGHPerson.h"
@interface YGHEditViewController ()

@end
NSArray *ary;
@implementation YGHEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}
-(void)gai
{
    YGHPerson *person=[[YGHPerson alloc]init];
    person.account=_account.text;
    person.password=_password.text;
    person.tel=_tel.text;
    person.age=_agekey.value;
    person.sex=ary[_sex.selectedSegmentIndex];
    
    [_delegate setperson:person with:_section withrow:_row];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    bu.frame=CGRectMake(0, 0, 100, 40);
    [bu setTitle:@"确认修改" forState:UIControlStateNormal];
    [bu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(gai) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:bu];
    
    _account.text=_person.account;
    _password.text=_person.account;
    _tel.text=_person.tel;
    _age.text=[NSString stringWithFormat:@"%d",_person.age];
    _agekey.value=_person.age;
    if([_person.sex isEqualToString:@"男"])
        _sex.selectedSegmentIndex =0;
    else
        _sex.selectedSegmentIndex=1;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    ary=@[@"男",@"女"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)agekey:(UIStepper *)sender {
    _age.text=[NSString stringWithFormat:@"%d",(int)sender.value];
}
@end
