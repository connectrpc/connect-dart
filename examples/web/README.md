# Web example

Demonstrates using a connect client from a dart web project connecting to a remote server.
Project generated using `dart create -t web`.

The application is a stripped-down version of [ELIZA](https://en.wikipedia.org/wiki/ELIZA), a very
simple natural language processor built in the 1960s to represent a psychotherapist.

You can find the protocol buffer schema [on the BSR](https://buf.build/connectrpc/eliza/file/main:connectrpc/eliza/v1/eliza.proto).

## Run the example

You will need to activate webdev:

```shell
dart pub global activate webdev
```

Next we can run the example using:

```shell
webdev serve
```

That's it! You should now be able to open a web browser to https://localhost:8080 and see the
example running locally.

## Generate code

You can run `buf generate` to generate the code.
