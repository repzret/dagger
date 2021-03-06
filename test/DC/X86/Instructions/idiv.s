# RUN: llvm-mc -triple x86_64--darwin -filetype=obj -o - %s | llvm-dec - -dc-translate-unknown-to-undef -enable-dc-reg-mock-intrin | FileCheck %s

## IDIV16m
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 6
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[DX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"DX")
# CHECK-NEXT: [[AX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"AX")
# CHECK-NEXT: [[R11_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R11")
# CHECK-NEXT: [[RBX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RBX")
# CHECK-NEXT: [[V1:%.+]] = mul i64 [[RBX_0]], 2
# CHECK-NEXT: [[V2:%.+]] = add i64 [[V1]], 2
# CHECK-NEXT: [[V3:%.+]] = add i64 [[R11_0]], [[V2]]
# CHECK-NEXT: [[V4:%.+]] = inttoptr i64 [[V3]] to i16*
# CHECK-NEXT: [[V5:%.+]] = load i16, i16* [[V4]], align 1
# CHECK-NEXT: [[V6:%.+]] = zext i16 [[DX_0]] to i32
# CHECK-NEXT: [[V7:%.+]] = zext i16 [[AX_0]] to i32
# CHECK-NEXT: [[V8:%.+]] = shl i32 [[V6]], 16
# CHECK-NEXT: [[V9:%.+]] = or i32 [[V8]], [[V7]]
# CHECK-NEXT: [[V10:%.+]] = sext i16 [[V5]] to i32
# CHECK-NEXT: [[V11:%.+]] = sdiv i32 [[V9]], [[V10]]
# CHECK-NEXT: [[V12:%.+]] = trunc i32 [[V11]] to i16
# CHECK-NEXT: [[V13:%.+]] = srem i32 [[V9]], [[V10]]
# CHECK-NEXT: [[V14:%.+]] = trunc i32 [[V13]] to i16
# CHECK-NEXT: call void @llvm.dc.setreg.i16(i16 [[V12]], metadata !"AX")
# CHECK-NEXT: call void @llvm.dc.setreg.i16(i16 [[V14]], metadata !"DX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivw	2(%r11,%rbx,2)

## IDIV16r
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 4
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[DX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"DX")
# CHECK-NEXT: [[AX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"AX")
# CHECK-NEXT: [[R8W_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"R8W")
# CHECK-NEXT: [[V1:%.+]] = zext i16 [[DX_0]] to i32
# CHECK-NEXT: [[V2:%.+]] = zext i16 [[AX_0]] to i32
# CHECK-NEXT: [[V3:%.+]] = shl i32 [[V1]], 16
# CHECK-NEXT: [[V4:%.+]] = or i32 [[V3]], [[V2]]
# CHECK-NEXT: [[V5:%.+]] = sext i16 [[R8W_0]] to i32
# CHECK-NEXT: [[V6:%.+]] = sdiv i32 [[V4]], [[V5]]
# CHECK-NEXT: [[V7:%.+]] = trunc i32 [[V6]] to i16
# CHECK-NEXT: [[V8:%.+]] = srem i32 [[V4]], [[V5]]
# CHECK-NEXT: [[V9:%.+]] = trunc i32 [[V8]] to i16
# CHECK-NEXT: call void @llvm.dc.setreg.i16(i16 [[V7]], metadata !"AX")
# CHECK-NEXT: call void @llvm.dc.setreg.i16(i16 [[V9]], metadata !"DX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivw	%r8w

