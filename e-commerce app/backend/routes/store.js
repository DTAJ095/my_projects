const router = require('express').Router();
const Product = require('../models/product');
const { uploadImage } = require('../utils');


// Add product
router.post('/addproduct', async (req, res) => {
    const { name, description, price, category, quantity } = req.body;

    if (!name) {
        return res.status(400).json({ error: 'Please enter product name' });
    }
    if (!description) {
        return res.status(400).json({ error: 'Please enter product description' });
    }
    if (!price) {
        return res.status(400).json({ error: 'Please enter product price' });
    }
    if (!category) {
        return res.status(400).json({ error: 'Please enter product category' });
    }
    if (!quantity) {
        return res.status(400).json({ error: 'Please enter product quantity' });
    }

    /*const newProduct = new Product({ name, description, price, category, quantity });
    try {
        await newProduct.save();
        res.status(201).json({ success: true, message: 'Product added successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }*/
    const uploadedImage = uploadImage();
    const newProduct = new Product({ name, description, price, category, quantity, images: uploadedImage });
    try {
        await newProduct.save();
        res.status(201).json({ success: true, message: 'Product added successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
});


// Get all products
router.get('/products', async (req, res) => {
    try {
        const products = await Product.find();
        res.status(200).json(products);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
});


// Get product by objectId
router.get('/products/:objectId', async (req, res) => {
    id = req.params.objectId;
    const product = await Product.findById(id);
    if (!product) {
        return res.status(404).json({ error: 'Product not found' });
    } else {
        res.status(200).json(product);
    };
});
module.exports = router;