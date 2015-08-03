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
		[self initParameter];
		[self initButton];
		[self initLabel];
		[self initColor];
	}
	return self;
}

- (void)dealloc{
	[UIView setAnimationDelegate:nil];
}

- (void)initParameter{
	self.backgroundColor = [UIColor whiteColor];
	self.userInteractionEnabled = YES;
	_nPos = 0;
}

- (void)initButton{
	self.infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
	self.infoButton.frame = CGRectMake(10, self.frame.size.height - 40, 30, 30);
	[self addSubview:self.infoButton];
	[self.infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
	self.infoButton.hidden = YES;
}

- (void)initLabel{
	self.infoLabel = [[UILabel alloc] initWithFrame:self.frame ];
	self.infoLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:self.infoLabel];
	self.infoLabel.textAlignment = NSTextAlignmentCenter;
	self.infoLabel.text = @"左右滑动手指，切换颜色";
	self.infoLabel.alpha = 0.0;
}

- (void)initColor{
	_colorArray = [[NSArray alloc] initWithObjects:
				   [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1],
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

- (void)showInfo{
	[self showButton];
	self.infoLabel.hidden = NO;
	self.infoButton.enabled = NO;
	float alpha = self.infoLabel.alpha;
	alpha = (alpha==1.0) ? 0.0 : 1.0;
	
	[UIView beginAnimations:@"showIno" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationIsStoped)];
	[UIView setAnimationDuration:1.2];
	self.infoLabel.alpha = alpha;
	[UIView commitAnimations];
}

- (void)hideInfo{
	self.infoLabel.hidden = YES;
}

- (void)showButton{
	self.infoButton.hidden = NO;
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideButton) object:nil];
	[self performSelector:@selector(hideButton) withObject:nil afterDelay:5.0];
}

- (void)hideButton{
	self.infoButton.hidden = YES;
}

- (void)animationIsStoped{
	self.infoButton.enabled = YES;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	_startPoint = point;
	[self showButton];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint point = [[touches anyObject] locationInView:self];
	float dx = point.x - _startPoint.x;
	if (dx > 20) {
		[self nextColor];
		_startPoint = point;
		[self hideInfo];
	}else if(dx < -20){
		[self preColor];
		_startPoint = point;
		[self hideInfo];
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
