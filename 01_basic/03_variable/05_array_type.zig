//! 数组
//!
const stdout = @import("std").debug;

pub fn main() void {
    // 创建数组
    const array = [3]u32{};
    array[0] = 1;

    // 创建定长数组
    const messages = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    // 根据索引访问
    stdout.print("messages[1]: {c} \n", .{messages[1]}); // e
    // 数组长度
    stdout.print("arr length: {} \n", .{messages.len}); // 5

    // 变长数组, 使用 _ zig会自动推断数组的长度。
    const numbers = [_]u32{ 1, 2, 3, 4, 5 };
    stdout.print("{x} \n", .{numbers}); // { 1, 2, 3, 4, 5 }

    // 数组的解构
    const point = [_]i32{ 32, -93 };
    const x, const y = point;
    stdout.print("x = {}, y = {} \n", .{ x, y }); // x = 32, y = -93

    // 数组拼接
    // 数组之间可以使用 `++` 进行串联操作，只要两个数组的元素类型相同即可。
    const arr1 = [_]i32{ 1, 2, 3, 4 };
    const arr2 = [_]i32{ 5, 6, 7, 8 };
    const all = arr1 ++ arr2;
    stdout.print("all arr = {x} \n", .{all}); // all arr = { 1, 2, 3, 4, 5, 6, 7, 8 }

    // 数组叠加
    // 数组之间可以用 `**` 做乘法叠加操作，`**` 运算符左侧是数组，右侧是倍数。
    const mul_arr = all ** 2;
    stdout.print("mul arr = {x} \n", .{mul_arr}); // mul arr = { 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8 }
}
