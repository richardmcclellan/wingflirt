//
//  UILabel-Additions.m
//  Hurricane
//
//  Created by Richard McClellan on 2/11/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import "UILabel-Additions.h"
#import "UIView-Additions.h"

@implementation UILabel (UILabel_Additions)

-(CGPoint) endOfTextPoint {
	CGPoint endPoint;
	
	// Compute number of lines and height per line.
	NSInteger numLines = 0;
	NSInteger lineHeight = 0;
	UILabel *tmpLabel;

	tmpLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	tmpLabel.numberOfLines = 0;
	tmpLabel.font = self.font;
	tmpLabel.text = @"a";
	[tmpLabel sizeToFit];
	lineHeight = tmpLabel.height;
	numLines = self.height / lineHeight;
	endPoint.y = (numLines - 1) * lineHeight;

	// Truncate the last line of text
	tmpLabel.text = self.text;
	tmpLabel.frame = self.frame;
	CGSize size;
	if(numLines == 1) {
		endPoint.x = tmpLabel.width;
	} else {
		do {
			NSRange range = [tmpLabel.text rangeOfString:@" " options:NSBackwardsSearch];
			NSInteger lastWhitespaceCharIndex = (range.location == NSNotFound) ? 0 : range.location;
			tmpLabel.text = [tmpLabel.text substringToIndex:lastWhitespaceCharIndex];
			size = [tmpLabel sizeThatFits:CGSizeMake(tmpLabel.width, 1000)];
		} while(size.height == self.height && tmpLabel.text.length > 1);
	
		// Set the tmpLabel's text to be the last line.
		NSRange range = {tmpLabel.text.length, self.text.length - tmpLabel.text.length};
		tmpLabel.text = [[self.text substringWithRange:range] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		[tmpLabel sizeToFit];
		endPoint.x = tmpLabel.width;
	}
	return endPoint;
}

@end
