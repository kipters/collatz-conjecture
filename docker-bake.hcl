target "buildbase" {
    dockerfile = "Dockerfile.base"
}

target "base" {
    contexts = {
        base = "target:buildbase"
    }
}

target "c" {
    inherits = ["base"]
    dockerfile = "c/Dockerfile"
    tags = ["collatz-c"]
}

target "d" {
    inherits = ["base"]
    dockerfile = "d/Dockerfile"
    tags = ["collatz-d"]
}

target "dotnet" {
    dockerfile = "dotnet/Dockerfile"
    target = "runtime"
    tags = ["collatz-dotnet"]
}

target "dotnet-r2r" {
    dockerfile = "dotnet/Dockerfile"
    target = "r2r"
    tags = ["collatz-dotnet-r2r"]
}

target "dotnet-aot" {
    dockerfile = "dotnet/Dockerfile"
    target = "aot"
    tags = ["collatz-dotnet-aot"]
}

target "fortran" {
    inherits = ["base"]
    dockerfile = "fortran/Dockerfile"
    tags = ["collatz-fortran"]
}

target "go" {
    dockerfile = "go/Dockerfile"
    tags = ["collatz-go"]
}

target "java" {
    dockerfile = "java/Dockerfile"
    tags = ["collatz-java"]
}

target "nim" {
    dockerfile = "nim/Dockerfile"
    tags = ["collatz-nim"]
}

target "rust" {
    dockerfile = "rust/Dockerfile"
    tags = ["collatz-rust"]
}

target "swift" {
    dockerfile = "swift/Dockerfile"
    tags = ["collatz-swift"]
}

target "v" {
    inherits = ["base"]
    dockerfile = "v/Dockerfile"
    tags = ["collatz-v"]
}

target "zig" {
    inherits = ["base"]
    dockerfile = "zig/Dockerfile"
    tags = ["collatz-zig"]
}

target "binaries" {
    contexts = {
        c = "target:c",
        d = "target:d",
        dotnet = "target:dotnet",
        dotnet-r2r = "target:dotnet-r2r",
        dotnet-aot = "target:dotnet-aot",
        fortran = "target:fortran",
        go = "target:go",
        java = "target:java",
        nim = "target:nim",
        rust = "target:rust",
        swift = "target:swift",
        v = "target:v",
        zig = "target:zig"
    }
    output = ["."]
}

target "bench" {
    dockerfile = "Dockerfile.bench"
    contexts = {
        binaries = "target:binaries"
    }
    tags = ["collatz-bench"]
}
