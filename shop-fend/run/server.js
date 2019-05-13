const express = require('express')
const app = express()

app.use(express.static('./'))

app.listen(8848, () => {
    console.log('Example app listening on port 8848!')
})