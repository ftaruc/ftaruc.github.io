# LFS Bandwidth Issue - Temporary Fix

## Problem
GitHub LFS bandwidth quota exhausted: **10 GB used / 10 GB included**

## Current Solution
- LFS temporarily disabled in `.github/workflows/main.yml` (`lfs: false`)
- Builds will work, but videos won't be available in production
- Site will deploy successfully

## When Bandwidth Resets
1. Check bandwidth usage at: https://github.com/settings/billing
2. Once bandwidth resets (usually monthly on billing cycle)
3. Re-enable LFS in workflow:
   ```yaml
   - uses: actions/checkout@v4
     with:
       fetch-depth: 0
       lfs: true  # Change back to true
   ```
4. Commit and push the change
5. Videos will work again in production

## Current LFS Files (7 videos)
- images/archive photos/load_pt1.mp4
- images/archive photos/load_pt2.mp4
- videos/boylife.mov
- videos/derby.mov
- videos/dijon.mov
- videos/fine.mov
- videos/smerz.mov

## Storage Status
- Storage: 0.9 GB used / 10 GB included (9% - OK)
- Bandwidth: 10 GB used / 10 GB included (100% - EXHAUSTED)

