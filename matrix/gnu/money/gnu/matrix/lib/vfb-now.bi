/'
Throughout the book, some attention is given to numerical methods for
computing the various quantities discussed. This is in keeping with my be-
lief that statistical computing should be dispersed throughout the statistics
curriculum and statistical literature generally. Thus, unlike in other books
on matrix “theory,” I describe the “modified” Gram-Schmidt method, rather
than just the “classical” GS. (I put “modified” and “classical” in quotes be-
cause, to me, GS is MGS. History is interesting, but in computational matters,
I do not care to dwell on the methods of the past.) Also, condition numbers
of matrices are introduced in the “theory” part of the book, rather than just
in the “computational” part. Condition numbers also relate to fundamental
properties of the model and the data.
'/
Declare Function OutputKey ( ByRef Pic1 As T1, ByRef Pic2 As T2, ByRef Pic3 As T3) As Integer

Type Pic1
    Dim Pic1Types As T1 
End Type 

Type Pic2
    Dim Pic2Event As T2 
End Type 

Type Pic3
    Dim Pic3Objes As T3 
End Type 

Dim s1 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print s
Print "'" & s & "'"
Dim As String s1 = s
Print s1

Dim s2 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print s
Print "'" & s & "'"
Dim As String s2 = s
Print s2

Dim s3 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print s
Print "'" & s & "'"
Dim As String s3 = s
Print s3

Sleep
End
