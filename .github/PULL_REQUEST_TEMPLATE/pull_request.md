
# 📦 Pull Request Summary

<!-- Describe the purpose of this PR. What problem does it solve? Why is it needed? -->
<!-- e.g. This pull request promotes the latest tested changes from `develop` into `main`. -->

Fixes: #<issue number>
Depends on: #<other PRs>


## ✅ Checklist

- [ ] I have tested this change locally
- [ ] I have documented any new functionality
- [ ] I have linked related issues and PRs
- [ ] This PR follows the repo’s contribution guidelines


## 📜 Commits in This PR

<!-- to list all commits included in this PR **locally**: -->

```bash
git fetch origin
# dotnet-gitversion /showvariable FullSemVer #requires dotnet tool install -g GitVersion.Tool
git log --oneline --graph --decorate origin/main..HEAD
```

<!-- Replace `main` if you're targeting another base branch (e.g., `develop`)
git log --oneline --graph --decorate origin/develop..HEAD -->


## 💬 Additional Notes

<!-- Optional: screenshots, logs, known issues, etc. -->