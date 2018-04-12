# Gradle Wrapper Cache Populator

We use this project at Allogy to load up Gradle versions onto our build AMIs.

## Packer Usage

Here is a snippet for a Packer provisioner which will load the caches.

```
{
    "type": "shell",
    "inline": [
        "git clone https://github.com/Allogy/gradle-wrapper-cache-populator.git",
        "pushd gradle-wrapper-cache-populator",
        "./downloadGradle.sh  4.6  4.5.1  4.1  3.5.1  3.2.1",
        "popd",
        "rm -rf gradle-wrapper-cache-populator"
    ]
}
```
