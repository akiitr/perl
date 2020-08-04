use strict;
use warnings;

$\ = "\n";

my @arr = (2.2, 'anu', 25);

print "Print the array element without spaca";
print @arr;
print "Print the array element with space";
print "@arr";
print '';

my $len = scalar @arr;

print "The no of elements and length of the array is $len";
print "All thsese elements are the scalar so indexing will be with \$";

#also gives the length of the array
my $item = @arr;
print "The no of item in the @arr is: $item";

# Finding the index of the last element using '#'
my $lastindex = $#arr;
print " The index of last element is $lastindex";

#indexing 
print "The first element is: $arr[0]";
print "The last element is: $arr[$#arr]";

# Updation of array element
$arr[1] = 'Anubhav Kumar';
$arr[-3] *= 2; # multiplying with 2 for the 3rd element from the back
print "Changeing the name and multiplying the 3rd element from the back with 2";
print " The updated array is @arr";

#inserting the element
#at the end of the array
push @arr, 'Qualcomm';
print "Updated Qualcomm at last Array: @arr";

#at the begin
unshift @arr, 'Banglore';
print "Updated city at the beginng Array: @arr";

#deleting the elements
#from end of array
my $delvalue = pop @arr;
print "deleted value from last: $delvalue, Arrray is: @arr";

#From begin the array
$delvalue = shift @arr;
print "deleted value from begin: $delvalue, Arrray is: @arr";

#inserting the eleent in between
splice @arr, 2, 0, 'Snapdragon'; # 0 for add and 1 or >1 for replce 1 or more with passed element
print " Added a element in between the array the updated array is: @arr";


#inserting with replacing the last two elements
splice @arr, 2, 2, ('Snapdragon', 'Processor');
print " Added a element in between the array replacing 2 elements from 2nd position updated array is: @arr";

#Inserting an array elements in the another array
my @other = ('SD765', 'SD875', 'SD735');
splice @arr, 2, 0, @other;
print " Added a array element from 3rd position not replacing updated array is: @arr";

#Reverse
my @rev = reverse @arr;
print "The reverse of the array is: @rev";

# Sorted array
my @sorted = sort @arr;
print "The sorted of the array default in ascending order is: @sorted";

# Sort Descending in manual
@sorted = sort {$b cmp $a} @arr;
print "The sorted of the array manual in descending order is: @sorted";

# Sort Ascending in manual
@sorted = sort {$a cmp $b} @arr;
print "The sorted of the array manual in ascending order is: @sorted";

# Sorting based on Numerical sorting
@sorted = sort {$a <=> $b} @arr;
print "The sorted of the array numerical manual in ascending order is: @sorted";

# Sorting based on Numerical sorting
@sorted = sort {$b <=> $a} @arr;
print "The sorted of the array numerical manual in descending order is: @sorted";
