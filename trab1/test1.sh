FILE_EXEC=exec1.x

llvm-objdump-10 -h $FILE_EXEC | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()[:4]))\")" > testl.txt
llvm-objdump-10 -t $FILE_EXEC | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()))\")" >> testl.txt
llvm-objdump-10 -M=no-aliases -d $FILE_EXEC | cut -f1,2,3 | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()))\")" >> testl.txt


./my_objdump -h $FILE_EXEC | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()[:4]))\")" > testm.txt
./my_objdump -t $FILE_EXEC | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()))\")" >> testm.txt
./my_objdump -d $FILE_EXEC | cut -f1,2,3 | python3 -c "exec(\"import sys\nfor line in sys.stdin: print(' '.join(line.split()))\")" >> testm.txt 


grep -Fxvf testl.txt testm.txt > diff.txt
