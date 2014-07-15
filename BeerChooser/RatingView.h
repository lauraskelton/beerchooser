//
//  RatingView.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#define kRatingViewNonSelected @"state-nonselected"
#define kRatingViewSelected @"state-selected"
#define kRatingViewHalfSelected @"state-halfselected"
#define kRatingViewQuarterSelected @"state-quarterselected"
#define kRatingViewThreeQuarterSelected @"state-threequarterselected"
#define kRatingViewHot @"state-hot"
#define kRatingViewHighlighted @"state-highlighted"
#define kRatingViewUserSelected @"state-userselected"

@class RatingView;

/** Allows you to process rating changes in the delegate. */
@protocol RatingDelegate

/**
 * Invoked whenever the value of the userRating property changes.
 *
 * @param ratingView Sender.
 * @param previousUserRating Previous userRating property value.
 * @param userRating Current userRating property value.
 */
- (void)ratingView:(RatingView *)ratingView didChangeUserRatingFrom:(NSInteger)previousUserRating to:(NSInteger)userRating;

@optional

/**
 * Invoked whenever the value of the rating property changes.
 *
 * @param ratingView Sender.
 * @param previousRating Previous rating property value.
 * @param rating Current rating property value.
 */
- (void)ratingView:(RatingView *)ratingView didChangeRatingFrom:(CGFloat)previousRating to:(CGFloat)rating;

@end

/** UIView that displays a 5-beer rating with ability to set user rating. */
@interface RatingView : UIView {
	
@private
	CGFloat _rating;
	NSInteger _userRating; /* User rating is supposed to be integer. */
	BOOL _highlighted;
	NSArray *beermugViews;
	NSMutableDictionary *_stateImageDictionary;
	
	id<RatingDelegate> _delegate;
}

/** Use 0 to specify that there is no rate yet. All the other values will be aligned to [1-5] range. */
@property (nonatomic, assign) CGFloat rating;

/**
 * Use 0 to specify that user decided to not leave rating just in the process. NOOOOOO need something different! let's say 100
 * All the other values will be aligned to [1-5] range.
 * In fact user rating - if set, i.e. 1+ - will always override rating.
 */
@property (nonatomic, assign) NSInteger userRating;

/**
 * Determines whether the control is highlighted. Introduced to support highlighted state in a TableView cell.
 */
@property (nonatomic, assign, getter=isHighlighted) BOOL highlighted;

@property (nonatomic, assign) IBOutlet id<RatingDelegate> delegate;

/**
 * Customizes standard beer images to the custom ones you specify here.
 * Make sure you call this method for all possible states for reach consistent look.
 */
- (void)setBeerImage:(UIImage *)image forState:(NSString *)state;
- (void)unsetUserRating;
- (void)initialSetUserRating:(NSInteger)value;

@end
