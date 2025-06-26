// @import 函数用于查找模块或源文件，并导入它。

const std = @import("std");
pub fn main() void {
    // 标准输出
    std.debug.print("Hello, world! \n", .{});
}

// 通过 zig run xxx.zig 命令来执行此文件.
