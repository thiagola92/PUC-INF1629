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

local function mesa_livre(numero)
    mesa[numero][1] = Livre
end

local function mesa_ocupada(numero)
    mesa[numero][1] = Ocupada
end

local function mesa_reservada(numero)
    mesa[numero][1] = Reservada
end

function mudar_mesa(numero, estado)
    numero = tonumber(numero)

    if estado == LIVRE then
    elseif estado == OCUPADO then
    elseif estado == RESERVADO then
    else print(Estado_nao_reconhecido)
    
    exibir_mesas()
end

function ajuda()
    print(Ajuda)
end


