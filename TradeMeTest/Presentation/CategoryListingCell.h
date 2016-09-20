//
//  CategoryListingCell.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundCategoryModel.h"

@interface CategoryListingCell : UITableViewCell

-(void) initWithFoundCategory:(FoundCategoryModel *)foundCategory;

@end
