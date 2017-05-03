-- Titulo: 3-Monolithic
-- Autor: Thiago Lages de Alencar
-- 02/05/2017
-- Versão 1.1
-- Linhas: ~94


-- the global list of [word, frequency] pairs
word_freqs = {}

-- the list of stop words
io.input("stop_words.txt")
f = io.read("*all")
f = string.gsub(f, ",", " ")
stop_words = {}
for i in string.gmatch(f, "%w+") do
    stop_words[i] = 1
end

one_letter_words = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
for i=1, #one_letter_words do
    stop_words[one_letter_words[i]] = 1
end

-- iterate through the file one line at a time
io.input(arg[1])
for line in io.lines() do
    local start_char = nil
    local i = 1
    
    line = string.gsub(line, "[^%w]", " ")
    
    for c=1, #line do
        character = string.sub(line, c, c)
        
        if start_char == nil then
            if string.match(character, "%w") then
                -- We found the start of a word
                start_char = i
            end
        else
            if string.match(character, "%w") == nil or c == #line then
                -- We found the end of a word. Process it
                local found = false
                local word = string.gsub(string.lower(string.sub(line, start_char, c)), "%W", "")
                
                -- Ignore stop words
                if stop_words[word] == nil then
                    pair_index = 1
                    -- Let's see if it already exists
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
                        -- We may need to reorder
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
                
                -- Let's reset
                start_char = nil
            end
            
        end
        
        i = i + 1
    end
end

print("\n###Output###")
for j=1, 25 do
    print(word_freqs[j][1] .. "=>" .. word_freqs[j][2])
end

