//
//  RefreshWebView.h
//  
//
//  Created by gelosie.wang@gmail.com on 12-10-24.
//  Copyright (c) 2012年 zhenian.com . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PullToRefreshView.h"

@interface RefreshWebView : UIWebView <PullToRefreshViewDelegate>

@property(nonatomic, retain, readonly) UIScrollView* currentScrollView;
@property(nonatomic, retain, readonly) PullToRefreshView *refresh;

- (void)finishedLoading;
- (void)beginLoading;
- (void)setStatusLabelText:(NSString *)text;

@end

