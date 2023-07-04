# Composum site www.composum.com

The Composum site [www.composum.com](https://www.composum.com) is the main site describing the composum features, which
is hosted on [cloud.composum.com](https://cloud.composum.com). This project contains the source code for that site.
You are welcome to use this as an extensive example for using Composum Pages - either if you want to see how to
develop components or structure a site using Composum, or just to load it into our
[Docker image](https://hub.docker.com/repository/docker/composum/featurelauncher-composum) with Composum Pages
to play around, try how editing works or perhaps have a look at our all new
[Composum AI](https://github.com/ist-dresden/composum-AI). :-)

Please keep in mind that this is only sometimes updated from
[www.composum.com](https://www.composum.com/), so the better source for information is there.

The [IST Team](https://www.ist-software.com/home.html)

## Structure of the project

There are packages:

- [app](app/) with some components that are used for the site
- [content](content/) the actual content
- [mapping](mapping/]) for the virtual host mapping, which is specific to www.composum.com but might be useful as an
  example.

## Branches

There are two branches:

- develop: contains a snapshot of the content from the editor
- public: contains a snapshot of the actually published content, drafts etc. are not present.

The packages are constructed from branch public.

## Download

Download the .zip files from the sites.ist.composum.composum-site-app-package and
sites.ist.composum.composum-site-content packages at
https://github.com/orgs/ist-dresden/packages?repo_name=www-composum-com

Those can be installed with the
[Composum Package Manager](https://www.composum.com/home/nodes/pckgmgr.html)

## Usage through Maven

Add the maven repository. Unfortunately, you have to
[authenticate with github](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry)
to use that.

    <repository>
      <id>github</id>
      <url>https://maven.pkg.github.com/ist-dresden/www-composum-com</url>
      <snapshots>
        <enabled>true</enabled>
      </snapshots>
    </repository>

Dependencies:

    <!-- https://github.com/ist-dresden/www-composum-com/packages/1892890 -->
    <dependency>
      <groupId>sites.ist.composum</groupId>
      <artifactId>composum-site-app-package</artifactId>
      <version>1.0.0-SNAPSHOT</version>
    </dependency>

    <!-- https://github.com/ist-dresden/www-composum-com/packages/1892891 -->
    <dependency>
      <groupId>sites.ist.composum</groupId>
      <artifactId>composum-site-content</artifactId>
      <version>1.0.0-SNAPSHOT</version>
    </dependency>
