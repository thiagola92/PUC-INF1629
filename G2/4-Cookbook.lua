-- Titulo: 4-Cookbook
-- Autor: Thiago Lages de Alencar
-- 03/05/2017
-- Vers�o 1.3
-- Linhas: ~110

-- Toda informa��o que o programa vai compartilhar entre as fun��es
data = {}
words = {}
word_freqs = {}

-- L� o arquivo texto que desejamos pegar as palavras mais frequ�ntes
-- PRE: data vazio
-- POS: Todo o texto armazenado em data, em apenas uma string
function read_file(path_to_file)
    io.input(path_to_file)
    data = io.read("*all")
end

-- Remove todo characters n�o alphanumerico
-- PRE: data armzena o texto em uma string com characters n�o alphanumericos
-- POS: data trocou todos characters n�o alphanumericos por espa�os
function filter_chars_and_normalize()
    data = string.lower(string.gsub(data, "[^%w]", " "))
end

-- Passa pela a string em data e pega cada palavra e armazena em words
-- PRE: words vazio e data com uma string
-- POS: words � um Array de todas as palavras que aparecem no texto
function scan()
    for i in string.gmatch(data, "%w+") do
        words[#words + 1] = i
    end
end

-- Passa pelo Array words removendo palavras que n�o interessam, ou seja, que est�o no stop_words.txt
-- PRE: Palavras que n�o nos interessam no Array words
-- POS: Array words sem a palavras no stop_words.txt
function remove_stop_words()
    io.input("stop_words.txt")
    local stop_words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        stop_words[i] = 1
    end
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

-- Cria uma lista com as palavras e frequ�ncia de cada uma delas
-- PRE: Array word com todas as palavras que nos interessam e repetidas n vezes
-- POS: Lista de todas palavras com a frequ�ncia que s�o usadas em word_freqs
function frequencies()
    --
    -- Creates a list of pairs associating
    -- words with frequencies 
    --
    for i=1, #words do
        found = false
        for _,v in pairs(word_freqs) do
            if v[1] == words[i] then
                v[2] = v[2] + 1
                found = true
                break
            end
        end
        if not found then
            word_freqs[#word_freqs + 1] = {words[i], 1}
        end
    end
    
end

-- Fun��o auxiliar para comparar se deve trocar de lugar duas posi��es
function compare(posicao1,posicao2)
    return posicao1[2] > posicao2[2]
end

-- Organiza para ficar maior frequ�ncia primeiro e menor frequ�ncia por ultimo
-- PRE: Lista word_freqs em ordem aleat�ria
-- POS: Lista word_freqs em ordem do maior para o menor
function sort()
    table.sort(word_freqs, compare)
end

-- Exibi no prompt as 25 palavras mais usadas e quantas vezes foram usadas
function print_all()
    for i=1, 25 do
        print(word_freqs[i][1] .. "=>" .. word_freqs[i][2])
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
