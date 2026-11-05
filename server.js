const express = require('express');

const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => res.send('Hello World'));
app.get('/health', (req, res) => res.json({ status: 'ok' }));

app.listen(port, '0.0.0.0', () => console.log(`Listening on ${port}`));
