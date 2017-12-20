import axios from 'axios'

let client = axios.create({})

client.defaults.headers.common['Content-Type'] = 'application/json'
client.defaults.headers.common['Accept'] = 'application/json'

export default client
