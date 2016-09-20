//
//  NetworkManager.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchModel.h"
#import "CategoryModel.h"
#import "ItemDetailModel.h"

typedef void (^SearchModelSuccess)(SearchModel *searchModel);
typedef void (^CategoryModelSuccess)(CategoryModel *categoryModel);
typedef void (^ItemDetailModelSuccess)(ItemDetailModel *itemDetailModel);
typedef void (^ModelFailure)(NSError *error);
@interface NetworkManager : NSObject

+ (instancetype)sharedInstance;

- (void)fetchCategoryWithNumnber:(NSString *)number
                          succes:(CategoryModelSuccess)success
                         failure:(ModelFailure)failure;

- (void)fetchSearchWithSearchWord:(NSString *)searchString
                   categoryNumber:(NSString *)categoryNumber
                          succes:(SearchModelSuccess)success
                         failure:(ModelFailure)failure;

- (void)fetchSearchWithCategoryNumber:(NSString *)categoryNumber
                               succes:(SearchModelSuccess)success
                              failure:(ModelFailure)failure;

- (void)fetchItemDetailWithListingId:(int)listingId
                           succes:(ItemDetailModelSuccess)success
                          failure:(ModelFailure)failure;
@end
