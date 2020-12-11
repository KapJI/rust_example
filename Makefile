.PHONY: clean

all: rust-out/b/lib.lib

targets/debug/deps: Cargo.toml
	cargo build

rust-out/a/liba.rlib: target/debug/deps/serde_derive-88c54e7687dc6252.dll
	rustc --crate-name=a --crate-type=rlib --edition=2018 --out-dir rust-out/a @C:/rust_example/a/argsfile.txt a/lib.rs

rust-out/b/lib.lib: rust-out/a/liba.rlib
	rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @C:/rust_example/b/argsfile.txt b/lib.rs

clean:
	rm -rf rust-out
