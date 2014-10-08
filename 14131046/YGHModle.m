//
//  YGHModle.m
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHModle.h"
static YGHModle *delegate;
@implementation YGHModle
+(YGHModle *)creatdelegate
{      if(delegate==nil)
{
    delegate=[[YGHModle alloc]init];
    delegate.man=[[NSMutableArray alloc]init];
    delegate.woman=[[NSMutableArray alloc]init];
    NSBundle *bundle=[[NSBundle mainBundle]init];
    NSString *st=[bundle pathForResource:@"key.plist" ofType:nil];
    
    delegate.path=[NSMutableString stringWithString:st];
    delegate.dic=[NSMutableDictionary dictionaryWithContentsOfFile:delegate.path];
    delegate.path1=[NSString stringWithString:delegate.path];
}
    return delegate;
    
}

@end
