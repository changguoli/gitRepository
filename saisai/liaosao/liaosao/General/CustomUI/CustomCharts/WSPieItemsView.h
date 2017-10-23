//
//  WSPieItemsView.h
//  PieChart
//
//  Created by iMac on 17/2/7.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPieItemsView : UIView

/**
 *  Each initialization method of pie chart
 *  @para frame:frame
 *  @para beginAngle:Starting angle of cake block
 *  @para endAngle：End angle of cake block
 *  @para fillColor：Fill color for this cake block
 */
- (WSPieItemsView *)initWithFrame:(CGRect)frame
                    andBeginAngle:(CGFloat)beginAngle
                      andEndAngle:(CGFloat)endAngle
                     andFillColor:(UIColor *)fillColor;
@end
