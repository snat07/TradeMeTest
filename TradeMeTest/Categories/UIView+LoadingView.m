//
//  UIView+LoadingView.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 18/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "UIView+LoadingView.h"
#import <objc/runtime.h>


@implementation UIView (LoadingView)

- (void) showLoadingView{
    if (!self.isDisplaying) {
    
        self.isDisplaying = YES;
        self.loadingView = [[UIView alloc] initWithFrame:self.frame];
        [self.loadingView setBackgroundColor:[[UIColor darkGrayColor] colorWithAlphaComponent:0.75]];
        self.loadingLabel = [[UILabel alloc] init];
        self.loadingLabel.text = @"Loading";
        self.loadingLabel.textColor = [UIColor whiteColor];
        CGRect frame = CGRectMake(self.frame.size.width/2 - 40, self.frame.size.height/2 - 30, 80, 40);
        self.loadingLabel.frame = frame;
        self.spinner = [[UIActivityIndicatorView alloc] init];
        self.spinner.frame = CGRectMake(self.frame.size.width/2 - 10, self.frame.size.height/2, 20, 20);
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        [self.spinner startAnimating];
        [self.loadingView addSubview:self.loadingLabel];
        [self.loadingView addSubview:self.spinner];
        [self addSubview:self.loadingView];
    }
    
}
- (void) hideLoadingView{
    if (self.isDisplaying) {
        self.isDisplaying = NO;
        [self.spinner stopAnimating];
        [self.loadingView removeFromSuperview];
    }
}

- (void)setLoadingView:(UIView *)loadingView {
    objc_setAssociatedObject(self, @"loadingView", loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)loadingView {
    return objc_getAssociatedObject(self, @"loadingView");
}

- (void)setSpinner:(UIActivityIndicatorView *)spinner {
    objc_setAssociatedObject(self, @"spinner", spinner, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIActivityIndicatorView *)spinner {
    return objc_getAssociatedObject(self, @"spinner");
}


- (void)setLoadingLabel:(UILabel *)loadingLabel {
    objc_setAssociatedObject(self, @"loadingLabel", loadingLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)loadingLabel {
    return objc_getAssociatedObject(self, @"loadingLabel");
}


- (void) setIsDisplaying:(BOOL)isDisplaying
{
    NSNumber *number = [NSNumber numberWithBool: isDisplaying];
    objc_setAssociatedObject(self, @"isDisplaying", number , OBJC_ASSOCIATION_RETAIN);
}

- (BOOL) isDisplaying
{
    NSNumber *number = objc_getAssociatedObject(self, @"isDisplaying");
    return [number boolValue];
}

@end
