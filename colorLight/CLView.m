//
//  CLView.m
//  colorLight
//
//  Created by luo plus on 15/6/20.
//  Copyright (c) 2015年 plusluo. All rights reserved.
//

#import "CLView.h"

@implementation CLView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor yellowColor];
		self.userInteractionEnabled = YES;
		_nPos = 0;
		
		_colorArray = [[NSArray alloc] initWithObjects:
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1],
					   [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1],
					   [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1],
					   [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:0.1 green:0.25 blue:0.6 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1],
					   [UIColor colorWithRed:0.4 green:0.5 blue:0 alpha:1],
					   [UIColor colorWithRed:0.0 green:0.5 blue:0.2 alpha:1],
					   [UIColor colorWithRed:0.9 green:0.5 blue:0.2 alpha:1],
					   [UIColor colorWithRed:0 green:0.5 blue:0.9 alpha:1],
					   nil];
	}
	return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	_startPoint = point;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint point = [[touches anyObject] locationInView:self];
	float dx = point.x - _startPoint.x;
	if (dx > 10) {
		[self nextColor];
		_startPoint = point;
	}else if(dx < -10){
		[self preColor];
		_startPoint = point;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	
}

- (void)nextColor{
	_nPos++;
	if (_nPos >= [_colorArray count]) {
		_nPos = 0;
	}
	self.backgroundColor = [_colorArray objectAtIndex:_nPos];
}

- (void)preColor{
	_nPos--;
	if (_nPos < 0) {
		_nPos = [_colorArray count] - 1;
	}
	self.backgroundColor = [_colorArray objectAtIndex:_nPos];
}

@end
