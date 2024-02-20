[Weasis](https://nroduit.github.io) is a free/libre/open multipurpose DICOM viewer with a highly modular architecture. It is a very popular clinical viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients.

# Build the Flatpak package

## Install Flatpak Builder and tools

```bash
sudo apt install flatpak-builder
```
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

See [building documentation](https://docs.flatpak.org/en/latest/building.html)


## Update distribution

### Add the new release information in io.github.nroduit.Weasis.yaml, e.g.   
```xml
<release version="4.0.0-RC" date="2022-04-24">
  <description>https://github.com/nroduit/Weasis/releases/tag/v4.0.0-rc</description>
</release>
```

### Build the image locally

```bash
flatpak-builder --user --arch x86_64 --force-clean --install-deps-from=flathub build io.github.nroduit.Weasis.yaml
```

## Using the Flathub repository

To install applications that are hosted on Flathub, use the following:
```
flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.github.nroduit.Weasis
```

To install applications from the beta branch, use the following:
```
flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak install flathub-beta io.github.nroduit.Weasis
flatpak run io.github.nroduit.Weasis//beta
```

For more information and more applications see https://flathub.org 
