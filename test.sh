#!/bin/bash
set -ex

cargo build

rustc --crate-name=a --crate-type=rlib --edition=2018 --out-dir rust-out/a @a/argsfile.txt a/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile.txt b/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile-minus-line.txt b/lib.rs
