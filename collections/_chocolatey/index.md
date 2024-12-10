---
title: Chocolatey for UiPath Studio
permalink: /resources/devops/tools/chocolatey/
sort_order: 0
components:
  - TA_PTC_062
  - TA_PTC_063
component: TA_PTC_062
_main-header: |
  foo
---

# About Chocolatey

[Chocolatey](https://chocolatey.org/) is a package manager for Windows that enables you to quickly and easily install, update, and manage software packages from the command line or via a GUI. It automates the process of software installation and configuration, making it a convenient tool for developers, sysadmins, and power users.

https://www.myget.org/feed/Packages/project-basturma-chocolatey-packages

https://www.myget.org/feed/Packages/project-basturma-chocolatey-beta

<wa-divider style="--width: 4px"></wa-divider>

<wa-tab-group>
  <wa-tab slot="nav" panel="GetUiPathVersions">Get-UiPathVersions</wa-tab>
    <wa-tab-panel name="GetUiPathVersions">
      <pre><code class="language-powershell">{% github_sample /rpapub/ChocolateyPackages/ff7daee824b57ece6d709cb73ab1d8121cd4e58a/scripts/powershell/ChocolateyUiPathPackager/ChocolateyUiPathPackager.psm1 29 36 %}…
{% github_sample /rpapub/ChocolateyPackages/ff7daee824b57ece6d709cb73ab1d8121cd4e58a/scripts/powershell/ChocolateyUiPathPackager/ChocolateyUiPathPackager.psm1 54 %}</code></pre>
{% github_sample_ref /rpapub/ChocolateyPackages/blob/ff7daee824b57ece6d709cb73ab1d8121cd4e58a/scripts/powershell/ChocolateyUiPathPackager/ChocolateyUiPathPackager.psm1 %}
    </wa-tab-panel>
</wa-tab-group>
