{$MODE DELPHI}

uses
   crt;

type
   ar1d_int=array of longint;
   ar1d_real=array of extended;
   ar2d_int=array of ar1d_int;
   ar2d_real=array of ar1d_real;
   TArray: array [1..5] of Integer;

var
   NumberOfPassedTests, TestsCounter:integer;

// summarize
procedure total; forward;

procedure test_1D_array_int(result4:ar1d_int;expected4:ar1d_int;n4:longint);forward;
procedure test_1D_array_real(result5:ar1d_real;expected5:ar1d_real;n5:longint);forward;
procedure test_2D_array_int(result6:ar2d_int;expected6:ar2d_int;n6:longint;m6:longint);forward;
procedure test_2D_array_real(result7:ar2d_real;expected7:ar2d_real;n7:longint;m7:longint);forward;

procedure test_1D_array_int(result4:ar1d_int;expected4:ar1d_int;n4:longint);
var i:integer;
 begin
        inc(TestsCounter);
        for i:=1 to n4 do
        if result4[i]<>expected4[i] then
         begin
                textcolor(12);
                write('Failed. ');
                textcolor(7);
                write('[');
                textcolor(14);
                write(i);
                textcolor(7);
                write('] : ');
                textcolor(11);
                write(expected4[i]);
                textcolor(7);
                write(' expected but ');
                textcolor(12);
                write(result4[i]);
                textcolor(7);
                writeln(' found.');
                exit;
         end;
        inc(NumberOfPassedTests);
        textcolor(10);
        writeln('Passed.');
        textcolor(7);
 end;

procedure test_1D_array_real(result5:ar1d_real;expected5:ar1d_real;n5:longint);
var i:integer;
 begin
        inc(TestsCounter);
        for i:=1 to n5 do
        if result5[i]<>expected5[i] then
        begin
                textcolor(12);
                write('Failed. ');
                textcolor(7);
                write('[');
                textcolor(14);
                write(i);
                textcolor(7);
                write('] : ');
                textcolor(11);
                write(expected5[i]:1:4);
                textcolor(7);
                write(' expected but ');
                textcolor(12);
                write(result5[i]:1:4);
                textcolor(7);
                writeln(' found.');
                exit;
         end;
        inc(NumberOfPassedTests);
        textcolor(10);
        writeln('Passed.');
        textcolor(7);
 end;

procedure test_2D_array_int(result6:ar2d_int;expected6:ar2d_int;n6:longint;m6:longint);
var i,j:integer;
 begin
        inc(TestsCounter);
        for i:=1 to n6 do
        for j:=1 to m6 do
        if result6[i,j]<>expected6[i,j] then
        begin
                textcolor(12);
                write('Failed. ');
                textcolor(7);
                write('[');
                textcolor(14);
                write(i);
                textcolor(7);
                write(',');
                textcolor(14);
                write(j);
                textcolor(7);
                write('] : ');
                textcolor(11);
                write(expected6[i,j]);
                textcolor(7);
                write(' expected but ');
                textcolor(12);
                write(result6[i,j]);
                textcolor(7);
                writeln(' found.');
                exit;
         end;
        inc(NumberOfPassedTests);
        textcolor(10);
        writeln('Passed.');
        textcolor(7);
 end;

procedure test_2D_array_real(result7:ar2d_real;expected7:ar2d_real;n7:longint;m7:longint);
var i,j:integer;
 begin
        inc(TestsCounter);
        for i:=1 to n7 do
        for j:=1 to m7 do
        if result7[i,j]<>expected7[i,j] then
        begin
                textcolor(12);
                write('Failed. ');
                textcolor(7);
                write('[');
                textcolor(14);
                write(i);
                textcolor(7);
                write(',');
                textcolor(14);
                write(j);
                textcolor(7);
                write('] : ');
                textcolor(11);
                write(expected7[i,j]:1:4);
                textcolor(7);
                write(' expected but ');
                textcolor(12);
                write(result7[i,j]:1:4);
                textcolor(7);
                writeln(' found.');
                exit;
         end;
        inc(NumberOfPassedTests);
        textcolor(10);
        writeln('Passed.');
        textcolor(7);
 end;

