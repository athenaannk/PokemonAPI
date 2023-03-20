# REMOVE SMALLEST
# Given a list of numbers, remove the smallest number in the list.
# If there are multiple occurrences of the smallest number, remove all of them.
# Return the resulting list without mutating the original list.
#
# Example:
# Input: [40, 12, 7, 3, 500, 134, 764, 4]
# Output: [40, 12, 7, 500, 134, 764, 4]
#
# Input: [1,1,1,1,2,3,4,5]
# Output: [2,3,4,5]
#
# Input: [1,1,1,1,1,1,1,1]
# Output: []

l_1 = [40, 12, 7, 3, 500, 134, 764, 4]
l_2 = [1,1,1,1,2,3,4,5]
l_3 = [1,1,1,1,1,1,1,1]


def smallest(list):
    x = list[:]
    y = min(x)
    while y in x:
        x.remove(y)
    print(list)
    return x


print(smallest(l_1))
print(smallest(l_2))
print(smallest(l_3))