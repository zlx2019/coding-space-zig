const std = @import("std");

// main 函数返回值为`!void`, 该类型为联合错误类型，这会告诉zig编译器：会返回错误或者值，如果有返回值那么一定是一个错误。
pub fn main() !void {
    // 获取标准输出和标准错误输出的写句柄
    var stdout = std.io.getStdOut().writer();
    var stderr = std.io.getStdErr().writer();
    // 分别向标准和错误写入字符内容
    try stdout.print("Hello {s}! \n", .{"stdout"});
    try stderr.print("Hello {s}! \n", .{"stderr"});
}
