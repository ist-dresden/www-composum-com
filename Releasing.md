# How to release a new version

The packages are put on https://github.com/orgs/ist-dresden/packages?repo_name=www-composum-com since this doesn't
belong to maven central repo, yet has to be available for composum-launcher to draw it in as an example and has to
be publicly available.

## Content update

There are two branches - develop and public. develop contains all pages, even those that are not published, and
public, which is created from the actually published pages. They can be updated once in a while:

- Login at https://cloud.composum.com/libs/composum/platform/public/login.html?login
- Download package at https://cloud.composum.com/bin/browser.html/content/ist/composum (branch develop) or
  https://cloud.composum.com/bin/browser.html/public/ist/composum (branch public)
- for public run bin/cleanupReplicatedPackage.sh
- commit, push.

## Build and deploy package

- Run https://github.com/ist-dresden/www-composum-com/actions/workflows/deploy_package.yml from branch public
