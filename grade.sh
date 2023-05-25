CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ ! -e student-submission/ListExamples.java ]]
then
    echo "Error: ListExamples.java not found in submission directory"
    exit 1
fi

cp student-submission/ListExamples.java grading-area/
cp TestListExamples.java grading-area/
cp -r lib grading-area/
cd grading-area/

javac -cp $CPATH *.java
# java -cp $CPATH TestListExamples
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

# java TestListExamples > out2.txt 2>&1
# cat out2.txt
# if [[ $? -ne 0 ]]
# then
#     echo  "Error: Compilation failed"
#     exit 1
# fi
# java TestListExamples.java >out.txt 2>&1
# cat out.txt
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
