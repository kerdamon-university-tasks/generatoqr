const functions = require('@google-cloud/functions-framework');

functions.http('helloHttp', (req, res) => {
 res.send(`Hello scan ${req.query.name || req.body.name || 'World'}!!!!`);
});
