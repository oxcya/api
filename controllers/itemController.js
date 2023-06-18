
//adapt to postgres 
const Item = require('../models/itemModel');

exports.createItem = (req, res) => {
    // Your create logic goes here
    const newItem = new Item(req.body);
    newItem.save((err, item) => {
      if (err) {
        res.status(500).send(err);
      }
      res.status(201).json(item);
    });
  };
  
exports.readItems = (req, res) => {
    // Your read logic goes here
    Item.find({}, (err, items) => {
      if (err) {
        res.status(500).send(err);
      }
      res.status(200).json(items);
    });
  };
  
exports.updateItem = (req, res) => {
    // Your update logic goes here
    Item.findOneAndUpdate(
      { _id: req.params.id },
      req.body,
      { new: true, useFindAndModify: false },
      (err, item) => {
        if (err) {
          res.status(500).send(err);
        }
        res.status(200).json(item);
      }
    );
  };
  
exports.deleteItem = (req, res) => {
    // Your delete logic goes here
    Item.findOneAndDelete({ _id: req.params.id }, (err, item) => {
      if (err) {
        res.status(500).send(err);
      }
      res.status(200).json({ message: 'Item deleted successfully' });
    });
  };