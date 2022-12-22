const express = require('express');
const { initializeApp } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

initializeApp();
const db = getFirestore();

const app = express();
app.post('/', async (req, res) => {
    const id = req.body.id;
    console.log(req.body);
    const destination_address = req.body.destination_address;
    const data = {destination: destination_address};
    const response = await db.collection('destination_adresses').doc(id).set(data);
    res.send("Created");
});

exports.qrcode = app;