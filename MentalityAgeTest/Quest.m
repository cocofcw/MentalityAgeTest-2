//
//  Quest.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Quest.h"

@implementation Quest
- (id)initWithContent:(NSString*)content core:(NSString*)core
{
    self=[super init];
    if (self) {
        self.content=content;
        self.core=core;
    }

    return self;
}
@end
