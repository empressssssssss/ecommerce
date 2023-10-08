const express = require('express');
const cors = require('cors');
const app = express();
const port = 8080; // You can change this port as needed

// Enable CORS for your server
app.use(cors());

// Your product data
const productList = [
  {
    id: 1,
    name: 'Boiled Salm Steak',
    price: 14.05,
    image: 'assets/images/American.png',
  },
  {
    id: 2,
    name: 'Large Hawaiia Pizza',
    price: 15.55,
    image: 'assets/images/Vegeterian.png',
  },
  {
    id: 3,
    name: 'Asian Seasames Chicken',
    price: 10.55,
    image: 'assets/images/Fast_Food.png',
  },
];

// Define a route to serve the product data
app.get('/api/products', (req, res) => {
  res.json(productList);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});


