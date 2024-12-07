# Check if running on Windows or Unix-like systems
ifeq ($(OS),Windows_NT)
    SHELL := pwsh.exe
else
    SHELL := pwsh
endif
.SHELLFLAGS := -NoProfile -Command 

# Variables
JEKYLL_BUILD_CMD = bundle exec jekyll build --config _config.yml
JEKYLL_BUILD_CMD_TEST = bundle exec jekyll build --config _config.yml,_config_testing.yml
JEKYLL_SERVE_CMD = bundle exec jekyll serve --config _config.yml --watch --trace --port 4004 --host localhost
PROJECT_DIR = D:/github.com/rpapub/dotgithub
GIT_PROD_REMOTE = origin
GIT_TEST_REMOTE = test
GIT_BRANCH = gh-pages
COMMIT_MSG = 'Deploy to GitHub Pages'

# Phony targets (for non-file targets)
.PHONY: build build-test serve deploy clean

# Targets
build: clean
	$(JEKYLL_BUILD_CMD)

build-test: clean
	$(JEKYLL_BUILD_CMD_TEST)

serve:
	$(JEKYLL_SERVE_CMD)

# Cross-platform clean for deleting _site
clean:
	if (Test-Path "_site") { Remove-Item -Recurse -Force -Path "_site" }

# Variables
GIT_BRANCH = gh-pages
GIT_PROD_REMOTE = origin
COMMIT_MSG = 'Deploy to GitHub Pages'

# Phony targets (for non-file targets)
.PHONY: build build-test serve deploy clean

# Deploy to GitHub Pages (manual push)
deploy:
	# Save the current branch name to return to it later (using Make's shell)
	#CURRENT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

	# Ensure we're on the correct branch and have a clean working directory
	git checkout $(GIT_BRANCH)

	# Pull latest changes to avoid conflicts
	git pull $(GIT_PROD_REMOTE) $(GIT_BRANCH)

	# Remove all files in the gh-pages branch and copy the new content from _site
	if (Test-Path "_site") { Remove-Item -Recurse -Force -Path "_site" }

	# Commit the changes with a specific message
	git add .
	git commit -m "$(COMMIT_MSG)" || echo "No changes to commit"  # Prevent errors if nothing has changed

	# Push the changes to the gh-pages branch
	git push $(GIT_PROD_REMOTE) $(GIT_BRANCH)

	# Switch back to the original branch using Make's shell (returning to the original branch)
	#git checkout $(CURRENT_BRANCH)



