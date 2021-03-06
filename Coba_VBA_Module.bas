Attribute VB_Name = "Module1"
Sub LoopStock()

'We first define our variables.
Dim ws As Worksheet
Dim Count As Double
Count = 0
Start = 2
Dim Change As Double
Dim percentChange As Double
Dim min As Double
Dim max As Double
Dim maxVol As Double
j = 0 'This keeps track of the number of unique ticker
Range("I1").Value = "Ticker"
Range("J1").Value = "Yearly Change"
Range("L1").Value = "Total Stock Volume"
Range("K1").Value = "Percent Change"
Range("O1").Value = "Geatest Percent Increase"
Range("O2").Value = "Greatest Percent Decrease"
Range("O3").Value = "Greatest Total Volume"

'Now we will define our commands
For Each ws In Worksheets

    For i = 2 To 705714
        
        If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
            Range("I" & 2 + j).Value = Cells(i, 1).Value
           
            Range("L" & 2 + j).Value = Count
            Change = (Cells(i, 6) - Cells(Start, 3))
            Range("J" & 2 + j).Value = Change
            
            percentChange = Round((Change / Cells(Start, 3) * 100), 2)
            Range("K" & 2 + j).Value = percentChange
            Count = 0
            j = j + 1
            Start = Start + 1
        
        Else
            Count = Count + Cells(i, "G").Value
            
            End If
        
    Next i
    
    max = 0
    maxTicker = ""
    min = 0
    minTicker = ""
    maxVol = 0
    maxVolTicker = ""
    
    For i = 2 To j + 1
        If Range("K" & i).Value >= max Then
            max = Range("K" & i).Value
            maxTicker = Range("I" & i).Value
        End If
        If Range("K" & i).Value <= min Then
            min = Range("K" & i).Value
            minTicker = Range("I" & i).Value
        End If
        If Range("L" & i).Value >= maxVol Then
            maxVol = Range("L" & i).Value
            maxVolTicker = Range("I" & i).Value
        End If
    Next i
        
    'Finally, we will choose the cells we want to print the results from our commands we ran.
    Cells(1, "Q").Value = max
    Cells(1, "P").Value = maxTicker
    Cells(2, "Q").Value = min
    Cells(2, "P").Value = minTicker
    Cells(3, "Q").Value = maxVol
    Cells(3, "P").Value = maxVolTicker

    ws.Activate
    Debug.Print ws.Name
Next

End Sub

'---------------------------------------------------------------------------------------------
'This was extra stuff I started to use but it did not give me results so I stashed it aside and used other methods.

'max = WorksheetFunction.max(Range("K2:K" & j))
'Cells(1, "P").Value = max
'min = WorksheetFunction.min(Range("K2:K" & j))
'Cells(2, "P").Value = min
'maxVol = WorksheetFunction.max(Range("L2:L" & j))
'Cells(3, "P").Value = maxVol
'
'
'matchIndex = Application.WorksheetFunction.Match(max, "K2:K" & j, False)
'Range("R1").Value = Application.WorksheetFunction.Index("I2:I" & j, matchIndex)
'
'matchIndex = Application.WorksheetFunction.Match(min, "K2:K" & j, False)
'Range("R2").Value = Application.WorksheetFunction.Index("I2:I" & j, matchIndex)
'
'matchIndex = Application.WorksheetFunction.Match(maxVol, "L2:L" & j, False)
'Range("R3").Value = Application.WorksheetFunction.Index("I2:I" & j, matchIndex)
'
   



    

