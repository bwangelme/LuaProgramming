-- prints odd numbers in [|1,10|]

function continue_func()
    for i = 1, 10 do
        if i % 2 == 0 then
            goto continue
        end

        print(i)

        ::continue::

        return 1
    end
end

continue_func()
