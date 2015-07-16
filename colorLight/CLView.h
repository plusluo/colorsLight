//
//  CLView.h
//  colorLight
//
//  Created by luo plus on 15/6/20.
//  Copyright (c) 2015年 plusluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLView : UIView
{
@private
	CGPoint _startPoint;
	NSArray* _colorArray;
	NSInteger _nPos;
}

@end
