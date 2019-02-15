//
//  CRMMovie.m
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMMovie.h"

@implementation CRMMovie

// Initialize
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        // Values from the JSON
        _title = dictionary[@"title"];
        _rating = [dictionary[@"vote_average"] integerValue];
        _overview = dictionary[@"overview"];
        _moviePoster = dictionary[@"poster_path"];
        
    }
    return self;
    
}
@end
