# Task Loop

> made by [droid](https://factory.ai)

> Inspired by [Matt Pocock's Ralph loop](https://github.com/mattpocock/course-video-manager/tree/main/plans)

A general-purpose autonomous task execution system. Create GitHub Issues, run the loop, get PRs.

## How It Works

1. **You** create GitHub Issues describing tasks
2. **Loop** picks up issues and executes them
3. **PRs** are created, issues are closed

The issue body IS the specification. It can be anything:
- Bug fixes
- Feature requests
- Full PRDs
- Content to create
- Refactoring tasks

## Quick Start

### Option 1: GitHub Actions (Recommended)

Just create an issue - the workflow triggers automatically:

```bash
gh issue create --title "Add dark mode" --body "Add dark mode toggle to settings page..."
```

Or trigger manually from the Actions tab with custom iterations.

**Setup:**
1. Fork/clone this repo
2. Add `FACTORY_API_KEY` to repo secrets (Settings → Secrets → Actions)
3. Create issues - droid runs automatically

### Option 2: Local

```bash
# Install droid
curl -fsSL https://get.factory.ai | sh

# Set API key
export FACTORY_API_KEY="your-key"

# Create an issue and run
gh issue create --title "Add dark mode" --body "Add dark mode toggle to settings page..."
./loop.sh 10
```

## Customization

Edit `prompt.md` to customize the workflow:

### Feedback Loops
Add your project's test/build commands in Step 5:
```bash
npm run test
npm run build
```

### Priority Rules
Edit Step 2 to change how issues are prioritized:
```markdown
Prioritize by labels:
1. `critical` - production issues
2. `high` - important features
3. `low` - nice to have
```

### Commit Style
Edit Step 7 to match your commit conventions.

## Files

```
your-repo/
├── prompt.md      # The workflow - edit this
├── loop.sh        # Runs droid in a loop
└── progress.txt   # Running log of completed work
```

## Usage Patterns

### Single Task
```bash
./loop.sh 1
```

### Run Until Done
```bash
./loop.sh 50
```

### Background (AFK Mode)
```bash
nohup ./loop.sh 100 > loop.log 2>&1 &
```

## Writing Good Issues

The better your issue, the better the output.

**Good issue:**
```markdown
## What
Add user avatar upload to profile page

## Requirements
- Accept PNG/JPG under 2MB
- Crop to square
- Store in /avatars/{user_id}.jpg
- Update user.avatar_url in database

## Files to change
- src/pages/profile.tsx
- src/api/upload.ts
- src/db/users.ts
```

**Too vague:**
```markdown
Add avatars
```
