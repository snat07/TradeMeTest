//
//  NetworkManager.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

static NSString *const kOauthConsumerKey = @"oauth_consumer_key";
static NSString *const kOauthConsumerSecret = @"oauth_signature";
static NSString *const kOauthConsumerKeyValue = @"A1AC63F0332A131A78FAC304D007E7D1";
static NSString *const kOauthConsumerSecretValue = @"EC7F18B17A062962C6930A8AE88B16C7";
static NSString *const kBaseUrl = @"https://api.tmsandbox.co.nz/v1";
static NSString *const kAuthorization = @"&oauth_consumer_key=A1AC63F0332A131A78FAC304D007E7D1&oauth_signature_method=PLAINTEXT&oauth_signature=EC7F18B17A062962C6930A8AE88B16C7%26";


@interface NetworkManager()

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation NetworkManager

+ (instancetype)sharedInstance {
    
    static NetworkManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.manager = [AFHTTPRequestOperationManager manager];

    });
    return sharedInstance;
}

- (void)fetchCategoryWithNumnber:(NSString *)number
                          succes:(CategoryModelSuccess)success
                         failure:(ModelFailure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/Categories/%@.json?depth=1&with_counts=true", kBaseUrl, number];
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        CategoryModel *category = [[CategoryModel alloc] initWithDictionary:responseObject error:&error];
        if (category) {
            success(category);
        } else {
            failure(error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
}

- (void)fetchSearchWithSearchWord:(NSString *)searchString
                    categoryNumber:(NSString *)categoryNumber
                           succes:(SearchModelSuccess)success
                          failure:(ModelFailure)failure
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/Search/General.json?category=%@&expired=false&photo_size=Thumbnail&return_metadata=false&search_string=%@%@", kBaseUrl, categoryNumber, searchString, kAuthorization];
    
    [self.manager.requestSerializer setValue:kOauthConsumerKey forHTTPHeaderField:kOauthConsumerKeyValue];
    [self.manager.requestSerializer setValue:kOauthConsumerSecret forHTTPHeaderField:kOauthConsumerSecretValue];
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        SearchModel *search = [[SearchModel alloc] initWithDictionary:responseObject error:&error];
        if(search){
            success(search);
        } else{
            failure(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)fetchSearchWithCategoryNumber:(NSString *)categoryNumber
                           succes:(SearchModelSuccess)success
                          failure:(ModelFailure)failure
{
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@/Search/General.json?category=%@&expired=false&photo_size=Thumbnail&return_metadata=false%@", kBaseUrl, categoryNumber, kAuthorization];
    
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        SearchModel *search = [[SearchModel alloc] initWithDictionary:responseObject error:&error];
        if(search){
            success(search);
        } else{
            failure(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)fetchItemDetailWithListingId:(int)listingId
                              succes:(ItemDetailModelSuccess)success
                             failure:(ModelFailure)failure{
    NSString *urlString = [NSString stringWithFormat:@"%@/Listings/%d.json?increment_view_count=false&return_member_profile=false%@", kBaseUrl, listingId, kAuthorization];
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        ItemDetailModel *item = [[ItemDetailModel alloc] initWithDictionary:responseObject error:&error];
        if(item){
            success(item);
        } else{
            failure(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
}

@end
