//
//  YGHDetailphontViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHDetailphontViewController.h"

@interface YGHDetailphontViewController ()

@end
UIScrollView *view1;
@implementation YGHDetailphontViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    view1=[[UIScrollView alloc]initWithFrame:self.view.bounds];
   // view1.scrollEnabled=YES;
    view1.pagingEnabled=YES;
    view1.bounces=NO;
    view1.contentSize=CGSizeMake(320*16, 480);
    for (NSUInteger i=0; i<16; i++) {
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoom:)];
        UIImageView *vie=[[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 480)];
        vie.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        vie.userInteractionEnabled=YES;
        [vie addGestureRecognizer:tap];
        vie.tag=i;
        [view1 addSubview:vie];
        
    }
    [self.view addSubview:view1];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    view1.contentOffset=CGPointMake(_i*320, 0);
    
}
-(void)zoom:(UITapGestureRecognizer *)tap
{
    self.navigationController.navigationBarHidden=!self.navigationController.navigationBarHidden;
    UIView *vi=  self.tabBarController.view.subviews[1];
    vi.hidden=!vi.hidden;
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
