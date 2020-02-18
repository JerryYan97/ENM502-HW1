% row and col start from 1.
function[row, col] = GetRowCol(idx, axisPointsNum)
    row = ceil(idx / axisPointsNum);
    col = idx - (row - 1) * axisPointsNum;
end