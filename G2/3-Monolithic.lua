-- Titulo: 3-Monolithic
-- Autor: Thiago Lages de Alencar
-- 02/05/2017
-- Vers�o 1.3
-- Linhas: ~99


-- Lista de [chave, valor] que desejamos exibir
word_frequency = {}

-- As palavras est�o dentro do arquivo "stop_words.txt" e s�o divididas por virgulas
-- Pegamos conjuntos de caracteres alfan�mericos(palavras) e armazenamos no Array "stop_words"
-- PRE: Todas as palavras que desajamos ignorar est�o armazenadas em "stop_words.txt"
-- POS: Existe um Array com cada palavra que desejamos ignorar
io.input("stop_words.txt")
file = io.read("*all")
--file = string.gsub(file, ",", " ")
stop_words = {}
for i in string.gmatch(file, "%w+") do
    stop_words[i] = 1
end

-- Adiciona todas as palavras de uma letra a lista de "stop_words"
-- Pois palavras de uma letra n�o s�o palavras ou n�o nos interessam
one_letter_words = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
for i=1, #one_letter_words do
    stop_words[one_letter_words[i]] = 1
end

-- A id�ia � conforme voc� vai lendo cada palavra do arquivo, voc� j� acrescenta na frequ�ncia dela e ordena se for preciso.
--
-- Pega o primeiro argumento e define ele como a entrada de dados
-- Para cada linha do arquivo:
--      Vai substituir todos caracteres n�o alfanum�ricos por espa�o
--      Para cada caracter da linha:
--          Ver se � alfanum�rico pois assim saber� que come�ou a ler uma palavra
--          Quando n�o for alfanum�rico voc� terminou de ler uma palavra
--              Se ela n�o for uma das palavras em "stop_word", acrecentar na tabela de frequ�ncia
--              Verificar se ficou mais frequente do que as da frente, se sim, mover a posi��o dessa palavra na tabela de frequ�ncia (ordenar)
-- PRE: Um arquivo texto grande no qual desejamos saber quais as palavras mais usadas
-- POS: A vari�vel "word_frequency" cont�m todas as palavras e suas frequ�ncias em ordem de maior para menor
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
                    
                    for _,v in pairs(word_frequency) do
                        if word == v[1] then
                            v[2] = v[2] + 1
                            found = true
                            found_at = pair_index
                            break
                        end
                        pair_index = pair_index + 1
                    end
                    
                    if not found then
                        word_frequency[#word_frequency + 1] = {word, 1}
                    elseif #word_frequency > 1 then
                        n = pair_index
                        while n > 0 do
                            if word_frequency[pair_index][2] > word_frequency[n][2] then
                                -- Trocar de posi��es
                                temporary = word_frequency[n][1]
                                word_frequency[n][1] = word_frequency[pair_index][1]
                                word_frequency[pair_index][1] = temporary
                                
                                temporary = word_frequency[n][2]
                                word_frequency[n][2] = word_frequency[pair_index][2]
                                word_frequency[pair_index][2] = temporary
                                
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
    print(word_frequency[j][1] .. "=>" .. word_frequency[j][2])
end
