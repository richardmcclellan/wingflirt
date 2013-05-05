//
//  HPTextViewInternal.m
//  Cupido
//
//  Created by Hans Pinckaers on 30-06-10.
//  Copyright 2010 Hans Pinckaers. All rights reserved.
//

#import "HPTextViewInternal.h"


@implementation HPTextViewInternal

@synthesize yInset;

-(void)setContentOffset:(CGPoint)s
{
	if(self.tracking || self.decelerating){
		//initiated by user...
		self.contentInset = UIEdgeInsetsMake(-yInset, 0, -yInset, 0);
	} else {
		float bottomOffset = (self.contentSize.height - self.frame.size.height + MAX(0, self.contentInset.bottom));
		if(s.y < bottomOffset && self.scrollEnabled){
			self.contentInset = UIEdgeInsetsMake(-yInset, 0, -yInset + 8, 0); //maybe use scrollRangeToVisible?
		}
	}
	[super setContentOffset:s];
}

-(void)setContentInset:(UIEdgeInsets)s
{
	UIEdgeInsets insets = s;
	
	if(s.bottom>(-yInset + 8)) 
        insets.bottom = -yInset;
    
//    insets.bottom = -yInset;
	insets.top = -yInset;

	[super setContentInset:insets];
}



@end
