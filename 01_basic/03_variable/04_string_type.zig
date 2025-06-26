//! 字符串类型

const std = @import("std");

pub fn main() void {
    // Zig 中使用 comptime_int 类型表示 Unicode 码位
    const me: comptime_int = '我';
    std.debug.print("{0u} = (Unicode){0x} \n", .{me});

    // 如果值是 ASCII 字符串，可以使用 c 进行格式化
    const me_en = 'I';
    std.debug.print("{0c} = (Unicode){0x} \n", .{me_en});

    // Zig 的字符串字面量是一个单项指针，指向字面量进行UTF8编码后得到的字节数组。
    // 这个数组和C语言的字符串一样，都是以 '\0' 结尾的。
    // 存储的是 UTF8 编码字节序列
    const bytes = "Hello, 世界!";

    // 查看它的类型 和 序列长度
    std.debug.print("{} \n", .{@TypeOf(bytes)}); // *const [14:0]u8
    std.debug.print("{} \n", .{bytes.len}); // 14

    // 通过索引访问的是 UTF8 序列中的字节，由于 UTF8 兼容ASCII 所以可以直接以 ASCII 字符输出
    std.debug.print("{c} \n", .{bytes[1]}); // 'e'
    // '世' 字符的 UTF8编码为 [E4,B8,96] 三个字节
    std.debug.print("世 = [{X}, {X}, {X}] \n", .{ bytes[7], bytes[8], bytes[9] }); // 世 = [E4, B8, 96]
    // 以 NUL 结尾
    std.debug.print("{d} \n", .{bytes[14]}); // 0

    // 输出整个字节序列
    std.debug.print("{X} \n", .{bytes});
    // 输出字符串
    std.debug.print("{s} \n", .{bytes});
}
