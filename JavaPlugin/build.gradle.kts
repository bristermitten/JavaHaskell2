 plugins {
     java
 }

 repositories {
    maven(url = "https://papermc.io/repo/repository/maven-public/")
 }

 dependencies {
    compileOnly("com.destroystokyo.paper:paper-api:1.16.5-R0.1-SNAPSHOT")
 }

 java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(16))
    }
}

tasks.withType<JavaCompile>().configureEach { 
    options.setIncremental(false)
    options.headerOutputDirectory.set(file("src/main/headers"))
}