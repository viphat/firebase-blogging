# Turbo Ghost
============

Code Blog, **inspired** bởi Ghost.org, viết bằng Angular Js 1.x và Firebase SDK 2.x. (Sẽ nâng cấp lên AngularJs 2.x và Firebase 3.x sau khi chín muồi).

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
