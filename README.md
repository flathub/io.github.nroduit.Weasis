[Weasis](https://nroduit.github.io) is a free/libre/open multipurpose DICOM viewer with a highly
modular architecture. It is widely used in healthcare by hospitals, health networks, multicenter
research trials, and patients.

# Flatpak: Contributing Updates to Flathub

This repository follows the Flathub contribution workflow using pull requests (PRs). All changes
must be submitted as PRs and will be automatically built and tested by Flathub's CI system.

## Making Changes

1. Fork this repository
2. Create a new branch for your changes
3. Update the necessary files:
    - Update version numbers and dependencies in `io.github.nroduit.Weasis.yaml`
    - Add new release information in `io.github.nroduit.Weasis.metainfo.xml`, e.g.:
   ```xml
   <release version="4.0.0-RC" date="2022-04-24">
     <description>https://github.com/nroduit/Weasis/releases/tag/v4.0.0-rc</description>
   </release>
   ```
4. Create a pull request to the main branch

## Local Testing (Optional)

If you want to test your changes locally before submitting a PR:

### Prerequisites

- Flatpak and Flatpak Builder
- Flathub remote repository

### Install Build Tools

On Debian-based systems, you can install Flatpak Builder with:
```bash
sudo apt install flatpak-builder
```
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

See [building documentation](https://docs.flatpak.org/en/latest/building.html)
