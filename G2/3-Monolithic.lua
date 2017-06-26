-- Titulo: 3-Monolithic
-- Autor: Thiago Lages de Alencar
-- 02/05/2017
-- Versão 1.3
-- Linhas: ~99


-- Lista de [chave, valor] que desejamos exibir
word_freqs = {}

-- Armazenando todas palavras que desejamos ignorar em um Array
-- PRE: Todas as palavras que desajamos ignorar estão armazenadas em "stop_words.txt"
-- POS: Existe um Array com cada palavra que desejamos ignorar
io.input("stop_words.txt")
file = io.read("*all")
file = string.gsub(file, ",", " ")
stop_words = {}
for i in string.gmatch(file, "%w+") do
    stop_words[i] = 1
end
one_letter_words = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
for i=1, #one_letter_words do
    stop_words[one_letter_words[i]] = 1
end

-- Passa por cada linha do arquivo que desajamos contar as palavras
-- PRE: Um arquivo texto grande no qual desejamos saber quais as palavras mais usadas
-- POS: A variavel word_freqs contém todas as palavras e suas frequências em ordem de maior para menor
io.input(arg[1])
for line in io.lines() do
    local start_char = nil
    local i = 1
    
    line = string.gsub(line, "[^%w]", " ")
    
    for c=1, #line do
        character = string.sub(line, c, c)
        
        if start_char == nil then
            if string.match(character, "%w") then
            
                start_char = i
            end
        else
            if string.match(character, "%w") == nil or c == #line then
            
                local found = false
                local word = string.gsub(string.lower(string.sub(line, start_char, c)), "%W", "")
                
                
                if stop_words[word] == nil then
                    pair_index = 1
                    
                    for _,v in pairs(word_freqs) do
                        if word == v[1] then
                            v[2] = v[2] + 1
                            found = true
                            found_at = pair_index
                            break
                        end
                        pair_index = pair_index + 1
                    end
                    
                    if not found then
                        word_freqs[#word_freqs + 1] = {word, 1}
                    elseif #word_freqs > 1 then
                        n = pair_index
                        while n > 0 do
                            if word_freqs[pair_index][2] > word_freqs[n][2] then
                                -- swap
                                temporary = word_freqs[n][1]
                                word_freqs[n][1] = word_freqs[pair_index][1]
                                word_freqs[pair_index][1] = temporary
                                
                                temporary = word_freqs[n][2]
                                word_freqs[n][2] = word_freqs[pair_index][2]
                                word_freqs[pair_index][2] = temporary
                                
                                pair_index = n
                            end
                            n = n - 1
                        end
                    end
                end
                
                start_char = nil
            end
            
        end
        
        i = i + 1
    end
end

-- Exibi na tela as 25 palavras mais usadas no texto
for j=1, 25 do
    print(word_freqs[j][1] .. "=>" .. word_freqs[j][2])
end
--ver comentarios no pull-request (roxana)
