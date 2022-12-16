const functions = require('@google-cloud/functions-framework');

functions.http('helloHttp', (req, res) => {
 res.send(`Hello crud ${req.query.name || req.body.name || 'World'}!!!!`);
});
