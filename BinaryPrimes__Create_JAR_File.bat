REM -----------------------------
REM BinaryPrimes
REM -----------------------------
echo off
cls
REM



REM echo %JAVA_HOME%
REM echo %CLASS_PATH%

REM SET "dirlocation=%JAVA_HOME%\bin\"
GOTO STARTCOMPILE

echo To determine your Java JDK folder location, what machine are you using:
echo  1.  HP Z220 Desktop
echo  2.  HP Elitebook Laptop
echo  3.  CQUni Computer Labs:
echo  4.  CQUni Computer Labs #2:
echo  5.  Centacare HP laptop
echo  6.  Centacare BriTS3
echo  7.  Dell Inspiron 1525 (Windows Vista)
echo  8.  Quit
CHOICE /C:12345678
echo %ERRORLEVEL%


REM NOTE: These IF tests *must* be done in DESCENDING ORDER of ERRORLEVEL.
if ERRORLEVEL 8 GOTO END
if ERRORLEVEL 7 GOTO Dell_Inspiron_1525
if ERRORLEVEL 6 GOTO Centacare_BriTS3
if ERRORLEVEL 5 GOTO Centacare_HP_laptop
if ERRORLEVEL 4 GOTO CQUni_Computer_Labs2
if ERRORLEVEL 3 GOTO CQUni_Computer_Labs
if ERRORLEVEL 2 GOTO HP_Elitebook_Laptop
if ERRORLEVEL 1 GOTO HP_Z220_Desktop


:HP_Z220_Desktop
SET "dirlocation=C:\Program Files (x86)\Java\jdk1.8.0_112\bin\"
GOTO STARTCOMPILE

:HP_Elitebook_Laptop
SET "dirlocation=C:\Program Files (x86)\Java\jdk1.8.0_121\bin\"
GOTO STARTCOMPILE

:CQUni_Computer_Labs
REM 29-Jul-2016  (still using a very OLD version of Java)
SET "dirlocation=C:\Program Files (x86)\Java\jdk1.7.0_67\bin\"
GOTO STARTCOMPILE

:CQUni_Computer_Labs2
REM 29-Jul-2016  (still using a very OLD version of Java)
SET "dirlocation=C:\Program Files (x86)\Java\jdk1.8.0_66\bin\"
GOTO STARTCOMPILE

:Centacare_HP_laptop
SET "dirlocation=C:\Program Files\Java\jdk1.8.0_121\bin\"
GOTO STARTCOMPILE

:Centacare_BriTS3
SET "dirlocation=C:\Program Files\Java\jdk1.8.0_121\bin\"
GOTO STARTCOMPILE

:Dell_Inspiron_1525
SET "dirlocation=C:\Program Files\Java\jdk1.8.0_131\bin\"
GOTO STARTCOMPILE





echo Compile the Java code:
REM "%dirlocation%javac.exe" ..\00__common_code\Benchmark.java
REM "%dirlocation%javac.exe" ..\00__common_code\Network.java
REM "%dirlocation%javac.exe" ..\00__common_code\Testing.java
REM copy ..\00__common_code\*.class .
"%dirlocation%javac.exe" ..\00__common_code\Moose_Utils.java
REM "%dirlocation%javac.exe" ..\00__common_code\SaveLoadApplicationSettings.java
REM "%dirlocation%javac.exe" ..\00__common_code\StringAndCounter.java
REM "%dirlocation%javac.exe" ..\00__common_code\ParentDescriptionCodeLookup.java
REM "%dirlocation%javac.exe" ..\00__common_code\Icons.java
cREM opy ..\00__common_code\*.class .

REM Need the above classes in this local DIR so that the SLK class can access their methods.
REM "%dirlocation%javac.exe" ..\00__common_code\SLK.java
REM copy ..\00__common_code\SLK.class .


:STARTCOMPILE
echo "%dirlocation%"
del /q *.class
echo Create the Manifest file:
echo Main-Class: BinaryPrimes >MANIFEST.MF
echo .



"%dirlocation%javac.exe" BinaryPrimes.java

echo .
echo Build the JAR file:
REM "%dirlocation%jar.exe" cvfm BinaryPrimes.jar MANIFEST.MF *.class *.png ..\icons\*.gif *.jpg BinaryPrimes*.txt
REM "%dirlocation%jar.exe" cfm BinaryPrimes.jar MANIFEST.MF *.class ..\icons\*.gif ..\icons\*.png  BinaryPrimes*.txt Yahtzee_Sounds\*.wav
"%dirlocation%jar.exe" cfm BinaryPrimes.jar MANIFEST.MF *.class

REM
del /q *.class
del /q ..\00__common_code\*.class
REM del *.gif

:END
echo .
echo Finished!
pause