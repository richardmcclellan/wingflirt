//
//  BaseViewController.h
//  Forecast
//
//  Created by Richard McClellan on 6/28/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewDelegate.h"
@interface BaseViewController : UIViewController <BaseViewDelegate>

@property (nonatomic, assign) BOOL adjustViewWithKeyboard;

@end
