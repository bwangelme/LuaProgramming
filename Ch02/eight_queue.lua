-- 八皇后问题
--
-- add_queen 检查

N = 8

function iter_board(board)
    print("Start iter table")
    for k, v in pairs(board) do
        print(k, v)
    end
    print("End iter table")
end

-- can_place
-- 检查能否放皇后到 row:column 位置上
-- row 表示该放置第 row 行的皇后了，也表示棋盘中已经有 row - 1 个皇后了
function can_place(board, row, column, verbose)
    for i = 1, row - 1 do
        -- 列相同
        if board[i] == column then
            if verbose then
                print("列", i, row, column)
            end
            return false
        end

        -- 检查正对角线 row+column
        if i+board[i] == row + column then
            if verbose then
                print("正对角线", i, row, column)
            end
            return false
        end

        -- 检查反对角线 column-row
        if board[i] - i == column - row then
            if verbose then
                print("反对角线", i, row, column)
            end
            return false
        end
    end

    return true
end

-- print_board
-- 打印出棋盘
function print_board(board, n)
    for r = 1, n do
        for c = 1, n do
            io.write(board[r] == c and "X" or "-", " ")
        end
        io.write("\n")
    end

    io.write("\n")
end

-- add_queen
-- 把从 row 到 N 的所有行都加上皇后
function add_queen(board, row)
    if row == N + 1 then
        print_board(board, N)
        return true
    end

    for c = 1, N do
        if not can_place(board, row, c) then
            goto continue
        end

        board[row] = c
        done = add_queen(board, row + 1)

        if not done then
            goto continue
        else
            if row == 1 then
                -- 这里表示输出了第一个结果
                -- 如果return 的话，就只输出一个结果
                -- 如果 continue 的话，就会输出所有的结果
                return true
                -- goto continue
            else
                return true
            end
        end

        ::continue::
    end

    return false
end

add_queen({}, 1, N)
