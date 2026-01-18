# Git LFS Setup Instructions

## Install Git LFS

**On macOS:**
1. Download from https://git-lfs.github.com/ or use Homebrew:
   ```bash
   brew install git-lfs
   ```

2. Initialize Git LFS:
   ```bash
   git lfs install
   ```

## Migrate Existing Files to LFS

After installing Git LFS, you'll need to migrate existing large files:

```bash
# Track the file types (already in .gitattributes)
git add .gitattributes
git commit -m "Add Git LFS configuration"

# Migrate existing files to LFS
git lfs migrate import --include="*.mov,*.mp4,*.MOV,*.MP4" --everything
git lfs migrate import --include="images/**/*.jpg,images/**/*.JPG,images/**/*.png,images/**/*.PNG" --everything

# Force push (only if needed, and be careful!)
# git push origin source --force
```

## After Migration

The repository will now use LFS for large files. Files will be stored as pointers in git, with actual content in LFS storage.

## GitHub Actions

The workflow is already configured to use Git LFS with `lfs: true` in the checkout step.

