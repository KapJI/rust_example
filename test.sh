#!/bin/bash
set -ex

cargo build

LIBSERDE=$(find target/debug/deps -name 'libserde*.rlib')
SERDE_DERIVE=$(find target/debug/deps -name 'serde_derive*.dll')
# LIBSERDE="target/debug/deps/libserde-1e63bc241cfd7336.rlib"
# SERDE_DERIVE="target/debug/deps/serde_derive-88c54e7687dc6252.dll"
rustc --crate-name=a --crate-type=rlib --edition=2018 --out-dir rust-out/a --extern=serde=$LIBSERDE --extern=serde_derive=$SERDE_DERIVE -Ldependency=target/debug/deps a/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile-minus-few-lines.txt b/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile.txt b/lib.rs

