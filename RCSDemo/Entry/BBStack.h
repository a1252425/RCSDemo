//
//  BBStack.h
//  RCSDemo
//
//  Created by shuai shao on 2023/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma -mark DEFINE MACRO FOR DIFFERENT CPU ARCHITECTURE

//DETAG_INSTRUCTION_ADDRESS 是为了去掉指令地址中的指针标签，ARM 指令分为 Thumb 和 Normal，指令长度分别为 16 位和 32 位
//arm64下指令长度为 32 位，所以至少是按照 4 字节对齐，指令地址一定是 4 的整数倍，指令最低 2 位正常总是为 0，系统可能会在这两位插入指针标签
//所以要去掉这个标签的值，得到真正的指令地址，arm64 去除低两位
//armv7下指令可能为 Thumb 和 Normal，同理去除最低一位
//x86_64 和 i386 中指令是可变长度的，所有位都是有意义的，不进行去除
//参看KSCrash的符号化代码 https://github.com/kstenerud/KSCrash/blob/master/Source/KSCrash/Recording/Tools/KSSymbolicator.c
#if defined(__arm64__)
#define DETAG_INSTRUCTION_ADDRESS(A) ((A) & ~(3UL)) //
#define BS_THREAD_STATE_COUNT ARM_THREAD_STATE64_COUNT
#define BS_THREAD_STATE ARM_THREAD_STATE64
#define BS_FRAME_POINTER __fp
#define BS_STACK_POINTER __sp
#define BS_INSTRUCTION_ADDRESS __pc

#elif defined(__arm__)
#define DETAG_INSTRUCTION_ADDRESS(A) ((A) & ~(1UL))
#define BS_THREAD_STATE_COUNT ARM_THREAD_STATE_COUNT
#define BS_THREAD_STATE ARM_THREAD_STATE
#define BS_FRAME_POINTER __r[7]
#define BS_STACK_POINTER __sp
#define BS_INSTRUCTION_ADDRESS __pc

#elif defined(__x86_64__)
#define DETAG_INSTRUCTION_ADDRESS(A) (A)
#define BS_THREAD_STATE_COUNT x86_THREAD_STATE64_COUNT
#define BS_THREAD_STATE x86_THREAD_STATE64
#define BS_FRAME_POINTER __rbp
#define BS_STACK_POINTER __rsp
#define BS_INSTRUCTION_ADDRESS __rip

#elif defined(__i386__)
#define DETAG_INSTRUCTION_ADDRESS(A) (A)
#define BS_THREAD_STATE_COUNT x86_THREAD_STATE32_COUNT
#define BS_THREAD_STATE x86_THREAD_STATE32
#define BS_FRAME_POINTER __ebp
#define BS_STACK_POINTER __esp
#define BS_INSTRUCTION_ADDRESS __eip

#endif

#define CALL_INSTRUCTION_FROM_RETURN_ADDRESS(A) (DETAG_INSTRUCTION_ADDRESS((A)) - 1)

#if defined(__LP64__)
#define TRACE_FMT         "%-4d%-31s 0x%016lx %s + %lu"
#define POINTER_FMT       "0x%016lx"
#define POINTER_SHORT_FMT "0x%lx"
#define BS_NLIST struct nlist_64
#else
#define TRACE_FMT         "%-4d%-31s 0x%08lx %s + %lu"
#define POINTER_FMT       "0x%08lx"
#define POINTER_SHORT_FMT "0x%lx"
#define BS_NLIST struct nlist
#endif

#pragma mark - 

#define BSLOG NSLog(@"%@",[BSBacktraceLogger bs_backtraceOfCurrentThread]);
#define BSLOG_MAIN NSLog(@"%@",[BSBacktraceLogger bs_backtraceOfMainThread]);
#define BSLOG_ALL NSLog(@"%@",[BSBacktraceLogger bs_backtraceOfAllThread]);

@interface BSBacktraceLogger : NSObject

+ (NSString *)bs_backtraceOfAllThread;
+ (NSString *)bs_backtraceOfCurrentThread;
+ (NSString *)bs_backtraceOfMainThread;
+ (NSString *)bs_backtraceOfNSThread:(NSThread *)thread;

+ (BOOL)enablePreTerminate;

@end

NS_ASSUME_NONNULL_END
