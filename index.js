'use strict'

// content of index.js
const http = require('http')
const request = require('request-promise-native')
const port = 3000
const logger = require('pino')()

const requestHandler = (request, response) => {
  response.end(JSON.stringify({
    ping: 'pong'
  }))
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  logger.info(`server is listening on ${port}`)
})

const ping = async () => {
  const partner = process.env.PARTNER_URL || 'http://127.0.0.1:3000'
  const child = logger.child({
    url: partner
  })

  try {
    await request(partner, {
      timeout: 2000,
    })
  } catch (err) {
    return child.error('failed to talk to partner:', err.message || err)
  }

  child.info('successful ping')
}

setInterval(ping, 10000)
ping()