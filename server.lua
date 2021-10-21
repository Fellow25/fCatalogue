ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('fellow_concess:recuperercategorievehicule', function(source, cb)
    local catevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(catevehi, {
                name = result[i].name,
                label = result[i].label
            })
        end

        cb(catevehi)
    end)
end)

ESX.RegisterServerCallback('fellow_concess:recupererlistevehicule', function(source, cb, categorievehi)
    local catevehi = categorievehi
    local listevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles WHERE category = @category', {
        ['@category'] = catevehi
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(listevehi, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price
            })
        end

        cb(listevehi)
    end)
end)

ESX.RegisterServerCallback('fellow_moto:recuperercategoriemoto', function(source, cb)
    local catemoto = {}

    MySQL.Async.fetchAll('SELECT * FROM moto_categories', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(catemoto, {
                name = result[i].name,
                label = result[i].label
            })
        end

        cb(catemoto)
    end)
end)

ESX.RegisterServerCallback('fellow_moto:recupererlistemoto', function(source, cb, categoriemoto)
    local catemoto = categoriemoto
    local listemoto = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles WHERE category = @category', {
        ['@category'] = catemoto
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(listemoto, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price
            })
        end

        cb(listemoto)
    end)
end)