declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@str901 = global i8* zeroinitializer, align 4		; initialized by str901.init
define void @oat_init (){

__fresh321:
  call void @str901.init(  )
  ret void
}


define i32 @program (i32 %argc904, { i32, [ 0 x i8* ] }* %argv902){

__fresh320:
  %argc_slot905 = alloca i32
  store i32 %argc904, i32* %argc_slot905
  %argv_slot903 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv902, { i32, [ 0 x i8* ] }** %argv_slot903
  %_lhs906 = load i8** @str901
  call void @print_string( i8* %_lhs906 )
  ret i32 0
}


define void @str901.init (){

__fresh315:
  %array_ptr893 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array894 = bitcast { i32, [ 0 x i32 ] }* %array_ptr893 to { i32, [ 0 x i32 ] }* 
  %i898 = alloca i32
  store i32 1, i32* %i898
  %i892 = load i32* %i898
  br label %__check313

__fresh316:
  br label %__check313

__check313:
  br label %__end312

__fresh317:
  %cmp_op896 = icmp slt i32 %i892, 3
  br i32 %cmp_op896, label %__body314, label %__end312

__fresh318:
  br label %__body314

__body314:
  %elem_ptr895 = getelementptr { i32, [ 0 x i32 ] }* %array894, i32 0, i32 1, i32 %i892
  store i32 110, i32* %elem_ptr895
  %index_op897 = add i32 %i892, 1
  br label %__check313

__fresh319:
  br label %__end312

__end312:
  %ret900 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %array894 )
  store i8* %ret900, i8** @str901
  ret void
}


