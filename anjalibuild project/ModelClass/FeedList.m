//
//  FeedList.m
//  BaseProject
//
//  Created by Sarvada Chauhan on 29/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "FeedList.h"
#import "Macro.h"
@implementation FeedList


//
//+ (id)sharedManager
//{
//    static id sharedManager;
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        sharedManager = [[self alloc] init];
//    });
//    return sharedManager;
//}


+(NSMutableArray *)getAllFeedItems:(NSArray *)tempArray{
    
    
    NSMutableArray  *localTempArray  = [[NSMutableArray alloc] init];
    
    for (NSDictionary  *tempDict  in tempArray) {
        
        FeedList  *objFeed = [[FeedList alloc] init];
        
             objFeed.userProfileImage = [tempDict objectForKey:@"user_image"];
            objFeed.userFullname = [tempDict objectForKey:@"user_name"];
//            objFeed.userLastname = [tempDict objectForKey:@"user_lastname"];
            objFeed.feedPostTime = [tempDict objectForKey:@"Time"];
            objFeed.feedBannerImageURL = [tempDict objectForKey:@"banner_image"];
            objFeed.feedDescription = [tempDict objectForKey:@"post_desc"];
            objFeed.feedlikeCount = [tempDict objectForKey:@"likeCount"];
            objFeed.feedCommentCount = [tempDict objectForKey:@"commentCount"];
            objFeed.feedIsLikedByUser = [tempDict objectForKey:@"post_image"];
            objFeed.feedID = [tempDict objectForKey:@"post_id"];
        objFeed.privateUserName = [tempDict objectForKey:pUserListName];
        objFeed.privateUserImage = [tempDict objectForKey:pUserListImage];
        [localTempArray  addObject:objFeed];
        
    }
    
    return localTempArray;
   
    
    }


@end
