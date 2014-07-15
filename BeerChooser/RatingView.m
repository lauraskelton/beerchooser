//
//  RatingView.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "RatingView.h"

#define PROP_RATING @"rating"

#define MIN_RATING 1
#define MAX_RATING 5
#define BEERS MAX_RATING - MIN_RATING + 1

typedef UIImageView BeerView;
typedef UIImageView * BeerViewRef;

@interface RatingView (/* Private methods */)

- (NSMutableDictionary *)__stateImageDictionary;
- (UIImage *)__imageForState:(NSString *)state fromDictionary:(NSDictionary *)stateImageDict;
- (void)__initializeComponent;
- (NSInteger)__getRatingFromTouches:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)__visualizeCurrentUserRating:(NSInteger)currentUserRating;
- (void)__visualizeCurrentRating:(CGFloat)currentRating;

@end

@implementation RatingView

@synthesize delegate = _delegate;
@synthesize rating = _rating;
- (void)setRating:(CGFloat)value {
	
	if (_rating != value) {
		
		CGFloat previousRating = _rating;
		_rating = value;
		
		[self __visualizeCurrentRating:value];
		
		[self.delegate ratingView:self didChangeRatingFrom:previousRating to:_rating];
	}
}

@synthesize userRating = _userRating;
- (void)unsetUserRating {
	[self __visualizeCurrentRating:self.rating];
	_userRating = 0;
}

-(NSInteger)alignValue:(NSInteger)value
{
    return MIN(MAX_RATING,MAX(MIN_RATING, value));
}

- (void)initialSetUserRating:(NSInteger)value {
	
	if (!value) {
		
		if (!_userRating /* User hasn't voted yet. */) {
			[self __visualizeCurrentRating:self.rating];
		} else {
			[self __visualizeCurrentUserRating:_userRating]; /* Visualizing previous user rating. */
			
		}
		
	} else {
		
		/* Align the passed value so that it would fit physical range of 5 beers. */
		_userRating = [self alignValue:value];
		
		NSMutableDictionary *stateImageDict = [self __stateImageDictionary];
		
		for (NSInteger i = 0; i < _userRating; i++) {
			
			BeerViewRef beerView = [beermugViews objectAtIndex:i];
			beerView.image = [self __imageForState:kRatingViewUserSelected fromDictionary:stateImageDict];
		}
		
		if (value < beermugViews.count) {
			/* Need to leave some beers with non-selected images. */
			for (NSInteger i = beermugViews.count - 1; i >= value; i--) {
				BeerViewRef beerView = [beermugViews objectAtIndex:i];
				beerView.image = [self __imageForState:kRatingViewNonSelected fromDictionary:stateImageDict];
			}
		}
	}
	
}

- (void)setUserRating:(NSInteger)value {
	
	NSInteger previousUserRating = _userRating;
	
	if (!value) {
		
		if (!_userRating /* User hasn't voted yet. */) {
			[self __visualizeCurrentRating:self.rating];
		} else {
			[self __visualizeCurrentUserRating:_userRating]; /* Visualizing previous user rating. */
			
		}
		
	} else {
		
		/* Align the passed value so that it would fit physical range of 5 beers. */
		_userRating = [self alignValue:value];
		
		NSMutableDictionary *stateImageDict = [self __stateImageDictionary];
		
		for (NSInteger i = 0; i < _userRating; i++) {
			
			BeerViewRef beerView = [beermugViews objectAtIndex:i];
			beerView.image = [self __imageForState:kRatingViewUserSelected fromDictionary:stateImageDict];
		}
		
		if (value < beermugViews.count) {
			/* Need to leave some beers with non-selected images. */
			for (NSInteger i = beermugViews.count - 1; i >= value; i--) {
				BeerViewRef beerView = [beermugViews objectAtIndex:i];
				beerView.image = [self __imageForState:kRatingViewNonSelected fromDictionary:stateImageDict];
			}
		}
	}
	
	if (previousUserRating != _userRating) {
		[self.delegate ratingView:self didChangeUserRatingFrom:previousUserRating to:_userRating];
	}
}

@synthesize highlighted = _highlighted;
- (void)setHighlighted:(BOOL)value {
	
	for (BeerViewRef beerView in beermugViews) {
		beerView.highlighted = value;
	}
}

- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self __initializeComponent];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	
	if (self = [super initWithCoder:aDecoder]) {
		[self __initializeComponent];
	}
	
	return self;
}

- (void)__initializeComponent {
	
	self.clipsToBounds = YES;
	
	NSMutableArray *beerViewList = [[NSMutableArray alloc] initWithCapacity:BEERS];
	
	CGFloat height = CGRectGetHeight(self.frame);
	
	for (NSInteger i = 0; i < BEERS; i++) {
		
		static CGFloat beerWidth = 55;
		
		BeerViewRef beerView = [[BeerView alloc] initWithFrame:CGRectMake(i * beerWidth, 0, beerWidth, height)];
		beerView.clearsContextBeforeDrawing = YES;
		beerView.contentMode = UIViewContentModeCenter;
		beerView.multipleTouchEnabled = YES;
		beerView.tag = MIN_RATING + i; /* Associated rating, which is from MIN_RATING to MAX_RATING. */
		[beerViewList addObject:beerView];
		[self addSubview:beerView];
		[beerView release];
	}
	
	beermugViews = beerViewList;
}

- (void)dealloc {
	
	[_stateImageDictionary release];
	_stateImageDictionary = nil;
	[beermugViews release];
	beermugViews = nil;
	[super dealloc];
}