procedure total;
 begin
        writeln;
        write('Total: ');
        textcolor(11);
        write(TestsCounter);
        textcolor(7);
        write(' Passed: ');
        textcolor(10);
        write(NumberOfPassedTests);
        textcolor(7);
        write(' Failed: ');
        textcolor(12);
        writeln(TestsCounter-NumberOfPassedTests);
        textcolor(7);
 end;

 procedure AssertEqualTrue(expectedValue: integer; resultValue: integer); overload; forward;
 
 procedure AssertEqualTrue(expectedValue: integer; resultValue: integer);
 begin
    inc(TestsCounter);
    if expectedValue= resultValue then
       inc(NumberOfPassedTests);
 end;

procedure AssertEqualTrue(expectedValue: real; resultValue: real); overload; forward;
 
 procedure AssertEqualTrue(expectedValue: real; resultValue: real);
 begin
    inc(TestsCounter);
    if expectedValue= resultValue then
       inc(NumberOfPassedTests);
 end;

 procedure AssertEqualTrue(expectedValue: string; resultValue: string); overload; forward;
 
 procedure AssertEqualTrue(expectedValue: string; resultValue: string);
 begin
    inc(TestsCounter);
    if expectedValue= resultValue then
       inc(NumberOfPassedTests);
 end;
 
procedure TestTest_AfterOneTestAboutIntegerTheTestsCounterIsOneMore;
var
   TestsCounterBefore, TestsCounterAfter: LongInt;
begin
   TestsCounterBefore := TestsCounter;
   AssertEqualTrue(1,2);
   TestsCounterAfter := TestsCounter;
   
   if (TestsCounterAfter = TestsCounterBefore + 1) then
      writeln('After One Test About Integer The Tests Counter One More');
end;

procedure TestTest_AfterOneTestAboutRealTheTestsCounterIsOneMore;
var
   TestsCounterBefore, TestsCounterAfter: LongInt;
begin
   TestsCounterBefore := TestsCounter;
   AssertEqualTrue(1.0,2.0);
   TestsCounterAfter := TestsCounter;
   
   if (TestsCounterAfter = TestsCounterBefore + 1) then
      writeln('After One Test About Real The Tests Counter One More');
end;

procedure TestTest_AfterOneTestAboutStringTheTestsCounterIsOneMore;
var
   TestsCounterBefore, TestsCounterAfter: LongInt;
begin
   TestsCounterBefore := TestsCounter;
   AssertEqualTrue('Hello World','Help the world');
   TestsCounterAfter := TestsCounter;
   
   if (TestsCounterAfter = TestsCounterBefore + 1) then
      writeln('After One Test About String The Tests Counter One More');
end;

procedure TestTest_AfterOnePassedTestTheNumberOfPassedTestsIsOneMore;
var
   NumberOfPassedTestsBefore, NumberOfPassedTestsAfter: LongInt;
begin
   NumberOfPassedTestsBefore := NumberOfPassedTests;
   AssertEqualTrue(1, 1);
   NumberOfPassedTestsAfter := NumberOfPassedTests;
   if (NumberOfPassedTestsAfter = NumberOfPassedTestsBefore + 1) then
      writeln('After One Passed Test The Number Of Passed Tests Is One More');
end;

var
   array1, array2: TArray;

begin
   TestTest_AfterOnePassedTestTheNumberOfPassedTestsIsOneMore;
   TestTest_AfterOneTestAboutRealTheTestsCounterIsOneMore;
   TestTest_AfterOneTestAboutIntegerTheTestsCounterIsOneMore;
   TestTest_AfterOneTestAboutStringTheTestsCounterIsOneMore;
   WriteLn(array1 = array2)
end.
