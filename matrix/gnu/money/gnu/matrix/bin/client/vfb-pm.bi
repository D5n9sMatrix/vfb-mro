/'
(The statement in quotes appears word for word in several places in the book.)
Standard textbooks on “matrices for statistical applications” emphasize
their uses in the analysis of traditional linear models. This is a large and im-
portant field in which real matrices are of interest, and the important kinds of
real matrices include symmetric, positive definite, projection, and generalized
inverse matrices. This area of application also motivates much of the discussion
in this book. In other areas of statistics, however, there are different matrices
'/
Declare Function Matrix ( ByRef Linear As T1, ByRef Application As T2, ByRef Books As T3 )

Type Linear
    Dim LinearTypes As T1 
End Type 

Type Application
    Dim ApplicationEvent As T2 
End Type 

Type Books
    Dim BooksObjes As T3 
End Type 

dim s1 as string*80=chr(0)+"Alpha"+chr(0)+"Beta"
print "lenght=";IIf(InStr(s, Chr(0)) > 0, InStr(s, Chr(0)) - 1, Len(s));" !!!!"
print s1
sleep

dim s2 as string*80=chr(0)+"Alpha"+chr(0)+"Beta"
print "lenght=";IIf(InStr(s, Chr(0)) > 0, InStr(s, Chr(0)) - 1, Len(s));" !!!!"
print s2
sleep

dim s3 as string*80=chr(0)+"Alpha"+chr(0)+"Beta"
print "lenght=";IIf(InStr(s, Chr(0)) > 0, InStr(s, Chr(0)) - 1, Len(s));" !!!!"
print s3
sleep

dim s4 as string*80=chr(0)+"Alpha"+chr(0)+"Beta"
print "lenght=";IIf(InStr(s, Chr(0)) > 0, InStr(s, Chr(0)) - 1, Len(s));" !!!!"
print s4
sleep

End 
