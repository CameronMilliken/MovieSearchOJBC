//
//  CRMMovieController.m
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMMovieController.h"

@implementation CRMMovieController

//
+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://api.themoviedb.org/3"];
}

// Fetch Movie Func 🎞
+ (void)fetchMovieWithName:(NSString *)name completion:(void (^)(NSArray<CRMMovie *> * _Nullable))completion
{
    // Construct the URL
    NSURL *url = [[[CRMMovieController baseUrl] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL: url resolvingAgainstBaseURL: YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:@"489bccaf8fb57e5067f198ec748fa301"], [NSURLQueryItem queryItemWithName:@"query" value:name]];
    NSURL *finalUrl = urlComponents.URL;
    
    //DataTask
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"Can't fetch Data");
            completion(nil);
            return;
        }
        //Serialize the JSON 🥣
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *moviesArray = [NSMutableArray new];
        for(NSDictionary *movieDicationary in resultsArray)
        {
            CRMMovie *movie = [[CRMMovie alloc] initWithDictionary: movieDicationary];
            [moviesArray addObject:movie];
            
        }
        completion(moviesArray);
    }]resume];
}

// Fetch the Movie Image Func 📸
+ (void)fetchImageWithMovie:(CRMMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    // Image URL
    NSString *url = [NSString stringWithFormat: @"%s%@", "https://image.tmdb.org/t/p/w500", movie.moviePoster];
    NSURL *imageUrl = [[NSURL alloc] initWithString:url];
    if (!imageUrl)
    {
        completion(nil);
        return;
    }
    
    //DataTask
    [[[NSURLSession sharedSession] dataTaskWithURL: imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (image) {
            completion(image);
        } else {
            NSLog(@"Couldn't turn data into image");
            completion(nil);
        }
    }]resume];
}

@end
