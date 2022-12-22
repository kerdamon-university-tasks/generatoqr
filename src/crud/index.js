const express = require('express');
const { initializeApp } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

const baseUrl = 'https://europe-central2-generatoqr.cloudfunctions.net/scan-function';

initializeApp();
const db = getFirestore();

const app = express();
app.post('/', async (req, res) => {
    const id = req.body.id;
    console.log(req.body);
    const destination_address = req.body.destination_address;
    const data = {destination: destination_address};
    const response = await db.collection('destination_adresses').doc(id).set(data);
    res.redirect(`/crud-function/${id}`);
});

app.get('/', (req, res) => {
    res.redirect('https://storage.googleapis.com/generatoqr-crud-frontend/index.html');
})

app.get('/*', async (req, res) => {
    res.send(`<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <div id="qrcode"></div>
    <script type="text/javascript">
    new QRCode(document.getElementById("qrcode"), "${baseUrl + req.path}");
    </script>`);
});

exports.crud_qrcode = app;