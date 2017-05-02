-- Titulo: 3-Monolithic
-- Autor: Thiago Lages de Alencar
-- 02/05/2017
-- Versão 1.0
-- Linhas: 

-- Lista global de [palavra, frequencia] pares
word_freqs = {}

-- Lista de stop_words, palavras que vão ser filtradas
io.input("stop_words.txt")
f = io.read("*all")
f = string.gsub(f, ",", " ")
stop_words = {}
for i in string.gmatch(f, "%S+") do
    stop_words[#stop_words + 1] = i
end

print(arg[1])
io.input(arg[1])

