-- Titulo: 4-Cookbook
-- Autor: Thiago Lages de Alencar
-- 03/05/2017
-- Versão 1.0
-- Linhas: 

-- The shared mutable data
data = {}
words = {}
word_freqs = {}

--
-- The procedures
--
function read_file(path_to_file)
    --
    -- Takes a path to a file and assigns the entire
    -- contents of the file to the global variable data
    --
    io.input(path_to_file)
    data = io.read("*all")
end

function filter_chars_and_normalize()
    --
    -- Replaces all nonalphanumeric chars in data with white space
    --
    data = string.lower(string.gsub(data, "[^%w]", " "))
end

function scan()
    --
    -- Scans data for words, filling the global variable words
    --
    for i in string.gmatch(data, "%w+") do
        words[#words + 1] = i
    end
end

function remove_stop_words()
    io.input("stop_words.txt")
    stop_words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        stop_words[i] = 1
    end
    
    -- add single-letter words
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
    
    for i=1, #words do
        print(words[i])
    end
    
end


--
-- The main function
--
read_file(arg[1])
filter_chars_and_normalize()
scan()
remove_stop_words()