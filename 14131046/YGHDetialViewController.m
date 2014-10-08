//
//  YGHDetialViewController.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHDetialViewController.h"
#import "YGHModle.h"
#import "YGHCustomTableViewCell.h"
#import "YGHPerson.h"
#import "YGHEditViewController.h"
@interface YGHDetialViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray *man;
@property(nonatomic,strong) NSMutableArray *woman;
@property(nonatomic,strong) UITableView *table;
@end

@implementation YGHDetialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.tabBarItem.image=[UIImage imageNamed:@"yuan.png"];
       self.tabBarItem.title=@"员工信息";
        // Custom initialization
    }
    return self;
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [_table setEditing:editing animated:YES];
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.tabBarController.navigationController.navigationBarHidden=YES;
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake(0, 0, 100, 40);
    [but setTitle:@"登陆" forState:UIControlStateNormal];
    //but.backgroundColor=[UIColor redColor];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *bua=[[UIBarButtonItem alloc]initWithCustomView:but];
    [but addTarget:self action:@selector(backroot:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=bua;
     self.navigationItem.rightBarButtonItem=self.editButtonItem;
    self.navigationItem.title=@"员工列表";
    self.tabBarController.tabBarItem.title=@"员工信息";
    
    _Dic=[YGHModle creatdelegate];
    _man=[NSMutableArray arrayWithArray:_Dic.man];
    _woman=[NSMutableArray arrayWithArray:_Dic.woman];
    [_table reloadData];
    
}
-(void)backroot:(UIButton *)bu
{
    [self.navigationController.tabBarController.navigationController popToRootViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [_table registerNib:[UINib nibWithNibName:@"YGHCustomTableViewCell" bundle:nil]  forCellReuseIdentifier:@"cell"];
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
    // Do any additional setup after loading the view from its nib.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  77;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
        return _man.count;
    else
        return _woman.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return @"男员工";
    else
        return @"女员工";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGHCustomTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
      if(indexPath.section==0)
      {  YGHPerson *peson=_man[indexPath.row];
          cell.account.text=peson.account;
          cell.password.text=peson.password;
          cell.age.text=[NSString stringWithFormat:@"%d",peson.age];
          cell.sex.text=peson.sex;
          cell.tel.text=peson.tel;
          cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          return cell;
      }
    else
    {
        YGHPerson *peson=_woman[indexPath.row];
        cell.account.text=peson.account;
        cell.password.text=peson.password;
        cell.age.text=[NSString stringWithFormat:@"%d",peson.age];
        cell.sex.text=peson.sex;
        cell.tel.text=peson.tel;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    YGHEditViewController *edit=[[YGHEditViewController alloc]init];
    if(indexPath.section==0)
    {edit.person=(YGHPerson *)_man[indexPath.row];
    edit.section=(NSUInteger )indexPath.section;
        edit.row=(NSUInteger )indexPath.row;
        edit.delegate=self;}
    else
    {edit.person=(YGHPerson *)_woman[indexPath.row];
        edit.section=(NSUInteger )indexPath.section;
        edit.row=(NSUInteger )indexPath.row;
    edit.delegate=self;}
    [self.navigationController pushViewController:edit animated:YES];
    
}
-(void)setperson:(YGHPerson *)person with:(NSUInteger)section withrow:(NSUInteger)row
{
    if(section==0)
      //[ _man replaceObjectAtIndex:row withObject:person];
    [_Dic.man replaceObjectAtIndex:row withObject:person];
    
    
    else
        [_Dic.woman replaceObjectAtIndex:row withObject:person];
        // [ _woman replaceObjectAtIndex:row withObject:person];
   

}
-(UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle)
    {
        case UITableViewCellEditingStyleDelete:
        {   if(indexPath.section==0)
             { NSMutableArray *ary=[NSMutableArray arrayWithArray:_man];
            [ary  removeObjectAtIndex:indexPath.row];
            [_man removeAllObjects];
            [_man addObjectsFromArray:ary];
            [_table reloadData];
        
             }
            else
            {
                NSMutableArray *ary=[NSMutableArray arrayWithArray:_woman];
                [ary  removeObjectAtIndex:indexPath.row];
                [_woman removeAllObjects];
                [_woman addObjectsFromArray:ary];
                [_table reloadData];
            }
         }
            break;
    
        default:
            break;
    }
}
    


    
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
