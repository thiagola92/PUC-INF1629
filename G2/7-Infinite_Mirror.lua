-- Titulo: 7-Infinite Mirror
-- Autor: 
-- 03/05/2017
-- Versão 1.1
-- Linhas: ~78

function read_stop_words()
    io.input("stop_words.txt")
    stop_words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        stop_words[string.lower(i)] = 1
    end

    -- add single-letter words
    one_letter_words = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
    for i=1, #one_letter_words do
        stop_words[one_letter_words[i]] = 1
    end
    
    return stop_words
end

function read_words(path)
    io.input(path)
    words = {}
    for i in string.gmatch(io.read("*all"), "%w+") do
        words[#words + 1] = string.lower(i)
    end
    
    return words
end

function compare(posicao1,posicao2)
    return posicao1[2] > posicao2[2]
end

function count(word_list, stopwords, wordfreqs, index)
    -- What to do with an empty list
    if index == #word_list + 1 then
        return
    -- The inductive case, what to do with a list of words
    else
        -- Process the head word
        word = word_list[index]
        if stopwords[word] == nil then
            found = false
            for i=1, #wordfreqs do
                if wordfreqs[i][1] == word then
                    wordfreqs[i][2] = wordfreqs[i][2] + 1
                    found = true
                    break
                end
            end
            if not found then
                wordfreqs[#wordfreqs + 1] = {word, 1}
            end
        end
        -- Process the tail 
        count(word_list, stopwords, wordfreqs, index+1)
    end
end

function wf_print(wordfreq, index)
    if index == 25 + 1 then
        return
    end
    
    print(wordfreqs[index][1].."=>"..wordfreqs[index][2])
    wf_print(wordfreq, index + 1)
end

stopwords = read_stop_words()
word_list = read_words(arg[1])
wordfreqs = {}

count(word_list, stopwords, wordfreqs, 1)
table.sort(wordfreqs, compare)
wf_print(wordfreqs, 1)
