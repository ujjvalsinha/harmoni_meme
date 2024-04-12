/*

Problem Statement: Maximum Sum Subarray
You are given an array of integers, and your task is to find the contiguous subarray with the maximum sum. In other words, you need to determine the subarray that has the largest sum among all possible contiguous subarrays.
Write a function or algorithm to solve this problem efficiently, with the following specifications:

(Please do not use google or 3rd party tools which auto generates code for Challenge Part 2)
Input:
An array of integers, where 1 ≤ n ≤ 10^5, and each element of the array is an integer between -10^4 and 10^4.
Output:
Return the sum of the maximum sum subarray.
Example:
Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
Output: 6
Explanation: The contiguous subarray [4, -1, 2, 1] has the maximum sum (4 + (-1) + 2 + 1 = 6).

*/

int maxArray(List<int> arr) {
  int maximumCurrent = arr[0];
  int maximumGlobal = arr[0];

  for (int i = 1; i < arr.length; i++) {
    maximumCurrent =
        (arr[i] > maximumCurrent + arr[i]) ? arr[i] : maximumCurrent + arr[i];

    if (maximumCurrent > maximumGlobal) {
      maximumGlobal = maximumCurrent;
    }
  }

  return maximumGlobal;
}

void main() {
  List<int> data = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  int getMaxArrayData = maxArray(data);
  // ignore: avoid_print
  print(getMaxArrayData);
}
