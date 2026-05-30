[Weasis](https://nroduit.github.io) is a free/libre/open multipurpose DICOM viewer with a highly
modular architecture. It is widely used in healthcare by hospitals, health networks, multicenter
research trials, and patients.

# Flatpak: Contributing Updates to Flathub

This repository follows the Flathub contribution workflow. Every change is submitted as a pull
request (PR), automatically built and tested by Flathub's CI, verified from a temporary test
repository, and only then merged to publish the new version.

## Workflow Overview

1. **Open a PR** with your changes.
2. **Flathub CI builds it.** The `flathubbot` posts the build status on the PR and, on success,
   a command to install the build from the testing repository.
3. **Test the build** locally using that command (see [Testing a PR build](#testing-a-pr-build)).
4. **Merge** once the build succeeds and the app works as expected. Merging to the default branch
   triggers publication of the new version to the stable Flathub repository.

## Making Changes

1. Fork this repository (or create a branch if you have push access).
2. Create a new branch for your changes.
3. Update the necessary files:
    - Bump the version, source URLs, and `sha256` checksums in `io.github.nroduit.Weasis.yaml`
      (the Weasis `weasis-native.zip` and the bundled Temurin JDK for each architecture).
    - Add a new release entry at the top of the `<releases>` list in
      `io.github.nroduit.Weasis.metainfo.xml`, e.g.:
   ```xml
   <release version="4.7.0" date="2026-05-28">
     <url type="details">https://github.com/nroduit/Weasis/releases/tag/v4.7.0</url>
   </release>
   ```
4. Open a pull request to the default branch.

## Testing a PR build

When the build succeeds, `flathubbot` comments on the PR with a ready-to-use install command
pointing at the testing repository. It looks like this (the build ID changes per build):

```bash
flatpak install --user https://dl.flathub.org/build-repo/<BUILD_ID>/io.github.nroduit.Weasis.flatpakref
```

Run that command, launch the app, and confirm the update behaves as expected. The build is
produced for both `aarch64` and `x86_64`. When you are done testing, you can remove it with:

```bash
flatpak uninstall --user io.github.nroduit.Weasis
```

## Merging and Publishing

Once the CI build is green and the test build works, merge the PR. Publication to the stable
Flathub repository happens automatically after the merge; it may take a while before the new
version is available to all users.

## Local Build (Optional)

You can also build the manifest locally before opening a PR.

### Prerequisites

- Flatpak and Flatpak Builder
- The Flathub remote

### Install Build Tools

On Debian-based systems:
```bash
sudo apt install flatpak-builder
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Build and Install

```bash
flatpak-builder --user --install --force-clean build-dir io.github.nroduit.Weasis.yaml
```

See the [building documentation](https://docs.flatpak.org/en/latest/building.html) for details.