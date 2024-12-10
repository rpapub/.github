---
title: Chocolatey Packages for UiPath Studio and UiPath Studio Community
components:
  - TA_PTC_062
  - TA_PTC_064
---

# {{ page.title }}

For development purposes, a Windows system must not only remain up-to-date but, in some cases, also support rollbacks to earlier software versions. In the context of RPA using UiPath, maintaining legacy code may necessitate access to older versions of UiPath Studio, while updating documentation or instructions often requires working with specific historical versions.

Managing multiple systems can quickly become a time-intensive task, whether in a professional enterprise environment or at home, where IT professionals often maintain two or more computers.

The Chocolatey packages for UiPath Studio and UiPath Studio Community are designed to address these challenges:

- They provide IT professionals with access to enterprise-grade tools, even for personal use, at no cost ("free as in beer").
- They offer a scalable blueprint for managing multiple UiPath Unattended Robot or Studio machines in a professional setting.

## What is in scope

- [X] older versions available
- [X] time-saving
- [ ] silent installation

## At a glance

Want to install a pre-Modern Design experience Community edition? Or roll back the Enterprise edition to a specific version? Easy as:

<wa-tab-group>
  <wa-tab slot="nav" panel="uipathstudiocommunity21104">UiPath Studio Community 21.10.4</wa-tab>
  <wa-tab slot="nav" panel="uipathstudio22103">Get-UiPath Studio 22.10.3</wa-tab>
    <wa-tab-panel name="uipathstudiocommunity21104">
<code>choco install uipathstudiocommunity --version 21.10.4 --source https://www.myget.org/F/project-basturma-chocolatey-packages/api/v2</code>
    </wa-tab-panel>
    <wa-tab-panel name="uipathstudio22103">
<code>choco install uipathstudio --version 22.10.3 --source https://www.myget.org/F/project-basturma-chocolatey-packages/api/v2</code>
    </wa-tab-panel>
</wa-tab-group>

## How it works

If the package installer exists at a defined location underneath [https://download.uipath.com/versions](https://download.uipath.com/versions) then an automated script will find the .msi file and create a Chocolatey package, published on [https://www.myget.org/feed/GallerySettings/project-basturma-chocolatey-packages](https://www.myget.org/feed/GallerySettings/project-basturma-chocolatey-packages).

Updated weekly, these packages are first pushed to a test feed at [https://www.myget.org/feed/Packages/project-basturma-chocolatey-beta](https://www.myget.org/feed/Packages/project-basturma-chocolatey-beta) and if considered working pushed to the main feed [https://www.myget.org/feed/GallerySettings/project-basturma-chocolatey-packages](https://www.myget.org/feed/GallerySettings/project-basturma-chocolatey-packages)

Project Basturma is the codename for a collection of DevOps utilities related to RPA with UiPath.

## About

This is a hobby project by Christian Prior-Mamulyan.

## Bug Reports and Improvements

Via GitHub issues at [https://github.com/rpapub/ChocolateyPackages/issues](https://github.com/rpapub/ChocolateyPackages/issues).

{% contentfor main-footer %}
<wa-qr-code value="https://rpapub.cprima.net/resources/devops/tools/chocolatey/about-chocolatey-uipath-packages.html" fill="{{ page.colors.base03}}" background="{{ page.colors.base3}}" style="float: right;"></wa-qr-code>
The permalink for the page "{{ page.title }}" is [https://rpapub.cprima.net/resources/devops/tools/chocolatey/about-chocolatey-uipath-packages.html](https://rpapub.cprima.net/resources/devops/tools/chocolatey/about-chocolatey-uipath-packages.html).
{% endcontentfor %}