declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1872.str. = private unnamed_addr constant [ 14 x i8 ] c "Hello world!
\00", align 4
@_oat_string1872 = global i8* getelementptr inbounds ([ 14 x i8 ]* @_oat_string1872.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh349:
  ret void
}


define i32 @program (i32 %argc1870, { i32, [ 0 x i8* ] }* %argv1868){

__fresh348:
  %argc_slot1871 = alloca i32
  store i32 %argc1870, i32* %argc_slot1871
  %argv_slot1869 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1868, { i32, [ 0 x i8* ] }** %argv_slot1869
  %strval1873 = load i8** @_oat_string1872
  %str1874 = alloca i8*
  store i8* %strval1873, i8** %str1874
  %_lhs1875 = load i8** %str1874
  call void @print_string( i8* %_lhs1875 )
  ret i32 0
}


