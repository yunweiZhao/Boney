//
//  MyViewCellModel.m
//  一个购物的app
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "MyViewCellModel.h"

@implementation MyViewCellModel
+(instancetype)myViewcellFromDictionary:(NSDictionary *)dic{
    MyViewCellModel *model = [MyViewCellModel new];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"键值不匹配");
}
@end
