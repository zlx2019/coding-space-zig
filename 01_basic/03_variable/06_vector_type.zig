//! 向量(Vector)
//!     - 向量的创建
//!     - 数组 -> 向量
//!     - 切片 -> 向量
//!     - 向量的解构
//!

const std = @import("std");

pub fn main() void {
    // 定义向量类型
    const vec = @Vector(4, i32);
    // 创建两个向量，向量必须有编译器已知的长度和类型
    const v1 = vec{ 1, 2, 3, 4 };
    const v2 = vec{ 5, 6, 7, 8 };
    // 向量执行相加
    const v3 = v1 + v2;
    std.debug.print("{any} \n", .{v3}); // { 6, 8, 10, 12 }

    // 以数组索引的形式来访问向量元素
    std.debug.print("v3[2] = {} \n", .{v3[2]}); // 10

    // 定义一个数组
    const arr: [4]i32 = [_]i32{ 1, 3, 4, 6 };
    std.debug.print("arr = {any} \n", .{arr}); // arr = { 1, 3, 4, 6 }
    // 将数组转换成向量
    const v4: @Vector(4, i32) = arr;
    std.debug.print("v4 = {any} \n", .{v4}); // v4 = { 1, 3, 4, 6 }
    // 将切片转换为向量
    const v5: @Vector(2, i32) = arr[1..3].*;
    std.debug.print("v5 = {any} \n", .{v5}); // v5 = { 3, 4 }

    // 向量的解构
    const user_vec = @Vector(3, f32){ 1.2, 2.0, 3.0 };
    var x: f32 = undefined;
    var y: f32 = undefined;
    var z: f32 = undefined;
    x, y, z = user_vec;
    std.debug.print("user postion x = {d}, y = {d}, z = {d} \n", .{ x, y, z });

    // 生成一个向量，向量的每个元素均是传入的参数 scalar，向量的类型和长度由编译器推断。
    const scalar: u32 = 5;
    const v6: @Vector(4, u32) = @splat(scalar);
    std.debug.print("v6: {any} \n", .{v6}); // v6: { 5, 5, 5, 5 }
}
