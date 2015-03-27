document = require "cpf_cnpj"
express = require "express"
app = express()

app.get "/cpf", (req, res) ->
  res.send {type: "CPF", number: document.CPF.generate(true), random: Math.floor(Math.random()*10000)}

app.get "/cnpj", (req, res) ->
  res.send {type: "CNPJ", number: document.CNPJ.generate(true), random: Math.floor(Math.random()*10000)}

server = app.listen (process.env.PORT or 3000), () ->
  host = server.address().address
  port = (process.env.PORT or 3000)
  console.log('Tax Document generator app listening at http://%s:%s', host, port)
