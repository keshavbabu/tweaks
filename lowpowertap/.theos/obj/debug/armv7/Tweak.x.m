#line 1 "Tweak.x"
@interface _CDBatterySaver
+(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
-(long long)getPowerMode;
@end

@interface UIStatusBarWindow : UIView
-(void)addGestureRecognizer:(id)arg1;
-(void)toggleLowPowerMode;
@end

@interface UIStatusBarManager
-(void)handleTapAction:(UIStatusBarTapAction *)action;
-(void)toggleLowPowerMode;
@end

@interface UIStatusBarTapAction : NSObject
@property (nonatomic, readonly) NSInteger type;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIStatusBarWindow; @class UIStatusBarManager; 
static UIStatusBarWindow* (*_logos_orig$_ungrouped$UIStatusBarWindow$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UIStatusBarWindow*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UIStatusBarWindow* _logos_method$_ungrouped$UIStatusBarWindow$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIStatusBarWindow*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$UIStatusBarWindow$toggleLowPowerMode(_LOGOS_SELF_TYPE_NORMAL UIStatusBarWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIStatusBarManager$handleTapAction$)(_LOGOS_SELF_TYPE_NORMAL UIStatusBarManager* _LOGOS_SELF_CONST, SEL, UIStatusBarTapAction *); static void _logos_method$_ungrouped$UIStatusBarManager$handleTapAction$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarManager* _LOGOS_SELF_CONST, SEL, UIStatusBarTapAction *); static void _logos_method$_ungrouped$UIStatusBarManager$toggleLowPowerMode(_LOGOS_SELF_TYPE_NORMAL UIStatusBarManager* _LOGOS_SELF_CONST, SEL); 

#line 21 "Tweak.x"

	static UIStatusBarWindow* _logos_method$_ungrouped$UIStatusBarWindow$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIStatusBarWindow* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
		self = _logos_orig$_ungrouped$UIStatusBarWindow$initWithFrame$(self, _cmd, frame);
		UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleLowPowerMode)];
		doubleTap.numberOfTapsRequired = 2;
		
		[self addGestureRecognizer:doubleTap];
		
		return _logos_orig$_ungrouped$UIStatusBarWindow$initWithFrame$(self, _cmd, frame);
	}
	
	static void _logos_method$_ungrouped$UIStatusBarWindow$toggleLowPowerMode(_LOGOS_SELF_TYPE_NORMAL UIStatusBarWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		if([[objc_getClass("_CDBatterySaver") batterySaver] getPowerMode]==0)
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:1 error:nil];
		else
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:0 error:nil];
	}


static void _logos_method$_ungrouped$UIStatusBarManager$handleTapAction$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIStatusBarTapAction * action) {
    if (action.type == 0xdeadbabe) {
        [self toggleLowPowerMode];
    } else {
        _logos_orig$_ungrouped$UIStatusBarManager$handleTapAction$(self, _cmd, action);
    }
}

	static void _logos_method$_ungrouped$UIStatusBarManager$toggleLowPowerMode(_LOGOS_SELF_TYPE_NORMAL UIStatusBarManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		if([[objc_getClass("_CDBatterySaver") batterySaver] getPowerMode]==0)
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:1 error:nil];
		else
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:0 error:nil];
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIStatusBarWindow = objc_getClass("UIStatusBarWindow"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarWindow, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UIStatusBarWindow$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarWindow$initWithFrame$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIStatusBarWindow, @selector(toggleLowPowerMode), (IMP)&_logos_method$_ungrouped$UIStatusBarWindow$toggleLowPowerMode, _typeEncoding); }Class _logos_class$_ungrouped$UIStatusBarManager = objc_getClass("UIStatusBarManager"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarManager, @selector(handleTapAction:), (IMP)&_logos_method$_ungrouped$UIStatusBarManager$handleTapAction$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarManager$handleTapAction$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIStatusBarManager, @selector(toggleLowPowerMode), (IMP)&_logos_method$_ungrouped$UIStatusBarManager$toggleLowPowerMode, _typeEncoding); }} }
#line 55 "Tweak.x"
