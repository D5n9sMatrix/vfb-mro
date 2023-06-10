/'
The difference between an expression and a computing method is em-
phasized. For example, often we may write the solution to the linear system
Ax = b as A−1b. Although this is the solution (so long as A is square and of
full rank), solving the linear system does not involve computing A−1. We may
write A−1b, but we know we can compute the solution without inverting the
matrix.
'/
Declare Function Ax ( ByRef A As T1, ByRef B As T2, ByRef C As T3) As Integer

Type A 
    Dim A As T1 
End Type 

Type B 
    Dim B As T2 
End Type 

Type C 
    Dim C As T3 
End Type 


Dim r1 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print r1

Dim r2 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print r2

Dim r3 As String * 20 = "Alpha" + Chr(0) + "Beta"
Print r3


Sleep

End