#pragma mark Layout

- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	CGFloat height = CGRectGetHeight(self.frame);
	CGFloat beerWidth = CGRectGetWidth(self.frame) / BEERS;
	
	for (NSUInteger i = 0; i < BEERS; i++) {
		
		BeerViewRef beerView = [beermugViews objectAtIndex:i];
		beerView.frame = CGRectMake(i * beerWidth, 0, beerWidth, height);
	}
}

#pragma mark Look-n-feel

- (void)setBeerImage:(UIImage *)image forState:(NSString *)state {
	
	if ([kRatingViewHighlighted isEqualToString:state]) {
		
		for (BeerViewRef beerView in beermugViews) {
			beerView.highlightedImage = image;
		}
		
	} else {
		
		NSMutableDictionary *stateImageDict = [self __stateImageDictionary];
		[stateImageDict setObject:image forKey:state];
		
		[self __visualizeCurrentRating:self.rating];
	}
}

- (NSMutableDictionary *)__stateImageDictionary {
	
	if (!_stateImageDictionary) {
		_stateImageDictionary = [[NSMutableDictionary alloc] initWithCapacity:4];
	}
	
	return _stateImageDictionary;
}

- (UIImage *)__imageForState:(NSString *)state fromDictionary:(NSDictionary *)stateImageDict {
	
	UIImage *result = [stateImageDict objectForKey:state];
	return result;
}

- (NSInteger)__getRatingFromTouches:(NSSet *)touches withEvent:(UIEvent *)event {
	
	id touch = [touches anyObject];
	
	for (BeerViewRef beerView in beermugViews) {
		
		if ([beerView pointInside:[touch locationInView:beerView] withEvent:event]) {
			return beerView.tag;
		}
	}
	
	return 0;
}

- (void)__visualizeCurrentUserRating:(NSInteger)currentUserRating {
	
	NSDictionary *stateImageDict = [self __stateImageDictionary];
	
	/* Making red the beers that indicate the current rating. */
	
	for (NSInteger i = 0; i < currentUserRating; i++) {
		
		BeerViewRef beerView = [beermugViews objectAtIndex:i];
		beerView.image = [self __imageForState:kRatingViewHot fromDictionary:stateImageDict];
	}
	
	/* Leaving only beer borders for the others. */
	
	for (NSInteger i = beermugViews.count - 1; i >= currentUserRating; i--) {
		
		BeerViewRef beerView = [beermugViews objectAtIndex:i];
		beerView.image = [self __imageForState:kRatingViewNonSelected fromDictionary:stateImageDict];
	}
}

- (void)__visualizeCurrentRating:(CGFloat)currentRating {
	
	NSInteger counter = 0;
	NSDictionary *stateImageDict = [self __stateImageDictionary];
	
	if (currentRating != 0) {
		
		/* Round currentRating to 0.25 stop. */
		
		currentRating = (lroundf([self alignValue:currentRating] * 4)) / 4.00;
		
		/* First set images for full beers. */
		
		NSInteger fullBeers = floorf(currentRating);
		for (NSInteger i = 0; i < fullBeers; i++, counter++) {
			
			BeerViewRef beerView = [beermugViews objectAtIndex:i];
			beerView.image = [self __imageForState:kRatingViewSelected fromDictionary:stateImageDict];
		}
		
		/* Now set images for a partial beer if any. */
		
		if (currentRating - fullBeers > 0) {
			if (currentRating - fullBeers == 0.25) {
				BeerViewRef beerView = [beermugViews objectAtIndex:counter++];
				beerView.image = [self __imageForState:kRatingViewQuarterSelected fromDictionary:stateImageDict];
			}
			else{
				if (currentRating - fullBeers == 0.50) {
					BeerViewRef beerView = [beermugViews objectAtIndex:counter++];
					beerView.image = [self __imageForState:kRatingViewHalfSelected fromDictionary:stateImageDict];
				}
				else{
					if (currentRating - fullBeers == 0.75) {
						BeerViewRef beerView = [beermugViews objectAtIndex:counter++];
						beerView.image = [self __imageForState:kRatingViewThreeQuarterSelected fromDictionary:stateImageDict];
					}
				}
			}
			
		}
	}
	
	/* Leave other beers unselected. */
	
	for (NSInteger i = beermugViews.count - 1; i >= counter; i--) {
		
		BeerViewRef beerView = [beermugViews objectAtIndex:i];
		beerView.image = [self __imageForState:kRatingViewNonSelected fromDictionary:stateImageDict];
	}
}

#pragma mark User Interaction

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSInteger beersToHighlight = [self __getRatingFromTouches:touches withEvent:event];
	[self __visualizeCurrentUserRating:beersToHighlight];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSInteger beersToHighlight = [self __getRatingFromTouches:touches withEvent:event];
	[self __visualizeCurrentUserRating:beersToHighlight];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	/* Basically this is final user rating. */
	NSInteger beersToSelect = [self __getRatingFromTouches:touches withEvent:event];
	[self setUserRating:beersToSelect];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[self setUserRating:self.rating];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	
	if (self.userInteractionEnabled && [self pointInside:point withEvent:event]) {
		return self; /* Only intercept events if the touch happened inside the view. */
	}
	
	return [super hitTest:point withEvent:event];
}

- (void)setUserInteractionEnabled:(BOOL)value {
	
	[super setUserInteractionEnabled:value];
	
	for (BeerViewRef beerView in beermugViews) {
		beerView.userInteractionEnabled = value;
	}
}

@end
