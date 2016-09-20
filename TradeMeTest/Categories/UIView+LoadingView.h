//
//  UIView+LoadingView.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 18/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LoadingView)

@property(nonatomic, strong) UIView *loadingView;
@property(nonatomic, strong) UIActivityIndicatorView *spinner;
@property(nonatomic, strong) UILabel *loadingLabel;
@property(nonatomic)         BOOL isDisplaying;

- (void) showLoadingView;
- (void) hideLoadingView;

@end
