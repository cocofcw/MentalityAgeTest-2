//
//  Quest.h
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quest : NSObject
@property(nonatomic,retain)NSString * content;
@property(nonatomic,assign)NSString * core;

- (id)initWithContent:(NSString*)content core:(NSString*)core;
@end
