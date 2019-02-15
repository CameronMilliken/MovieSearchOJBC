//
//  CRMMovie.h
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMMovie : NSObject

// Properties
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, readonly) NSString *overview;
@property (nonatomic, readonly, nullable) NSString *moviePoster;

// Initialize
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
