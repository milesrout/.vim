"""Operators"""
syn keyword cOperator __attribute __asm

"""TODOs"""
syn keyword cTodo contained NOTE

"""Statements"""
syn keyword cStatement countof lengthof assert offsetof
syn keyword cStatement SDL_assert SDL_assert_always
syn keyword cStatement co_yield co_begin co_end
"syn keyword cStatement trap

"""Constants"""
syn keyword cConstant VK_NULL_HANDLE VK_TRUE VK_FALSE
syn keyword cConstant MA_SUCCESS
syn keyword cConstant std_err std_out

"""Functions"""
hi def link cFunction Function
syn keyword cFunction memset memcpy memmove
syn keyword cFunction trap

"""Basic types"""
"syn keyword cType uchar ushort uint ulong
"syn keyword cType uint8 uint16 uint32 uint64
"syn keyword cType int8 int16 int32 int64
"syn keyword cType __u8 __u16 __u32 __u64
"syn keyword cType __s8 __s16 __s32 __s64
syn keyword cType u8 u16 u32 u64
"syn keyword cType s8 s16 s32 s64
syn keyword cType i8 i16 i32 i64
"syn keyword cType vlong
syn keyword cType usize isize
"syn keyword cType uptr iptr
"syn keyword cType u128 i128
"syn keyword cType __uint128 __int128
"syn keyword cType uint128_t int128_t
"syn keyword cType b8 b32
"syn keyword cType f32 f64

"""POSIX types"""
syn keyword cType blkcnt_t blksize_t clockid_t dev_t fsblkcnt_t fsfilcnt_t
syn keyword cType gid_t id_t ino_t key_t mode_t nlink_t pid_t suseconds_t
syn keyword cType uid_t timer_t
syn keyword cType trace_attr_t trace_event_id_t trace_event_set_t trace_id_t
syn keyword cType socklen_t pid_t
syn keyword cType pthread_attr_t pthread_barrier_t pthread_barrierattr_t
syn keyword cType pthread_cond_t pthread_condattr_t pthread_key_t
syn keyword cType pthread_mutex_t pthread_mutexattr_t pthread_once_t pthread_t
syn keyword cType pthread_rwlock_t pthread_rwlockattr_t pthread_spinlock_t 

"""Library types"""
syn keyword cType ivec2 ivec3 ivec4
syn keyword cType vec2 vec3 vec4
syn keyword cType mat2 mat3 mat4
syn keyword cType versor
syn keyword cType ma_result

"""Custom types"""
"syn keyword cType bigint
"syn keyword cType s8 arena printer rng writer
"syn keyword cType u32s i32s s8s u8s
"syn keyword cType i32v u64v
"syn keyword cType s8pair s8cut
"syn keyword cType dict map table
"syn keyword cType graph edge vert edges verts
"syn keyword cType token lexer
"syn keyword cType rgb xyz cielab cielch
"syn keyword cType byte buf str
"syn keyword cType str strbuf
"syn keyword cType eref eidx pos
