const std = @import("std");

fn collatz(seed: i64) i64 {
    var steps: i64 = 0;
    var tempSeed: i64 = seed;
    while (tempSeed > 1) : (steps += 1) {
        if (@rem(tempSeed, 2) == 0) {
            tempSeed = @divTrunc(tempSeed, 2);
        } else {
            tempSeed = tempSeed * 3 + 1;
        }
    }
    return steps;
}

pub fn main() !void {
    var collatzResult: i64 = 0;
    var seed: i64 = 1;
    while (seed <= 1_000_000) : (seed += 1) {
        collatzResult += collatz(seed);
    }

    const stdout = std.io.getStdOut().writer();
    try stdout.print("steps {}\n", .{collatzResult});
}
