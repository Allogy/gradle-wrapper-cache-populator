# Gradle Wrapper Cache Populator

We use this project at Allogy to load up Gradle versions onto our build AMIs. When we build our AMIs, we can thus
install various versions of Gradle. This allows our build slaves to start builds quicker.

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

## Gradle to Java version matrix

Depending on the version of Gradle you are using, you may need to use a specific version of Java. Here is a matrix of supported versions. 

Please note that Java 21 is not yet supported by this project due to the need to maximize support for Java 8-17. Java 21 is not compatible with gradle versions lower than 8.3. 

| **Gradle Version**      | **Corretto 17 (Java 17)** | **Corretto 11 (Java 11)** | **Corretto 8 (Java 8)** |
|-------------------------|---------------------------|---------------------------|-------------------------|
| **Gradle 8.3+**         | ✅ Supported              | ✅ Supported              | ❌ Unsupported          |
| **Gradle 7.6.2+**       | ✅ Supported              | ✅ Supported              | ❌ Unsupported          |
| **Gradle 7.3+**         | ✅ Supported              | ✅ Supported              | ✅ Supported            |
| **Gradle 6.9+**         | ❌ Unsupported            | ✅ Supported              | ✅ Supported            |
| **Gradle 5.x to 6.8.3** | ❌ Unsupported            | ❌ Unsupported            | ✅ Supported            |