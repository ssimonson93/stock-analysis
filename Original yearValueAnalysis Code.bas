Attribute VB_Name = "Module2"
Sub yearValueAnalysis()

Dim starTime As Single
Dim endTime As Single

    yearValue = InputBox("On what year would you like to run the analysis?")

    startTime = Timer
    
'1) FOrmat the output sheet on All Stocks Analysis worksheet

    Worksheets("All Stocks Analysis").Activate


'add column headers
        Range("A1").Value = "All Stocks (" + yearValue + ")"
            
        Cells(3, 1).Value = "Ticker"
        Cells(3, 2).Value = "Total Daily Volume"
        Cells(3, 3).Value = "Return"
        
'2) Initialize array of all tickers

    Dim tickers(11) As String

        tickers(0) = "AY"
        tickers(1) = "CSIQ"
        tickers(2) = "DQ"
        tickers(3) = "ENPH"
        tickers(4) = "FSLR"
        tickers(5) = "HASI"
        tickers(6) = "JKS"
        tickers(7) = "RUN"
        tickers(8) = "SEDG"
        tickers(9) = "SPWR"
        tickers(10) = "TERP"
        tickers(11) = "VSLR"
        
'3a) Initialize variables for starting price and ending price
        
    Dim startingPrice As Single
    Dim endingPrice As Single
    
'3b) Activate data worksheet
    
    Worksheets(yearValue).Activate
    
'3c) Get the number of rows to loop over
    
    RowCount = Cells(Rows.Count, "A").End(xlUp).Row

'4) Loop through tickers

        For i = 0 To 11
            ticker = tickers(i)
            totalVolume = 0
            
'5) Loop through rows in the data
            
            Worksheets(yearValue).Activate
                        For j = 2 To RowCount
                        
'5a) Get total volume for current ticker
                        
                            If Cells(j, 1).Value = ticker Then
                                totalVolume = totalVolume + Cells(j, 8).Value
                            End If
                            
'5b) Get starting price for current ticker
                            
                            If Cells(j - 1, 1).Value <> ticker And Cells(j, 1).Value = ticker Then
                                startingPrice = Cells(j, 6).Value
                            End If
                            
'5c) Get ending price for current ticker
                            
                            If Cells(j + 1, 1).Value <> ticker And Cells(j, 1).Value = ticker Then
                                endingPrice = Cells(j, 6).Value
                            End If
                        Next j
                        
'6) Output data for current ticker
                            
            Worksheets("All Stocks Analysis").Activate
            
            Cells(4 + i, 1).Value = ticker
            Cells(4 + i, 2).Value = totalVolume
            Cells(4 + i, 3).Value = endingPrice / startingPrice - 1
        Next i
           
   

'formatting Return to be percentage
    
    Range("B:B").NumberFormat = "$#,##.00"
    Range("C:C").NumberFormat = "0.00%"
    
' more formatting

    Columns("A:Z").AutoFit
    Rows("1:100").AutoFit
    
  
' Formatting return for color
    dataRowStart = 4
    dataRowEnd = 15
    
        For i = dataRowStart To dataRowEnd
            If Cells(i, 3).Value > 0 Then
                Cells(i, 3).Interior.Color = vbGreen
            ElseIf Cells(i, 3).Value < 0 Then
                Cells(i, 3).Interior.Color = vbRed
            Else
                Cells(i, 3).Interior.Color = xlNone
            End If
        Next i

    endTime = Timer
    
    MsgBox "This code ran in " & (endTime - startTime) & " seconds for the year " & (yearValue)


End Sub
