//
//  RefreshWebView.m
//  
//
//  Created by gelosie.wang@gmail.com on 12-10-24.
//  Copyright (c) 2012年 zhenian.com . All rights reserved.
//

#import "RefreshWebView.h"

//- (void) initRefresh;
@interface RefreshWebView(PrivateRefreshWebView)
    -(void)setRefresh;
@end

@implementation RefreshWebView
@synthesize currentScrollView;
@synthesize refresh;

-(id) init{
    self = [super init];
    if (self) {
        [self setRefresh];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setRefresh];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setRefresh];
    }
    return self;
}

-(void)setRefresh
{
    for (UIView* subView in self.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            currentScrollView = (UIScrollView *)subView;
            currentScrollView.delegate = (id) self;
        }
    }
    
    refresh = [[PullToRefreshView alloc] initWithScrollView:currentScrollView atBottom:NO];
    
    [refresh setDelegate:(id)self];
    [currentScrollView addSubview:refresh];
}

-(void)dealloc
{
    currentScrollView = nil;
    if (refresh!= nil) {
        [refresh containingViewDidUnload];
    }
    refresh = nil;
}

- (void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view{
    [self reload];
}
/*
- (NSDate *)pullToRefreshViewLastUpdated:(PullToRefreshView *)view{
    
}
*/

- (void)beginLoading
{
    if (refresh != nil) {
        [refresh beginLoading];
    }
}
- (void)setStatusLabelText:(NSString *)text
{
    if (refresh != nil) {
        [refresh setStatusLabelText:text];
    }
}
- (void)finishedLoading
{
    if (refresh != nil) {
        [refresh finishedLoading];
    }
}
@end
