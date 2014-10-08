//
//  YGHRegisterViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHRegisterViewController.h"
#import "YGHModle.h"
#import "YGHPerson.h"
@interface YGHRegisterViewController ()
{
    NSArray *sex;
}
@end

@implementation YGHRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
     _Dic = [YGHModle creatdelegate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    sex=@[@"男",@"女"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyshow:) name:UIKeyboardWillShowNotification object:nil];
    _Scroll.contentSize=CGSizeMake(320, 480*2);
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd:)];
    self.view.userInteractionEnabled=YES;
    [self.view addGestureRecognizer:tap];
   
    // Do any additional setup after loading the view from its nib.
}
-(void)hidd:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.25f animations:^{
        _Scroll.contentOffset=CGPointMake(0, 0);
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)keyshow:(NSNotification *)info
{
   if( [_tele isFirstResponder])
   {   [UIView animateWithDuration:0.25f animations:^{
       _Scroll.contentOffset=CGPointMake(0, _tele.frame.origin.y+_tele.frame.size.height-60);
   }];
       
   }
    
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)registers:(UIButton *)sender {
    if([_password.text isEqualToString:_password1.text])
    {
        NSString *account=_Account.text;
        NSString *password=_password1.text;
        [_Dic.dic setValue:password forKey:account];
        if([_Dic.dic writeToFile:_Dic.path1 atomically:YES])
            NSLog(@"success");
        else
            NSLog(@"fail");
        YGHPerson *person=[[YGHPerson alloc]init];
        person.account=_Account.text;
        person.password=_password1.text;
        person.sex=sex[_sex.selectedSegmentIndex];
        person.age=_agestep.value;
        person.tel=_tele.text;
        if(_sex.selectedSegmentIndex==0)
        {
            [_Dic.man addObject:person];
        }
        else
        {
            [_Dic.woman addObject:person];
        }
        
        
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"注册成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_vie show];
    }
    else
    {
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"密码不相同请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_vie show];
        
    }

    
}
- (IBAction)agestep:(UIStepper *)sender {
    _agevalue.text=[NSString stringWithFormat:@"%d",(int)sender.value];
    
}
- (IBAction)Account:(UITextField *)sender {
    [self.view endEditing:YES];
}

- (IBAction)password1:(UITextField *)sender {
    [self.view endEditing:YES];

}
- (IBAction)password:(UITextField *)sender {
    [self.view endEditing:YES];

}

- (IBAction)tel:(UITextField *)sender {
    [self.view endEditing:YES];

}
@end
