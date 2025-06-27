//! 标准IO操作

const std = @import("std");

/// 通过缓冲区来操作标准IO
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stderr = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    // 包装缓冲区
    var out_buf = std.io.bufferedWriter(stdout);
    var err_buf = std.io.bufferedWriter(stderr);
    // var in_buf = std.io.bufferedReader(stdin);
    // 写入缓冲区
    try out_buf.writer().print("Hello {s}! \n", .{"stdout"});
    try err_buf.writer().print("Hello {s}! \n", .{"stderr"});
    try out_buf.flush();
    try err_buf.flush();

    // 读取标准输入
    try stdout.print("请输入：", .{});
    var buf: [256]u8 = undefined;
    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |input| {
        try out_buf.writer().print("你输入的是: {s} \n", .{input});
    }
    // 缓冲区
    try out_buf.flush();
    try err_buf.flush();
}
