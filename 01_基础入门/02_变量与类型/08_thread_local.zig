//! threadlocal 类似于Java中的 ThreadLocal

const std = @import("std");

// 使用 threadlocal 修饰
// 每个线程拥有自己的数据
threadlocal var id: i32 = 1234;

pub fn main() !void {
    // 创建2个线程
    const t1 = try std.Thread.spawn(.{}, task_handle, .{});
    const t2 = try std.Thread.spawn(.{}, task_handle, .{});
    t1.join();
    t2.join();
    std.debug.print("main id is: {} \n", .{id});
}

fn task_handle() void {
    std.debug.print("id is: {} \n", .{id});
    id += 10;
    std.debug.print("id is: {} \n", .{id});
}
