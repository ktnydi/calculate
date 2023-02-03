#! /bin/bash

if [[ $CONFIGURATION == *"Development"* ]]; then
    cp $PRODUCT_NAME/Firebase/Development/GoogleService-Info.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Production"* ]]; then
    cp $PRODUCT_NAME/Firebase/Production/GoogleService-Info.plist $PRODUCT_NAME/GoogleService-Info.plist
else
    echo "configuration didn't match to Development, Staging or Production"
    echo $CONFIGURATION
    exit 1
fi
