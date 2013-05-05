//
//  HPTextView.h
//  Cupido
//
//  Created by Hans Pinckaers on 29-06-10.
//  Copyright 2010 Hans Pinckaers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPGrowingTextView;
@class HPTextViewInternal;

@protocol HPGrowingTextViewDelegate

@optional
- (BOOL)growingTextViewShouldBeginEditing:(HPGrowingTextView *)growingTextView;
- (BOOL)growingTextViewShouldEndEditing:(HPGrowingTextView *)growingTextView;

- (void)growingTextViewDidBeginEditing:(HPGrowingTextView *)growingTextView;
- (void)growingTextViewDidEndEditing:(HPGrowingTextView *)growingTextView;

- (BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView;

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height;
- (void)growingTextView:(HPGrowingTextView *)growingTextView didChangeHeight:(float)height;

- (void)growingTextViewDidChangeSelection:(HPGrowingTextView *)growingTextView;
- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView;
@end

@interface HPGrowingTextView : UIView <UITextViewDelegate> {
	HPTextViewInternal *internalTextView;	
	
	int minHeight;
	int maxHeight;
	
	//class properties
	int maxLines;
	int minLines;
	
	BOOL animateHeightChange;
	
	//uitextview properties
	NSObject <HPGrowingTextViewDelegate> *__weak delegate;
	NSString *__weak text;
	UIFont *__weak font;
	UIColor *__weak textColor;
	UITextAlignment textAlignment; 
	NSRange selectedRange;
	BOOL editable;
	UIDataDetectorTypes dataDetectorTypes;
	UIReturnKeyType returnKeyType;
}

//real class properties
@property int maxLines;
@property int minLines;
@property BOOL animateHeightChange;
@property (strong) UITextView *internalTextView;	


//uitextview properties
@property(weak) NSObject<HPGrowingTextViewDelegate> *delegate;
@property(nonatomic,weak) NSString *text;
@property(nonatomic,weak) UIFont *font;
@property(nonatomic,weak) UIColor *textColor;
@property(nonatomic) UITextAlignment textAlignment;    // default is UITextAlignmentLeft
@property(nonatomic) NSRange selectedRange;            // only ranges of length 0 are supported
@property(nonatomic,getter=isEditable) BOOL editable;
@property(nonatomic) UIDataDetectorTypes dataDetectorTypes __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_0);
@property (nonatomic) UIReturnKeyType returnKeyType;


//uitextview methods
-(void)setMaxNumberOfLines:(int)n;
-(void)setMinNumberOfLines:(int)m;
- (BOOL)hasText;
- (void)scrollRangeToVisible:(NSRange)range;

- (void) reset;

@end
