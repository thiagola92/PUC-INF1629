local function info_em_string(mesa_info)
    toda_informacao = ""
    
    for uma_informacao = 1,  #mesa_info do
        toda_informacao = toda_informacao .. tostring(mesa_info[uma_informacao] .. "\t")
    end
    
    return toda_informacao
end

local function exibir_mesas()
    print("----------------------------------------------------------")
    
    for mesa_numero, mesa_info in pairs(mesa) do
        print(mesa_numero .. "\t" .. info_em_string(mesa_info))
    end
end

function mudar_mesa(numero, estado)
    numero = tonumber(numero)

    print(numero, estado)
    
    exibir_mesas()
end



