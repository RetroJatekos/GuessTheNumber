# Guess the number! game
# Made by RetroJ t‚kos
# 	08/20/2017


print "\nGuess the number!\n\n";

# Input the maximum
until ($max > 1) {
	print "Please, enter the maximum! ";
	$max = <STDIN>;
	$max = int($max);	# Convert to integer
}

print "I generated an integer number between 1 and $max. What is this number?\n";
$number = int(rand($max)) + 1;	# Generating random number
$attempt = 0;		# Number of attempts
until ($tip == $number) {
	$attempt++;
	print "$attempt. tip: ";
	$tip = <STDIN>;	# Read the tip
	if ($tip == $number) {
		print "You win!\n";
	}
	if ($tip < $number) {
		print "The number is greater!\n";
	}
	if ($tip > $number) {
		print "The number is smaller!\n";
	}
}
print "You got it right in $attempt attempt(s).\n";
# Calculating score
$score = int( 100 * $max * ( ( log($max)/log(2) ) / $attempt ) );
print "Your score in the first game: $score.\n\n";

print "I generated two numbers, between 1 and $max. What is the sum and the\n";
print "product of the two numbers?\n";
print "You have only three attempts!\n";
$number1 = int(rand($max)) + 1;		# Generating random numbers
$number2 = int(rand($max)) + 1;
$sum = $number1 + $number2;		# Calculating sum
$product = $number1 * $number2;		# Calculating product
$attempt = 0;		# Number of attempts
$sorrectSum = 0;		# Hit the sum?
$correctProduct = 0;		# Hit the product?
$exit = 0;			# Exit condition
until ($exit == 1) {
	$attempt++;
	print "$attempt. tip:\n";
	print "Sum: ";
	$sumTip = <STDIN>;		# Read the sum tip
	print "Product: ";
	$productTip = <STDIN>;		# Read the product tip
	# Verify tips
	if ($sumTip == $sum) {
		print "You hit the sum!\n";
		$correctSum = 1;
	}
	if ($sumTip < $sum) {
		print "The sum is greater!\n";
		$correctSum = 0;
	}
	if ($sumTip > $sum) {
		print "The sum is smaller!\n";
		$correctSum = 0;
	}
	if ($productTip == $product) {
		print "You hit the product!\n";
		$correctProduct = 1;
	}
	if ($productTip < $product) {
		print "The product is greater!\n";
		$correctProduct = 0;
	}
	if ($productTip > $product) {
		print "The product is smaller!\n";
		$correctProduct = 0;
	}
	# After 3 attempts, the second game will exit.
	if ($attempt == 3) {
		$exit = 1;
	}
	# If hit both, then exit.
	if ( ($sumTip==$sum) and ($productTip==$product) ) {
		$exit = 1;
	}
}
# Evaluate results
if ($correctSum+$correctProduct == 2) {
	print "You hit both!\n";
}
if ($correctSum+$correctProduct == 1) {
	print "You hit either!\n";
}
if ($correctSum+$correctProduct == 0) {
	print "You hit neither.\n";
}
$score1 = 100 / (abs($sumTip-$sum)+1);
$score2 = 100 / (abs($productTip-$product)+1);
$score = int( ($score1 + $score2) * $max );
print "Your score in the 2nd game: $score.\n";
print "The numbers are $number1 and $number2.\n";
