// Entry point for sk8sworld
console.log('Hello, sk8sworld!');
console.log('This is a simple learning platform to have a sample program for docker, then Kubernetes.');
// Additional functionality can be added here as needed
// For example, you could set up a basic server or connect to a database

const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, sk8sworld!');
});

app.get('/version', (req, res) => {
  res.json({
    version: process.env.VERSION || 'v0.1',
    commit: process.env.COMMIT || 'unknown',
    builtAt: process.env.BUILT_AT || new Date().toISOString()
  });
});

app.listen(port, () => {
  console.log(`Sk8sWorld listening on port ${port}`);
});
