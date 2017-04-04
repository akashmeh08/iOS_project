//
//  FeedList.h
//  BaseProject
//
//  Created by Anjali on 29/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedList : NSObject{
    
    
}
@property (nonatomic, strong) NSString  *userProfileImage;
@property (nonatomic, strong) NSString  *userFullname;
@property (nonatomic, strong) NSString  *feedPostTime;
@property (nonatomic, strong) NSString  *feedBannerImageURL;
@property (nonatomic, strong) NSString  *feedDescription;
@property (nonatomic, strong) NSString  *feedlikeCount;
@property (nonatomic, strong) NSString  *feedCommentCount;
@property (nonatomic, strong) NSString  *feedIsLikedByUser;
@property (nonatomic, strong) NSString  *feedID;
@property (nonatomic, strong) NSString  *privateUserName;
@property (nonatomic, strong) NSString  *privateUserImage;
+(NSMutableArray *)getAllFeedItems:(NSArray *)tempArray;

@end
