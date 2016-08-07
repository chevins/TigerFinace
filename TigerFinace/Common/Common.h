//
//  Common.h
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#ifndef Common_h
#define Common_h

//屏幕宽高
#define SCREENWIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen]bounds].size.height
#define WIDTH_Rate [[UIScreen mainScreen]bounds].size.width/375.0
#define HEIGHT_Rate [[UIScreen mainScreen]bounds].size.height/667.0

//颜色值
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define COLOR_Background RGBAColor(243,244,245,1)
#define COLOR_SeparatorLine RGBAColor(222,223,224,1)
#define COLOR_Background_LightGray RGBAColor(237,238,239,1)
#define COLOR_Orange RGBAColor(251,168,42,1)
#define COLOR_Red RGBAColor(249,80,82,1)
#define COLOR_Yellow RGBAColor(253,239,54,1)
#define COLOR_Green RGBAColor(121,191,102,1)
#define COLOR_Blue RGBAColor(75,188,210,1)
#define COLOR_Purple RGBAColor(145,155,220,1)

#endif /* Common_h */
