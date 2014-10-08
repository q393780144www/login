//
//  YGHPhotoViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHPhotoViewController.h"
#import "YGHDetailphontViewController.h"

@interface YGHPhotoViewController ()

@end

@implementation YGHPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image=[UIImage imageNamed:@"ph.png"];
        self.tabBarItem.title=@"相册信息";
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
     self.navigationController.tabBarController.navigationController.navigationBarHidden=YES;
    self.navigationItem.title=@"相册信息";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    for (NSUInteger i=0; i<16; i++) {
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoom:)];
        UIImageView *vie=[[UIImageView alloc]initWithFrame:CGRectMake((i%4)*75+5, (i/4)*80+100, 75, 75)];
        vie.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        vie.userInteractionEnabled=YES;
        [vie addGestureRecognizer:tap];
        vie.tag=i;
        [self.view addSubview:vie];
        
    }
    // Do any additional setup after loading the view.
}
-(void)zoom:(UITapGestureRecognizer *)tap
{
    YGHDetailphontViewController *ph=[[YGHDetailphontViewController alloc]init];
    ph.i=tap.view.tag;
    [self.navigationController pushViewController:ph animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
