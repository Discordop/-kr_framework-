print("client/client.lua is loaded")
function containsItem(array, item)
    for _, value in ipairs(array) do
        if value == item then
            return true
        end
    end
    return false
end

