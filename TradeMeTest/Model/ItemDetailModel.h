//
//  ItemDetailModel.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol ItemPhotoModel;

@interface ItemDetailModel : JSONModel

@property (nonatomic) int                                   listingId;
@property (nonatomic, strong) NSString                      *title;
@property (nonatomic, strong) NSString                      *category;
@property (nonatomic) int                                   startPrice;
@property (nonatomic) int                                   buyNowPrice;
@property (nonatomic, strong) NSDate                        *startDate;
@property (nonatomic, strong) NSDate                        *endDate;
@property (nonatomic, strong) NSString                      *categoryPath;
@property (nonatomic, strong) NSString                      *suburb;
@property (nonatomic, strong) NSString                      *priceDisplay;
@property (nonatomic) BOOL                                  hasBuyNow;
@property (nonatomic, strong) NSString                      *memberNickname;
@property (nonatomic, strong) NSString                      *body;
@property (nonatomic, strong) NSArray<ItemPhotoModel>       *photos;


@end
