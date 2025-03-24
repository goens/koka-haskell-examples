These are examples of effects, used for a guest lecture at the "Functional Programming" course at the University of Amsterdam.

# Haskell
The Haskell examples need an installation of Haskell with cabal. You first should run `cabal update` once, then you can just run them with `cabal repl`.

# Koka
The Koka examples need an installation of [Koka](https://koka-lang.github.io/koka/doc/book.html#install). You can just run them with `koka -e koka/pure.kk` (and similar for the others), or on vs code with the koka extension.

## Dependencies

An easy way to make sure you have all the dependencies is using [nix](https://nixos.org/learn/). Since we provide a `shell.nix` file, if you have nix install you can just run `nix shell` and will have the required dependencies.
