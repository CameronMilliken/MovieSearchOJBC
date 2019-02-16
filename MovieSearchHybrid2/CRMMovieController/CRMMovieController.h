//
//  CRMMovieController.h
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMMovie.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMMovieController : NSObject

+ (void)fetchMovieWithName: (NSString *)name completion: (void (^)(NSArray<CRMMovie *>* _Nullable movies))completion;

+ (void)fetchImageWithMovie: (CRMMovie *)movie
                completion: (void (^)(UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
