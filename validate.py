def isEqual(headerSum, rowSum, maxDiff):
    if (abs(headerSum - rowSum) <= maxDiff):
            return True
    return False

