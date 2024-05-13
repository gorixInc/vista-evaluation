ZIP_URL="https://owncloud.ut.ee/owncloud/s/cRj2teJCLpYpMmz/download"
TARGET_DIR="./traces"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download the zip file
curl -o "$TARGET_DIR/file.zip" "$ZIP_URL"

# Unzip the file into the target directory
unzip "$TARGET_DIR/file.zip" -d "$TARGET_DIR"

# Get the name of the unzipped folder (assuming there's only one folder in the zip)
UNZIPPED_FOLDER="vista-public-traces"

unzip "$TARGET_DIR/$UNZIPPED_FOLDER/*forward*.zip" -d "$TARGET_DIR"
unzip "$TARGET_DIR/$UNZIPPED_FOLDER/*backward*.zip" -d "$TARGET_DIR"
mv $TARGET_DIR/*forward* $TARGET_DIR/forward_trace
mv $TARGET_DIR/*backward* $TARGET_DIR/backward_trace

# Clean up
rm "$TARGET_DIR/file.zip"
rm -rf "$TARGET_DIR/$UNZIPPED_FOLDER"
rm -rf $TARGET_DIR/*ebm-*

echo "Download, unzip, and rename completed successfully."