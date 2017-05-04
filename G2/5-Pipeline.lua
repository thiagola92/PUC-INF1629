-- Titulo: 5-Pipeline
-- Autor: 
-- 03/05/2017
-- Versão 1.0
-- Linhas: 

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
    --
    -- Takes a string and scans for words, returning
    -- a list of words.
    --
    words = {}
    for i in string.gmatch(str_data, "%w+") do
        words[#words + 1] = i
    end
    return words
end

function remove_stop_words(word_list)
    -- 
    -- Takes a list of words and returns a copy with all stop 
    -- words removed 
    --
    io.input("stop_words.txt")
    local stop_words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        stop_words[i] = 1
    end
    
    -- add single-letter words
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

function frequencies(word_list)
    --
    -- Takes a list of words and returns a dictionary associating
    -- words with frequencies of occurrence
    --
    word_freqs = {}
    for i=1, #word_list do
        found = false
        for _,v in pairs(word_freqs) do
            if v[1] == word_list[i] then
                v[2] = v[2] + 1
                found = true
                break
            end
        end
        if not found then
            word_freqs[#word_freqs + 1] = {word_list[i], 1}
        end
    end
    
    return word_freqs
end

function compare(posicao1,posicao2)
    return posicao1[2] > posicao2[2]
end
        
function sort(word_freq)
    --
    -- Takes a dictionary of words and their frequencies
    -- and returns a list of pairs where the entries are
    -- sorted by frequency 
    --
    table.sort(word_freqs, compare)
    
    return word_freq
end

function print_all(word_freq)
    --
    -- Takes a list of pairs where the entries are sorted by frequency and print them recursively.
    --
    for i=1, 25 do
        print(word_freq[i][1] .. "=>" .. word_freq[i][2])
    end
end


--
-- The main function
--
print_all(sort(frequencies(remove_stop_words(scan(filter_chars_and_normalize(read_file(arg[1])))))))
