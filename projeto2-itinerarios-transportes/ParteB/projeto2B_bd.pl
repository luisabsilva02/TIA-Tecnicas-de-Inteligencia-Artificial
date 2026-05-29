arco(braga,porto,comboio).
arco(braga,porto,autocarro).
arco(braga,porto,automovel).
arco(braga,viseu,automovel).
arco(porto,lisboa,comboio).
arco(porto,lisboa,automovel).
arco(porto,lisboa,aviao).
arco(porto,lisboa,autocarro).
arco(lisboa,faro,comboio).
arco(lisboa,faro,automovel).
arco(lisboa,faro,aviao).
arco(lisboa,faro,autocarro).
arco(porto,viseu,automovel).
arco(porto,viseu,comboio).
arco(porto,viseu,autocarro).
arco(braga,guimaraes,automovel).
arco(braga,guimaraes,autocarro).
arco(guimaraes,porto,automovel).
arco(guimaraes,porto,comboio).
arco(guimaraes,porto,autocarro).
arco(viseu,coimbra,automovel).
arco(coimbra,braga,automovel).
arco(coimbra,lisboa,comboio).

custo(braga, porto, comboio, 3).
custo(braga, porto, autocarro, 14).
custo(braga, porto, automovel, 15).
custo(braga, viseu, automovel, 90).
custo(porto, lisboa, comboio, 60).
custo(porto, lisboa, automovel, 90).
custo(porto, lisboa, aviao, 130).
custo(porto, lisboa, autocarro, 25).
custo(lisboa, faro, comboio, 80).
custo(lisboa, faro, automovel, 150).
custo(lisboa, faro, aviao, 140).
custo(lisboa, faro, autocarro, 70).
custo(porto, viseu, automovel, 90).
custo(porto, viseu, comboio, 70).
custo(porto, viseu, autocarro, 60).
custo(braga, guimaraes, automovel, 10).
custo(braga, guimaraes, autocarro, 15).
custo(guimaraes, porto, automovel, 14).
custo(guimaraes, porto, comboio, 3).
custo(guimaraes, porto, autocarro, 12).
custo(viseu, coimbra, automovel, 40).
custo(coimbra, braga, automovel, 60).
custo(coimbra, lisboa, comboio, 30).

tempo(braga, porto, comboio, 50).
tempo(braga, porto, autocarro, 70).
tempo(braga, porto, automovel, 40).
tempo(braga, viseu, automovel, 200).
tempo(porto, lisboa, comboio, 180).
tempo(porto, lisboa, automovel, 150).
tempo(porto, lisboa, aviao, 120).
tempo(porto, lisboa, autocarro, 150).
tempo(lisboa, faro, comboio, 250).
tempo(lisboa, faro, automovel, 200).
tempo(lisboa, faro, aviao, 120).
tempo(lisboa, faro, autocarro, 240).
tempo(porto, viseu, automovel, 200).
tempo(porto, viseu, comboio, 260).
tempo(porto, viseu, autocarro, 250).
tempo(braga, guimaraes, automovel, 20).
tempo(braga, guimaraes, autocarro, 30).
tempo(guimaraes, porto, automovel, 50).
tempo(guimaraes, porto, comboio, 70).
tempo(guimaraes, porto, autocarro, 60).
tempo(viseu, coimbra, automovel, 100).
tempo(coimbra, braga, automovel, 90).
tempo(coimbra, lisboa, comboio, 120).

ligacao(braga, [porto, comboio], 50, 3).
ligacao(braga, [porto, autocarro], 70, 14).
ligacao(braga, [porto, automovel], 40, 15).
ligacao(braga, [viseu, automovel], 200, 90).
ligacao(porto, [lisboa, comboio], 180, 60).
ligacao(porto, [lisboa, automovel], 150, 90).
ligacao(porto, [lisboa, aviao], 120, 130).
ligacao(porto, [lisboa, autocarro], 150, 25).
ligacao(lisboa, [faro, comboio], 240, 80).
ligacao(lisboa, [faro, automovel], 200, 150).
ligacao(lisboa, [faro, aviao], 120, 140).
ligacao(lisboa, [faro, autocarro], 240, 70).
ligacao(porto, [viseu, automovel], 200, 90).
ligacao(porto, [viseu, comboio], 260, 70).
ligacao(porto, [viseu, autocarro], 250, 60).
ligacao(braga, [guimaraes, automovel], 20, 10).
ligacao(braga, [guimaraes, autocarro], 30, 15).
ligacao(guimaraes, [porto, automovel], 50, 14).
ligacao(guimaraes, [porto, comboio], 70, 3).
ligacao(guimaraes, [porto, autocarro], 60, 12).
ligacao(viseu, [coimbra, automovel], 100, 40).
ligacao(coimbra, [braga, automovel], 90, 60).
ligacao(coimbra, [lisboa, comboio], 120, 30).
ligacao(porto, [braga, comboio], 50, 3).
ligacao(porto, [braga, autocarro], 70, 14).
ligacao(porto, [braga, automovel], 40, 15).
ligacao(viseu, [braga, automovel], 200, 90).
ligacao(lisboa, [porto, comboio], 180, 60).
ligacao(lisboa, [porto, automovel], 150, 90).
ligacao(lisboa, [porto, aviao], 120, 130).
ligacao(lisboa, [porto, autocarro], 150, 25).
ligacao(faro, [lisboa, comboio], 240, 80).
ligacao(faro, [lisboa, automovel], 200, 150).
ligacao(faro, [lisboa, aviao], 120, 140).
ligacao(faro, [lisboa, autocarro], 240, 70).
ligacao(viseu, [porto, automovel], 200, 90).
ligacao(viseu, [porto, comboio], 260, 70).
ligacao(viseu, [porto, autocarro], 250, 60).
ligacao(guimaraes, [braga, automovel], 20, 10).
ligacao(guimaraes, [braga, autocarro], 30, 15).
ligacao(porto, [guimaraes, automovel], 50, 14).
ligacao(porto, [guimaraes, comboio], 70, 3).
ligacao(porto, [guimaraes, autocarro], 60, 12).
ligacao(coimbra, [viseu, automovel], 100, 40).
ligacao(braga, [coimbra, automovel], 90, 60).
ligacao(lisboa, [coimbra, comboio], 120, 30).










