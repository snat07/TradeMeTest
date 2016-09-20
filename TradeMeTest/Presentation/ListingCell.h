//
//  ListingCell.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundItemModel.h"

@interface ListingCell : UITableViewCell

-(void) initWithFoundItem:(FoundItemModel *)foundItem;

@end
