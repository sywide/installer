# Installer

Installer is a shell for end-user OS comissioning.

At this time, only Windows Powershell is included.

# Getting started

1. Download or create all necessary [packages.config](#packages.config) file

2. If GO is used, download or define requirements.txt with required projects

3. Allow scripts execution by launching Windows Powershell in administrator mode

``` powershell
$ Set-ExecutionPolicy Unrestricted
```

4. Launch `install.ps1 [--go_bin] package1 package2` where:

   - `go_bin` add golang binaries for development only
   - `package` list of needed packages


# Packages.config

This is a list of packages in an xml manifest for Chocolatey to install. This is like the packages.config that NuGet uses except it also adds other options and switches. This can also be the path to the packages.config file if it is not in the current working directory.

``` xml
    <?xml version="1.0" encoding="utf-8"?>
    <packages>
      <package id="apackage" />
      <package id="anotherPackage" version="1.1" />
      <package id="chocolateytestpackage" version="0.1" source="somelocation" />
      <package id="alloptions" version="0.1.1"
               source="https://somewhere/api/v2/" installArguments=""
               packageParameters="" forceX86="false" allowMultipleVersions="false"
               ignoreDependencies="false"
               />
    </packages>
```