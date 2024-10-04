#!/bin/bash

# Function to write random numbers to a file
num_writer() {
  echo $1 >> $output_file
}

# Check if the number of random numbers is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <num_rands> [min] [max]"
  exit 1
fi

# Set variables
num_rands=$1
min=${2:-1}  # Default min to 1
max=${3:-32767}  # Default max to 32767

# Generate the output file name
output_file="rands_${num_rands}.txt"
> $output_file  # Clear the file if it exists

# Generate random numbers, find min, max, and calculate sum for the average
sum=0
smallest=$max
largest=$min

for ((i = 1; i <= num_rands; i++)); do
  rand_num=$((RANDOM % (max - min + 1) + min))
  num_writer $rand_num
  sum=$((sum + rand_num))
  
  if [ $rand_num -lt $smallest ]; then
    smallest=$rand_num
  fi
  
  if [ $rand_num -gt $largest ]; then
    largest=$rand_num
  fi
done

average=$(echo "$sum / $num_rands" | bc)

# Output results
echo "You requested $num_rands numbers [between $min and $max]"
echo "The smallest value generated was $smallest"
echo "The largest value generated was $largest"
echo "The average value generated was $average"
