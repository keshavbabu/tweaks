%hook SBVolumeControlState
-(BOOL)isUILocked{
	return FALSE;
}
-(void)setUILocked:(BOOL)locked{
	%orig(FALSE);
}
%end