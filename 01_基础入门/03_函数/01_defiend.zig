//! 函数定义

const std = @import("std");

/// 函数定义
pub fn add(x: u8, y: u8) u8 {
    return x + y;
}

/// 泛型函数
pub fn max(comptime T: type, x: T, y: T) T {
    return if (x > y) x else y;
}

/// 参数可以使用 anytype 代替类型声明，调用函数时将推断该参数类型。
/// 使用 @TypeOf 和 @typeinfo 获取有关推断类型的信息。
pub fn addFortyTwo(arg: anytype) @TypeOf(arg) {
    return arg + 1024;
}

/// noreturn 是一个特殊的类型,当一个函数不会返回时，你可以使用它来代替 void。
pub fn loop() noreturn {}

/// export 用于将函数作为 ABI 函数暴露
export fn sub(x: i8, y: i8) i8 {
    return x - y;
}

/// extern 用于声明外部链接函数
extern "C" fn mul(x: f64, y: 64) f64;

pub fn main() void {
    const sum: u8 = add(10, 20);
    std.debug.print("sum = {} \n", .{sum});
    std.debug.print("max = {} \n", .{max(u8, 100, 200)});
}
