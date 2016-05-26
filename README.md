# Turbo Ghost
============

Turbo Ghost Blogging Code - **inspired** bởi Ghost.org,được viết bằng Angular Js 1.5.x và Firebase SDK 3.0. (Dự kiến nâng cấp lên AngularJs 2.x và TypeScript).

- Project được khởi tạo bằng [Slush](http://slushjs.github.io)

## Development

To start developing in the project run:

```bash
gulp serve
```

Then head to `http://localhost:3000` in your browser.

The `serve` tasks starts a static file server, which serves the AngularJS application, and a watch task which watches all files for changes and lints, builds and injects them into the index.html accordingly.

## Production ready build - a.k.a. dist

To make the app ready for deploy to production run:

```bash
gulp dist
```

Now there's a `./dist` folder with all scripts and stylesheets concatenated and minified, also third party libraries installed with bower will be concatenated and minified into `vendors.min.js` and `vendors.min.css` respectively.