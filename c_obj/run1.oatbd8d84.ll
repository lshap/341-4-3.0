declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@garr476 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by garr476.init
@i463 = global i32 42, align 4
define void @oat_init (){

__fresh132:
  call void @garr476.init(  )
  ret void
}


define i32 @program (i32 %argc489, { i32, [ 0 x i8* ] }* %argv487){

__fresh129:
  %argc_slot490 = alloca i32
  store i32 %argc489, i32* %argc_slot490
  %argv_slot488 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv487, { i32, [ 0 x i8* ] }** %argv_slot488
  %array_ptr491 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array492 = bitcast { i32, [ 0 x i32 ] }* %array_ptr491 to { i32, [ 0 x i32 ] }* 
  %index_ptr493 = getelementptr { i32, [ 0 x i32 ] }* %array492, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr493
  %index_ptr494 = getelementptr { i32, [ 0 x i32 ] }* %array492, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr494
  %index_ptr495 = getelementptr { i32, [ 0 x i32 ] }* %array492, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr495
  %index_ptr496 = getelementptr { i32, [ 0 x i32 ] }* %array492, i32 0, i32 1, i32 3
  store i32 4, i32* %index_ptr496
  %arr497 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array492, { i32, [ 0 x i32 ] }** %arr497
  %p498 = alloca i32
  store i32 0, i32* %p498
  %j499 = alloca i32
  store i32 0, i32* %j499
  br label %__cond128

__cond128:
  %_lhs500 = load i32* %j499
  %bop501 = icmp slt i32 %_lhs500, 100
  br i1 %bop501, label %__body127, label %__post126

__fresh130:
  br label %__body127

__body127:
  %_lhs502 = load i32* %p498
  %bop503 = add i32 %_lhs502, 1
  store i32 %bop503, i32* %p498
  %_lhs504 = load i32* %j499
  %bop505 = add i32 %_lhs504, 1
  store i32 %bop505, i32* %j499
  br label %__cond128

__fresh131:
  br label %__post126

__post126:
  %_lhs506 = load { i32, [ 0 x i32 ] }** %arr497
  %ret507 = call i32 @g ( { i32, [ 0 x i32 ] }* %_lhs506 )
  %_lhs508 = load i32* @i463
  %ret509 = call i32 @f ( i32 %_lhs508 )
  %bop510 = add i32 %ret507, %ret509
  %len_ptr511 = getelementptr { i32, [ 0 x i32 ] }** %arr497, i32 0, i32 0
  %len512 = load i32* %len_ptr511
  call void @oat_array_bounds_check( i32 %len512, i32 3 )
  %array_dereferenced513 = load { i32, [ 0 x i32 ] }** %arr497
  %elt_ptr514 = getelementptr { i32, [ 0 x i32 ] }* %array_dereferenced513, i32 0, i32 1, i32 3
  %_lhs515 = load i32* %elt_ptr514
  %ret516 = call i32 @f ( i32 %_lhs515 )
  %bop517 = add i32 %bop510, %ret516
  %len_ptr518 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr476, i32 0, i32 0
  %len519 = load i32* %len_ptr518
  call void @oat_array_bounds_check( i32 %len519, i32 1 )
  %array_dereferenced520 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr476
  %elt_ptr521 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array_dereferenced520, i32 0, i32 1, i32 1
  %len_ptr522 = getelementptr { i32, [ 0 x i32 ] }** %elt_ptr521, i32 0, i32 0
  %len523 = load i32* %len_ptr522
  call void @oat_array_bounds_check( i32 %len523, i32 1 )
  %array_dereferenced524 = load { i32, [ 0 x i32 ] }** %elt_ptr521
  %elt_ptr525 = getelementptr { i32, [ 0 x i32 ] }* %array_dereferenced524, i32 0, i32 1, i32 1
  %_lhs526 = load i32* %elt_ptr525
  %ret527 = call i32 @f ( i32 %_lhs526 )
  %bop528 = add i32 %bop517, %ret527
  %_lhs529 = load i32* %p498
  %ret530 = call i32 @f ( i32 %_lhs529 )
  %bop531 = add i32 %bop528, %ret530
  ret i32 %bop531
}


define i32 @g ({ i32, [ 0 x i32 ] }* %y480){

__fresh125:
  %y_slot481 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %y480, { i32, [ 0 x i32 ] }** %y_slot481
  %len_ptr482 = getelementptr { i32, [ 0 x i32 ] }** %y_slot481, i32 0, i32 0
  %len483 = load i32* %len_ptr482
  call void @oat_array_bounds_check( i32 %len483, i32 2 )
  %array_dereferenced484 = load { i32, [ 0 x i32 ] }** %y_slot481
  %elt_ptr485 = getelementptr { i32, [ 0 x i32 ] }* %array_dereferenced484, i32 0, i32 1, i32 2
  %_lhs486 = load i32* %elt_ptr485
  ret i32 %_lhs486
}


define i32 @f (i32 %x477){

__fresh124:
  %x_slot478 = alloca i32
  store i32 %x477, i32* %x_slot478
  %_lhs479 = load i32* %x_slot478
  ret i32 %_lhs479
}


define void @garr476.init (){

__fresh123:
  %array_ptr464 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array465 = bitcast { i32, [ 0 x i32 ] }* %array_ptr464 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr466 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array467 = bitcast { i32, [ 0 x i32 ] }* %array_ptr466 to { i32, [ 0 x i32 ] }* 
  %index_ptr468 = getelementptr { i32, [ 0 x i32 ] }* %array467, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr468
  %index_ptr469 = getelementptr { i32, [ 0 x i32 ] }* %array467, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr469
  %index_ptr470 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array465, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array467, { i32, [ 0 x i32 ] }** %index_ptr470
  %array_ptr471 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array472 = bitcast { i32, [ 0 x i32 ] }* %array_ptr471 to { i32, [ 0 x i32 ] }* 
  %index_ptr473 = getelementptr { i32, [ 0 x i32 ] }* %array472, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr473
  %index_ptr474 = getelementptr { i32, [ 0 x i32 ] }* %array472, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr474
  %index_ptr475 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array465, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array472, { i32, [ 0 x i32 ] }** %index_ptr475
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array465, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr476
  ret void
}


