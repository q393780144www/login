//
//  YGHModle.h
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGHModle : NSObject
{
    NSMutableDictionary *_dic;
    NSMutableString *_path;
    NSString *_pah1;
}
@property (strong,nonatomic) NSMutableDictionary *dic;
@property (strong,nonatomic) NSString *path;
@property (strong,nonatomic) NSString *path1;
@property(strong,nonatomic) NSMutableArray *man;
@property(strong,nonatomic) NSMutableArray *woman;
+(YGHModle *)creatdelegate;
@end
