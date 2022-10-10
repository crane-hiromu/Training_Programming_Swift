/*
 You are given two 0-indexed arrays, nums1 and nums2, consisting of non-negative integers. There exists another array, nums3, which contains the bitwise XOR of all pairings of integers between nums1 and nums2 (every integer in nums1 is paired with every integer in nums2 exactly once).
 Return the bitwise XOR of all integers in nums3.

 Example 1:
 Input: nums1 = [2,1,3], nums2 = [10,2,5,0]
 Output: 13
 Explanation:
 A possible nums3 array is [8,0,7,2,11,3,4,1,9,1,6,3].
 The bitwise XOR of all these numbers is 13, so we return 13.
 
 Example 2:
 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 0
 Explanation:
 All possible pairs of bitwise XORs are nums1[0] ^ nums2[0], nums1[0] ^ nums2[1], nums1[1] ^ nums2[0],
 and nums1[1] ^ nums2[1].
 Thus, one possible nums3 array is [2,5,1,6].
 2 ^ 5 ^ 1 ^ 6 = 0, so we return 0.
  
 Constraints:
 1 <= nums1.length, nums2.length <= 105
 0 <= nums1[i], nums2[j] <= 109
*/


/*
case 1: when n and m is even

nums1={a,b}, nums2={c,d}
=> {a^c,a^d,b^c,b^d}
=> {a^c^a^d^b^c^b^d}
=> {a^a^b^b^c^c^d^d}
=> {0^0^0^0}
= 0
*/

/*
case 2: when n is even, n is odd

nums1={a,b}, nums2={c,d,e}
=> {a^c,a^d,a^e,b^c,b^d,b^e}
=> {a^c^a^d^a^e^b^c^b^d^b^e}
=> {a^a^a^b^b^b^c^c^d^d^e^e}
=> {0^a^0^b^0^0^0}
=> {a^b}
*/

func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
    if nums1.count % 2 == 0, nums2.count % 2 == 0 {
        return 0
    } else if nums1.count % 2 == 0, nums2.count % 2 != 0 {
        return nums1.reduce(0, ^)
    } else if nums1.count % 2 != 0, nums2.count % 2 == 0 {
        return nums2.reduce(0, ^)
    } else {
        return nums1.reduce(0, ^) ^ nums2.reduce(0, ^)
    }
}
