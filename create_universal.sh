FRAMEWORK=GRDB
TARGET=GRDBiOS
BUILD=build
FRAMEWORK_PATH=$FRAMEWORK.framework
rm -Rf $BUILD

xcodebuild archive -project $FRAMEWORK.xcodeproj -scheme $TARGET -sdk iphoneos SYMROOT=$BUILD
xcodebuild build -project $FRAMEWORK.xcodeproj -target $TARGET -sdk iphonesimulator SYMROOT=$BUILD
cp -RL $BUILD/Release-iphoneos/ $BUILD/Release-universal/
cp -RL $BUILD/Release-iphonesimulator/ $BUILD/Release-universal/
lipo -create $BUILD/Release-iphoneos/$FRAMEWORK_PATH/$FRAMEWORK $BUILD/Release-iphonesimulator/$FRAMEWORK_PATH/$FRAMEWORK -output $BUILD/Release-universal/$FRAMEWORK_PATH/$FRAMEWORK
