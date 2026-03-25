{ pkgs }:
with pkgs;
[
  (rust-bin.stable.latest.default.override {
    extensions = [
      "rust-src"
      "rustfmt"
      "clippy"
      "rust-analyzer"
    ];
  })
  pkg-config
]
