/'
“This is an instance of a principle that we will encounter repeatedly:
the form of a mathematical expression and the way the expression
should be evaluated in actual practice may be quite different.”
'/
Declare Function Quite ( ByRef Cos As T1, ByRef Exp As T2, ByRef Sin As T3 ) As Integer

Type Cos 
    Dim CosTypes As T1 
End Type 

Type Exp
    Dim ExpEvent As T2
End Type 

Type Sin 
    Dim SinObjes As T3 
End Type 

#define str2(s) mid((s),1)

dim s1 as string*80=chr(0)+"Alpha"+chr(0)+"Beta"
print asc(s1)
print s1
print

dim s2 as string*80
s2=str2(chr(0)+"Alpha"+chr(0)+"Beta")
print asc(s2)
print s2
print

dim s3 as string
s3=chr(0)+"Alpha"+chr(0)+"Beta"
print asc(s3)
print s3
print

dim s4 as zstring*80
s4=str2(chr(0)+"Alpha"+chr(0)+"Beta")
print asc(s4)
print s4
print
sleep 

End 
