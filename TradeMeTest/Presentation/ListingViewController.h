//
//  ListingViewController.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
#import "SearchModel.h"

@interface ListingViewController : UIViewController

- (void)initWithCategory:(NSString *)categoryId;
- (void)initWithSearch:(NSString *)searchString;

@end
