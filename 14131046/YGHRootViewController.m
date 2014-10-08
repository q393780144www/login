//
//  YGHRootViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHRootViewController.h"
#import "YGHRegisterViewController.h"
#import "YGHModle.h"
#import "YGHDetialViewController.h"
#import "YGHPhotoViewController.h"

@interface YGHRootViewController ()<UIAlertViewDelegate>
{
    NSUInteger i;
}
@end

@implementation YGHRootViewController

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
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.title=@"登陆";
    //self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
   _Dic=[YGHModle creatdelegate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    [bu setTitle:@"注册" forState:UIControlStateNormal];
    bu.frame=CGRectMake(0, 0, 40, 40);
    [bu addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:bu];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd:)];
    self.view.userInteractionEnabled=YES;
    [self.view addGestureRecognizer:tap];
    _vie.delegate=self;
    // Do any additional setup after loading the view from its nib.
}
-(void)hidd:(UITapGestureRecognizer *)ges
{
    [self.view endEditing:YES];
}
-(void)go:(UIButton *)bu
{
    YGHRegisterViewController *registe=[[YGHRegisterViewController alloc]init];
        registe.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:registe animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Accountaction:(UITextField *)sender {
    [_Account resignFirstResponder];
}
- (IBAction)Passwordaction:(UITextField *)sender {
     [_Password resignFirstResponder];
}

- (IBAction)singin:(UIButton *)sender {
    
    NSMutableDictionary *dic2=_Dic.dic;
    if([dic2[_Account.text] isEqualToString:_Password.text])
    {
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"登陆成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        i=1;
        [_vie show];
        
      
    }
    else
    {
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"密码或账号不对请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_vie show];
    }
    

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{    if(i==1)
{   i=0;
    UITabBarController *tab=[[UITabBarController alloc]init];
    YGHDetialViewController *detial=[[YGHDetialViewController alloc]init];
   
    YGHPhotoViewController *photo=[[YGHPhotoViewController alloc]init];
    UINavigationController *mvc=[[UINavigationController alloc]initWithRootViewController:detial];
     UINavigationController *mvc1=[[UINavigationController alloc]initWithRootViewController:photo];
    tab.viewControllers=@[mvc,mvc1];
    
    
    [self.navigationController pushViewController:tab animated:YES];}
}

@end
