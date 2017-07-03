-- Titulo: 5-Pipeline
-- Autor: Miguel José Gonçalves da Silva
-- 03/05/2017
-- Versão 1.1
-- Linhas: ~116

-- Pega o caminho para um arquivo e retorna todo o conteudo em uma string
-- PRE: Conteudo do arquivo desconhecido
-- POS: Retorna o conteudo do arquivo em uma string
function read_file(path_to_file)
    io.input(path_to_file)
    return io.read("*all")
end

-- Substitui todos os characters não alphanumericos de uma string por espaço
-- PRE: Recebe uma string com characters não alphanúmericos
-- POS: Retorna a string só que com os characters não alphanúmericos trocados por espaço e com os alphanúmericos em minusculo
function filter_chars_and_normalize(str_data)
    return string.lower(string.gsub(str_data, "[^%w]", " "))
end

-- Pega uma string e retorna um Array com as palavras daquela string
-- PRE: String com palavras
-- POS: Retorna um array com todas as palavras na string
function scan(str_data)
    words = {}
    for i in string.gmatch(str_data, "%w+") do
        words[#words + 1] = i
    end
    return words
end

-- Retira todas as palavras indesejadas da lista passada
-- PRE: Recebe um Array com todas as palavras alphanumericas
-- POS: Retorna um Array com todas as palavras menos as indesejadas
function remove_stop_words(word_list)
    io.input("stop_words.txt")
    local stop_words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        stop_words[i] = 1
    end

    -- add single-letter words to the stop_words
    one_letter_words = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
    for i=1, #one_letter_words do
        stop_words[one_letter_words[i]] = 1
    end
    
    indexes = {}
    for i=1, #word_list do
        if stop_words[word_list[i]] then
            indexes[#indexes + 1] = i
        end
    end
    for i=1, #indexes do
        table.remove(word_list, indexes[i] - i + 1)
    end
    
    return word_list
    
end

-- Conta o número de vezes que cada palavra ocorre
-- PRE: Recebe a lista de todas as palavras e com repetição
-- POS: Faz uma lista com o par [palavra, vezes ocorrida]
function frequencies(word_list)
    --
    -- Takes a list of words and returns a dictionary associating
    -- words with frequencies of occurrence
    --
    word_frequency = {}
    for i=1, #word_list do
        found = false
        for _,v in pairs(word_frequency) do
            if v[1] == word_list[i] then
                v[2] = v[2] + 1
                found = true
                break
            end
        end
        if not found then
            word_frequency[#word_frequency + 1] = {word_list[i], 1}
        end
    end
    
    return word_frequency
end

-- Responsável por organizar por ordem decrescente a lista de palavra e frequência
-- PRE: Recebe uma lista de pares palavra e frequência desorganizada
-- POS: Retorna a mesma lista recebida porém em ordem decrescente
function sort(word_frequency)
    table.sort(word_frequency, function (position1,position2) return position1[2] > position2[2] end)
    
    return word_frequency
end

-- Exibi as 25 palavras com maior frequência no console
-- PRE: Recebe a lista
-- POS: Exibi as 25 palavras mais frequentes
function print_all(word_frequency)
    --
    -- Takes a list of pairs where the entries are sorted by frequency and print them recursively.
    --
    for i=1, 25 do
        print(word_frequency[i][1] .. "=>" .. word_frequency[i][2])
    end
end


-- The main function
print_all(sort(frequencies(remove_stop_words(scan(filter_chars_and_normalize(read_file(arg[1])))))))
