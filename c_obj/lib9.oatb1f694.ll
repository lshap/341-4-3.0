declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh690:
  ret void
}


define i32 @program (i32 %argc1829, { i32, [ 0 x i8* ] }* %argv1827){

__fresh687:
  %argc_slot1830 = alloca i32
  store i32 %argc1829, i32* %argc_slot1830
  %argv_slot1828 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1827, { i32, [ 0 x i8* ] }** %argv_slot1828
  %i1831 = alloca i32
  store i32 1, i32* %i1831
  br label %__cond686

__cond686:
  %_lhs1832 = load i32* %i1831
  %_lhs1833 = load i32* %argc_slot1830
  %bop1834 = icmp slt i32 %_lhs1832, %_lhs1833
  br i1 %bop1834, label %__body685, label %__post684

__fresh688:
  br label %__body685

__body685:
  %_lhs1835 = load i32* %i1831
  %array_dereferenced1836 = load { i32, [ 0 x i8* ] }** %argv_slot1828
  %len_ptr1837 = getelementptr { i32, [ 0 x i8* ] }* %array_dereferenced1836, i32 0, i32 0
  %len1838 = load i32* %len_ptr1837
  call void @oat_array_bounds_check( i32 %len1838, i32 %_lhs1835 )
  %elt_ptr1839 = getelementptr { i32, [ 0 x i8* ] }* %array_dereferenced1836, i32 0, i32 1, i32 %_lhs1835
  %_lhs1840 = load i8** %elt_ptr1839
  call void @print_string( i8* %_lhs1840 )
  %_lhs1841 = load i32* %i1831
  %bop1842 = add i32 %_lhs1841, 1
  store i32 %bop1842, i32* %i1831
  br label %__cond686

__fresh689:
  br label %__post684

__post684:
  %_lhs1843 = load i32* %argc_slot1830
  ret i32 %_lhs1843
}


