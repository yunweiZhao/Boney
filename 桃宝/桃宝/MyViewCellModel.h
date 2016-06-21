//
//  MyViewCellModel.h
//  一个购物的app
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyViewCellModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *image;
@property (nonatomic,copy)NSString *rightImage;
+(instancetype)myViewcellFromDictionary:(NSDictionary *)dic;
@end
