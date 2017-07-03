-- Titulo: 4-Cookbook
-- Autor: Thiago Lages de Alencar
-- 03/05/2017
-- Versão 1.3
-- Linhas: ~110

-- Toda informação que o programa vai compartilhar entre as funções
data = {}
words = {}
word_frequency = {}

-- Lê o arquivo texto que desejamos pegar as palavras mais frequêntes e armazena em um variável
-- PRE: variável "data" vazia
-- POS: Todo o texto armazenado em "data", em apenas uma string
function read_file(path_to_file)
    io.input(path_to_file)
    data = io.read("*all")
end

-- Remove todo characters não alphanumerico
-- PRE: "data" armzena o texto em uma string com characters não alphanumericos
-- POS: "data" trocou todos characters não alphanumericos por espaços
function filter_chars_and_normalize()
    data = string.lower(string.gsub(data, "[^%w]", " "))
end

-- Passa pela a string em "data" e pega cada palavra e armazena em "words"
-- PRE: O Array "words" vazio e todo o texto do arquivo em "data"
-- POS: "words" é um Array de todas as palavras que aparecem no texto
function scan()
    for i in string.gmatch(data, "%w+") do
        words[#words + 1] = i
    end
end

-- Lê o arquivo "stop_words.txt" e armazena todas as palavras no Array "stop_words"
-- Acrescenta as palavras de uma letra no Array "stop_words" pois elas não contam como palavra ou não nos interessam
-- Guardaremos a posição de todas palavras em "words" que queremos remover.
-- Então caminhamos pelo Array "words" e se a palavra existir em "stop_words" guardar o indice dela em um Array "indexes"
-- No final usamos esses indices armazenados para saber quais palavras remover.
-- PRE: Palavras que não nos interessam no Array words
-- POS: Array words sem a palavras no stop_words.txt
function remove_stop_words()
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
    for i=1, #words do
        if stop_words[words[i]] then
            indexes[#indexes + 1] = i
        end
    end
    
    for i=1, #indexes do
        table.remove(words, indexes[i] - i + 1)
    end
    
end

-- Cria uma tabela com as palavras e frequência de cada uma delas
-- Para isso basta percorrer o Array "words" e:
--      Se a palavra já existir na tabela "word_frquency" e incrementar a frequência dela
--      Se não, acrescentar ela na tabela "word_frquency" e botar frequência como 1 
-- PRE: Array word com todas as palavras que nos interessam e repetidas n vezes
-- POS: Lista de todas palavras com a frequência que são usadas em "word_frequency"
function frequencies()
    --
    -- Creates a list of pairs associating
    -- words with frequencies 
    --
    for i=1, #words do
        found = false
        for _,v in pairs(word_frequency) do
            if v[1] == words[i] then
                v[2] = v[2] + 1
                found = true
                break
            end
        end
        if not found then
            word_frequency[#word_frequency + 1] = {words[i], 1}
        end
    end
    
end

-- Organiza para ficar maior frequência primeiro e menor frequência por ultimo
-- PRE: Lista word_frequency em ordem aleatória
-- POS: Lista word_frequency em ordem do maior para o menor
function sort()
    table.sort(word_frequency, function (position1,position2) return position1[2] > position2[2] end)
end

-- Exibi no prompt as 25 palavras mais usadas e quantas vezes foram usadas
function print_all()
    for i=1, 25 do
        print(word_frequency[i][1] .. "=>" .. word_frequency[i][2])
    end
end

-- The main function
read_file(arg[1])
filter_chars_and_normalize()
scan()
remove_stop_words()
frequencies()
sort()
print_all()
