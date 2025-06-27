//! Zig 提供 3 种注释，这是顶级文档注释。
//! 普通注释会被忽略，doc 注释会用于生成包文档。
const std = @import("std");

/// 文档注释 Timestamp
const Timestamp = struct {
    /// 秒
    seconds: i64,
    /// 纳秒
    nanos: u32,

    /// Unix epoch;
    pub fn unixEpoch() Timestamp {
        // 普通注释
        return Timestamp{ .seconds = 0, .nanos = 0 };
    }
};

/// 文档注释
pub fn main() void {}
