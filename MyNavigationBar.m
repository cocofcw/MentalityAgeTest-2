//
//  MyNavigationBar.m
//  意林News
//
//  Created by Michelle on 14-3-3.
//  Copyright (c) 2014年 Micheal. All rights reserved.
//

#import "MyNavigationBar.h"
#import "LeftBtn.h"
#import "RightBtn.h"
#import "Title.h"
@implementation MyNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)createNavigationBarWithImage:(NSString *)name andSEL:(SEL)sel1 andsecsel:(SEL)sel2 andClass:(id)classObject
{
   

         LeftBtn * left=[[LeftBtn alloc]initWithFrame:CGRectMake(0, 2, 110, 64)];
        [left addTarget:classObject action:sel1 forControlEvents:UIControlEventTouchUpInside];
    left.selected=!left.selected;
        [self addSubview:left];
    
         RightBtn * right=[[RightBtn alloc]initWithFrame:CGRectMake(210, 2, 110, 64)];
    [right addTarget:classObject action:sel2 forControlEvents:UIControlEventTouchUpInside];
    right.selected=!right.selected;
         [self addSubview:right];
//    Title * tlt=[[Title alloc]initWithFrame:CGRectMake(-40, -10, 150, 64)];
//    [self addSubview:tlt];
  
}


@end
