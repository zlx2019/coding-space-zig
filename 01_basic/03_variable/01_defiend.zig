//! 变量、常量的定义，以及解构相关。
//!
const std = @import("std");

pub fn main() void {
    // 变量声明
    // var name: tyoe = value;
    var age: u8 = 18;
    age = 24;
    std.debug.print("age: {} \n", .{age});

    // 常量声明
    const PI: f64 = 3.14;
    std.debug.print("PI: {} \n", .{PI});

    // 使用 undefined 表示变量未初始化状态
    var undef: u16 = undefined;
    undef = 1;

    // 解构
    var x: u32 = undefined;
    var y: u32 = undefined;
    var z: u32 = undefined;
    // 定义一个元组
    const tuple = .{ 10, 20, 30 };
    // 对元组进行解构
    x, y, z = tuple;
    std.debug.print("x = {}, y = {}, z = {} \n", .{ x, y, z });
    std.debug.print("x = {}, y = {}, z = {} \n", tuple);

    // 数组
    const arr = [_]u32{ 40, 50, 60 };
    // 同样可以解构数组
    x, y, z = arr;

    // 向量
    const vec: @Vector(3, u32) = .{ 70, 80, 90 };
    // 解构向量
    x, y, z = vec;
}
