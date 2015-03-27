document = require "cpf_cnpj"
express = require "express"
app = express()

app.get "/cpf", (req, res) ->
  res.send {type: "CPF", number: document.CPF.generate(true)}

app.get "/cnpj", (req, res) ->
  res.send {type: "CNPJ", number: document.CNPJ.generate(true)}

server = app.listen (process.env.PORT or 3000), () ->
  host = server.address().address
  port = server.address().port
  console.log('Example app listening at http://%s:%s', host, port)
