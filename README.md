# Tiny C Projects

Implementations for the tiny projects in the book [Tiny C Projects](https://www.manning.com/books/tiny-c-projects) by Dan Gookin.

## Building

This project uses [Nix](https://nixos.org) to build the project.

Under the hood it just uses Clang, you can read the flake to see how it's being compiled (it's basically just `clang -o foo foo.c`).

```bash
# build it
$ nix build .#chapter2

# build and run it
$ nix run .#chapter2
```

## Development

Again, this project uses Nix. You can enter the devShell with `nix develop`. Inside, you'll find Clang and clangd installed.

