//! 指针(Pointer)
//!     - 单项指针：指向单个元素的指针。
//!     - 多项指针：指向未知数量个元素的指针。

const std = @import("std");

pub fn main() void {
    // 单项指针
    var num: i8 = 66;
    // 获取 num 的指针
    const num_ptr = &num;
    // 通过指针来操作num的值
    // .* 表示解引用，
    num_ptr.* = (num_ptr.*) + 1;
    std.debug.print("num = {} \n", .{num});

    // 多项指针
    // 多项指针：指向多个元素序列的指针，类型为 [*]T, T是元素类型。且类型大小必须是固定的。
    const array = [_]u32{ 1, 2, 3, 4 };
    // 获取数组的指针
    const arr_ptr: [*]const u32 = &array;
    // 通过指针获取数组元素
    std.debug.print("array[0]: {} \n", .{arr_ptr[0]});
    std.debug.print("array[1]: {} \n", .{arr_ptr[1]});
    std.debug.print("array[2]: {} \n", .{arr_ptr[2]});
}
