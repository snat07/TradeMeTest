//
//  SearchResultModel.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface FoundItemModel : JSONModel

@property (nonatomic) int                                   listingId;
@property (nonatomic, strong) NSString                      *title;
@property (nonatomic, strong) NSString                      *category;
@property (nonatomic) int                                   startPrice;
@property (nonatomic) int                                   buyNowPrice;
@property (nonatomic, strong) NSDate                        *startDate;
@property (nonatomic, strong) NSDate                        *endDate;
@property (nonatomic) BOOL                                  isBold;
@property (nonatomic, strong) NSString                      *categoryPath;
@property (nonatomic, strong) NSString<Optional>            *pictureHref;
@property (nonatomic, strong) NSString                      *region;
@property (nonatomic, strong) NSString                      *suburb;
@property (nonatomic) BOOL                                  hasBuyNow;
@property (nonatomic, strong) NSString<Optional>            *subtitle;
@property (nonatomic, strong) NSString                      *priceDisplay;

@end
