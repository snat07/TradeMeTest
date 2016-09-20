//
//  ItemPhoto.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface ItemPhotoModel : JSONModel

@property (nonatomic) int                  key;
@property (nonatomic, strong) NSDictionary *value;

@end