## IDIV32m
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 5
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[EDX_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EDX")
# CHECK-NEXT: [[EAX_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EAX")
# CHECK-NEXT: [[R11_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R11")
# CHECK-NEXT: [[RBX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RBX")
# CHECK-NEXT: [[V1:%.+]] = mul i64 [[RBX_0]], 2
# CHECK-NEXT: [[V2:%.+]] = add i64 [[V1]], 2
# CHECK-NEXT: [[V3:%.+]] = add i64 [[R11_0]], [[V2]]
# CHECK-NEXT: [[V4:%.+]] = inttoptr i64 [[V3]] to i32*
# CHECK-NEXT: [[V5:%.+]] = load i32, i32* [[V4]], align 1
# CHECK-NEXT: [[V6:%.+]] = zext i32 [[EDX_0]] to i64
# CHECK-NEXT: [[V7:%.+]] = zext i32 [[EAX_0]] to i64
# CHECK-NEXT: [[V8:%.+]] = shl i64 [[V6]], 32
# CHECK-NEXT: [[V9:%.+]] = or i64 [[V8]], [[V7]]
# CHECK-NEXT: [[V10:%.+]] = sext i32 [[V5]] to i64
# CHECK-NEXT: [[V11:%.+]] = sdiv i64 [[V9]], [[V10]]
# CHECK-NEXT: [[V12:%.+]] = trunc i64 [[V11]] to i32
# CHECK-NEXT: [[V13:%.+]] = srem i64 [[V9]], [[V10]]
# CHECK-NEXT: [[V14:%.+]] = trunc i64 [[V13]] to i32
# CHECK-NEXT: call void @llvm.dc.setreg.i32(i32 [[V12]], metadata !"EAX")
# CHECK-NEXT: call void @llvm.dc.setreg.i32(i32 [[V14]], metadata !"EDX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivl	2(%r11,%rbx,2)

## IDIV32r
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 3
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[EDX_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EDX")
# CHECK-NEXT: [[EAX_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EAX")
# CHECK-NEXT: [[R8D_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"R8D")
# CHECK-NEXT: [[V1:%.+]] = zext i32 [[EDX_0]] to i64
# CHECK-NEXT: [[V2:%.+]] = zext i32 [[EAX_0]] to i64
# CHECK-NEXT: [[V3:%.+]] = shl i64 [[V1]], 32
# CHECK-NEXT: [[V4:%.+]] = or i64 [[V3]], [[V2]]
# CHECK-NEXT: [[V5:%.+]] = sext i32 [[R8D_0]] to i64
# CHECK-NEXT: [[V6:%.+]] = sdiv i64 [[V4]], [[V5]]
# CHECK-NEXT: [[V7:%.+]] = trunc i64 [[V6]] to i32
# CHECK-NEXT: [[V8:%.+]] = srem i64 [[V4]], [[V5]]
# CHECK-NEXT: [[V9:%.+]] = trunc i64 [[V8]] to i32
# CHECK-NEXT: call void @llvm.dc.setreg.i32(i32 [[V7]], metadata !"EAX")
# CHECK-NEXT: call void @llvm.dc.setreg.i32(i32 [[V9]], metadata !"EDX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivl	%r8d

## IDIV64m
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 5
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[RDX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RDX")
# CHECK-NEXT: [[RAX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RAX")
# CHECK-NEXT: [[R11_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R11")
# CHECK-NEXT: [[RBX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RBX")
# CHECK-NEXT: [[V1:%.+]] = mul i64 [[RBX_0]], 2
# CHECK-NEXT: [[V2:%.+]] = add i64 [[V1]], 2
# CHECK-NEXT: [[V3:%.+]] = add i64 [[R11_0]], [[V2]]
# CHECK-NEXT: [[V4:%.+]] = inttoptr i64 [[V3]] to i64*
# CHECK-NEXT: [[V5:%.+]] = load i64, i64* [[V4]], align 1
# CHECK-NEXT: [[V6:%.+]] = zext i64 [[RDX_0]] to i128
# CHECK-NEXT: [[V7:%.+]] = zext i64 [[RAX_0]] to i128
# CHECK-NEXT: [[V8:%.+]] = shl i128 [[V6]], 64
# CHECK-NEXT: [[V9:%.+]] = or i128 [[V8]], [[V7]]
# CHECK-NEXT: [[V10:%.+]] = sext i64 [[V5]] to i128
# CHECK-NEXT: [[V11:%.+]] = sdiv i128 [[V9]], [[V10]]
# CHECK-NEXT: [[V12:%.+]] = trunc i128 [[V11]] to i64
# CHECK-NEXT: [[V13:%.+]] = srem i128 [[V9]], [[V10]]
# CHECK-NEXT: [[V14:%.+]] = trunc i128 [[V13]] to i64
# CHECK-NEXT: call void @llvm.dc.setreg.i64(i64 [[V12]], metadata !"RAX")
# CHECK-NEXT: call void @llvm.dc.setreg.i64(i64 [[V14]], metadata !"RDX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivq	2(%r11,%rbx,2)

## IDIV64r
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 3
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[RDX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RDX")
# CHECK-NEXT: [[RAX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RAX")
# CHECK-NEXT: [[R11_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R11")
# CHECK-NEXT: [[V1:%.+]] = zext i64 [[RDX_0]] to i128
# CHECK-NEXT: [[V2:%.+]] = zext i64 [[RAX_0]] to i128
# CHECK-NEXT: [[V3:%.+]] = shl i128 [[V1]], 64
# CHECK-NEXT: [[V4:%.+]] = or i128 [[V3]], [[V2]]
# CHECK-NEXT: [[V5:%.+]] = sext i64 [[R11_0]] to i128
# CHECK-NEXT: [[V6:%.+]] = sdiv i128 [[V4]], [[V5]]
# CHECK-NEXT: [[V7:%.+]] = trunc i128 [[V6]] to i64
# CHECK-NEXT: [[V8:%.+]] = srem i128 [[V4]], [[V5]]
# CHECK-NEXT: [[V9:%.+]] = trunc i128 [[V8]] to i64
# CHECK-NEXT: call void @llvm.dc.setreg.i64(i64 [[V7]], metadata !"RAX")
# CHECK-NEXT: call void @llvm.dc.setreg.i64(i64 [[V9]], metadata !"RDX")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivq	%r11

## IDIV8m
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 5
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[AX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"AX")
# CHECK-NEXT: [[R11_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R11")
# CHECK-NEXT: [[RBX_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RBX")
# CHECK-NEXT: [[V1:%.+]] = mul i64 [[RBX_0]], 2
# CHECK-NEXT: [[V2:%.+]] = add i64 [[V1]], 2
# CHECK-NEXT: [[V3:%.+]] = add i64 [[R11_0]], [[V2]]
# CHECK-NEXT: [[V4:%.+]] = inttoptr i64 [[V3]] to i8*
# CHECK-NEXT: [[V5:%.+]] = load i8, i8* [[V4]], align 1
# CHECK-NEXT: [[V6:%.+]] = sext i8 [[V5]] to i16
# CHECK-NEXT: [[V7:%.+]] = sdiv i16 [[AX_0]], [[V6]]
# CHECK-NEXT: [[V8:%.+]] = trunc i16 [[V7]] to i8
# CHECK-NEXT: [[V9:%.+]] = srem i16 [[AX_0]], [[V6]]
# CHECK-NEXT: [[V10:%.+]] = trunc i16 [[V9]] to i8
# CHECK-NEXT: call void @llvm.dc.setreg.i8(i8 [[V8]], metadata !"AL")
# CHECK-NEXT: call void @llvm.dc.setreg.i8(i8 [[V10]], metadata !"AH")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivb	2(%r11,%rbx,2)

## IDIV8r
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 3
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[AX_0:%.+]] = call i16 @llvm.dc.getreg.i16(metadata !"AX")
# CHECK-NEXT: [[BPL_0:%.+]] = call i8 @llvm.dc.getreg.i8(metadata !"BPL")
# CHECK-NEXT: [[V1:%.+]] = sext i8 [[BPL_0]] to i16
# CHECK-NEXT: [[V2:%.+]] = sdiv i16 [[AX_0]], [[V1]]
# CHECK-NEXT: [[V3:%.+]] = trunc i16 [[V2]] to i8
# CHECK-NEXT: [[V4:%.+]] = srem i16 [[AX_0]], [[V1]]
# CHECK-NEXT: [[V5:%.+]] = trunc i16 [[V4]] to i8
# CHECK-NEXT: call void @llvm.dc.setreg.i8(i8 [[V3]], metadata !"AL")
# CHECK-NEXT: call void @llvm.dc.setreg.i8(i8 [[V5]], metadata !"AH")
# CHECK-NEXT: [[EFLAGS_0:%.+]] = call i32 @llvm.dc.getreg.i32(metadata !"EFLAGS")
idivb	%bpl

retq
