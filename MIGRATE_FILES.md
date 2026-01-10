# Correct Git LFS Migration Commands

## Step 1: Make sure you're on the right branch
```bash
cd /Users/jay/website/ftaruc.github.io
git checkout source
git status  # Verify you're on the source branch
```

## Step 2: Migrate Video Files
```bash
git lfs migrate import --include="*.mov" --everything --include-ref=source
```

## Step 3: Migrate MP4 Files (if any)
```bash
git lfs migrate import --include="*.mp4" --everything --include-ref=source
```

## Step 4: Migrate Large Image Files
You can migrate images in batches:

```bash
# For jpg files
git lfs migrate import --include="*.jpg" --everything --include-ref=source

# For png files  
git lfs migrate import --include="*.png" --everything --include-ref=source
```

## Alternative: Migrate by directory pattern
If you want to migrate all images in specific directories:

```bash
# Migrate all files in videos directory
git lfs migrate import --include="videos/*" --everything --include-ref=source

# Migrate all images
git lfs migrate import --include="images/**/*" --everything --include-ref=source
```

## Step 5: Verify migration worked
```bash
git lfs ls-files  # This should show your migrated files
```

## Step 6: Force push (REWRITES HISTORY - be careful!)
```bash
# Make sure you have backups and coordinate with team
git push origin source --force
```

## Important Notes:
- The `--include-ref=source` flag limits migration to the source branch only
- `--everything` rewrites all history including all branches (use carefully)
- Migration rewrites git history - commit hashes will change
- You MUST force push after migration
- Anyone who has cloned the repo will need to re-clone after the force push

