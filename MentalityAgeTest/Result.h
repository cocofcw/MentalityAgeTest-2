//
//  Result.h
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
#import "AppDelegate.h"
@interface Result : UIViewController<UMSocialDataDelegate,UMSocialUIDelegate>

{
    AppDelegate * _appdelegate;
}
@property(nonatomic,assign)int myCore;
@end
