//
//  YGHEdit.h
//  14131046
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGHPerson.h"
@protocol YGHEdit <NSObject>
-(void)setperson:(YGHPerson *)person with:(NSUInteger)section withrow:(NSUInteger)row;
@end
