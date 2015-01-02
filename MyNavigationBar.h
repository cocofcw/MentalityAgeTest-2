//
//  MyNavigationBar.h
//  意林News
//
//  Created by Michelle on 14-3-3.
//  Copyright (c) 2014年 Micheal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftBtn.h"
#import "RightBtn.h"
@interface MyNavigationBar : UIView

- (void)createNavigationBarWithImage:(NSString *)name andSEL:(SEL)sel1 andsecsel:(SEL)sel2 andClass:(id)classObject;
@end
