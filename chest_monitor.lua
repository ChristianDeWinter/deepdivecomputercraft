function print_inventory_on_monitor(chest, monitor)
    if chest and monitor then
        monitor.clear()
        
        local inventory = chest.list()
        local yPos = 1
        
        for slot, item in pairs(inventory) do
            local itemName = string.match(item.name, "[^:]+$")
            local itemCount = tostring(item.count)
            
            local xPosName = math.floor((monitor.getSize() - #itemName) / 2)
            local xPosCount = math.floor((monitor.getSize() - #itemCount) / 2)
            
            monitor.setTextColor(colors.white)
            monitor.setCursorPos(xPosName, yPos)
            monitor.write(itemName)
            
            yPos = yPos + 1
            
            monitor.setTextColor(colors.gray)
            monitor.setCursorPos(xPosCount, yPos)
            monitor.write(item.count)
            
            yPos = yPos + 1
        end
    else
        print("Chest or monitor not found.")
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")
    
    print_inventory_on_monitor(chest, monitor)
    
    os.sleep(10)
end
