setlocal

cargo build

FOR /F "tokens=* USEBACKQ" %%F IN (`dir libserde*.rlib /s /b`) DO (
    SET LIBSERDE=%%F
)
FOR /F "tokens=* USEBACKQ" %%F IN (`dir serde_derive*.dll /s /b`) DO (
    SET SERDE_DERIVE=%%F
)
@REM set LIBSERDE=.\target\debug\deps\libserde-38267b78ea707299.rlib
@REM set SERDE_DERIVE=.\target\debug\deps\serde_derive-a775fbd55848dec1.dll

rustc --crate-name=a --crate-type=rlib --edition=2018 --out-dir rust-out/a --extern=serde=%LIBSERDE% --extern=serde_derive=%SERDE_DERIVE% -Ldependency=target/debug/deps a/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile-short.txt b/lib.rs

rustc --crate-type=staticlib --edition=2018 --out-dir rust-out/b @b/argsfile.txt b/lib.rs

