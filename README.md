# xiamuAR
一.Animated Images (GIF) support

Starting with the 4.0 version, we rely on FLAnimatedImage to take care of our animated images.
If you use cocoapods, add pod 'SDWebImage/GIF' to your podfile.
To use it, simply make sure you use FLAnimatedImageView instead of UIImageView.
Note: there is a backwards compatible feature, so if you are still trying to load a GIF into a UIImageView, it will only show the 1st frame as a static image.
Important: FLAnimatedImage only works on the iOS platform. For OS X, use NSImageView with animates set to YES to show the entire animated images and NO to only show the 1st frame. For all the other platforms (tvOS, watchOS) we will fallback to the backwards compatibility feature described above
