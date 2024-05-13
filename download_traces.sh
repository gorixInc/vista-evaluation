ZIP_URL="https://owncloud.ut.ee/owncloud/s/cRj2teJCLpYpMmz/download"
TARGET_DIR="./traces"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download the zip file
curl -o "$TARGET_DIR/file.zip" "$ZIP_URL"

# Unzip the file into the target directory
unzip "$TARGET_DIR/file.zip" -d "$TARGET_DIR"

# Get the name of the unzipped folder (assuming there's only one folder in the zip)
UNZIPPED_FOLDER=$(unzip -l "$TARGET_DIR/file.zip" | awk '/^ *[0-9]/ {print $4}' | cut -d/ -f1 | sort | uniq | head -n 1)

cd "$UNZIPPED_FOLDER"
# Rename the unzipped folder
mv "$TARGET_DIR/$UNZIPPED_FOLDER/*forward*" "$TARGET_DIR/forward_trace"
mv "$TARGET_DIR/$UNZIPPED_FOLDER/*backward*" "$TARGET_DIR/backward_trace"

# Clean up: remove the zip file
rm "$TARGET_DIR/file.zip"
rm "$TARGET_DIR/$UNZIPPED_FOLDER"

echo "Download, unzip, and rename completed successfully."