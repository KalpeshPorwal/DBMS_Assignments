// *********Prerequisites************
db.orders.insertMany([
  {
    _id: 1,
    cust_id: "Ant O. Knee",
    ord_date: new Date("2020-03-01"),
    price: 25,
    items: [
      { sku: "oranges", qty: 5, price: 2.5 },
      { sku: "apples", qty: 5, price: 2.5 },
    ],
    status: "A",
  },
  {
    _id: 2,
    cust_id: "Ant O. Knee",
    ord_date: new Date("2020-03-08"),
    price: 70,
    items: [
      { sku: "oranges", qty: 8, price: 2.5 },
      { sku: "chocolates", qty: 5, price: 10 },
    ],
    status: "A",
  },
  {
    _id: 3,
    cust_id: "Busby Bee",
    ord_date: new Date("2020-03-08"),
    price: 50,
    items: [
      { sku: "oranges", qty: 10, price: 2.5 },
      { sku: "pears", qty: 10, price: 2.5 },
    ],
    status: "A",
  },
  {
    _id: 4,
    cust_id: "Busby Bee",
    ord_date: new Date("2020-03-18"),
    price: 25,
    items: [{ sku: "oranges", qty: 10, price: 2.5 }],
    status: "A",
  },
  {
    _id: 5,
    cust_id: "Busby Bee",
    ord_date: new Date("2020-03-19"),
    price: 50,
    items: [{ sku: "chocolates", qty: 5, price: 10 }],
    status: "A",
  },
  {
    _id: 6,
    cust_id: "Cam Elot",
    ord_date: new Date("2020-03-19"),
    price: 35,
    items: [
      { sku: "carrots", qty: 10, price: 1.0 },
      { sku: "apples", qty: 10, price: 2.5 },
    ],
    status: "A",
  },
  {
    _id: 7,
    cust_id: "Cam Elot",
    ord_date: new Date("2020-03-20"),
    price: 25,
    items: [{ sku: "oranges", qty: 10, price: 2.5 }],
    status: "A",
  },
  {
    _id: 8,
    cust_id: "Don Quis",
    ord_date: new Date("2020-03-20"),
    price: 75,
    items: [
      { sku: "chocolates", qty: 5, price: 10 },
      { sku: "apples", qty: 10, price: 2.5 },
    ],
    status: "A",
  },
  {
    _id: 9,
    cust_id: "Don Quis",
    ord_date: new Date("2020-03-20"),
    price: 55,
    items: [
      { sku: "carrots", qty: 5, price: 1.0 },
      { sku: "apples", qty: 10, price: 2.5 },
      { sku: "oranges", qty: 10, price: 2.5 },
    ],
    status: "A",
  },
  {
    _id: 10,
    cust_id: "Don Quis",
    ord_date: new Date("2020-03-23"),
    price: 25,
    items: [{ sku: "oranges", qty: 10, price: 2.5 }],
    status: "A",
  },
]);

var mapFunction1 = function () {
  for (var idx = 0; idx < this.items.length; idx++) {
    var key = this.items[idx].sku;
    var value = { count: 1, qty: this.items[idx].qty };

    emit(key, value);
  }
};
// Calculate Order and Total Quantity with Average Quantity Per Item
var reduceFunction1 = function (keySKU, countObjVals) {
  reducedVal = { count: 0, qty: 0 };

  for (var idx = 0; idx < countObjVals.length; idx++) {
    reducedVal.count += countObjVals[idx].count;
    reducedVal.qty += countObjVals[idx].qty;
  }

  return reducedVal;
};

var finalizeFunction1 = function (key, reducedVal) {
  reducedVal.avg = reducedVal.qty / reducedVal.count;
  return reducedVal;
};

db.orders.mapReduce(mapFunction1, reduceFunction1, {
  out: { merge: "map_reduce_example1" },
  query: { ord_date: { $gte: new Date("2020-03-01") } },
  finalize: finalizeFunction1,
});

db.map_reduce_example1.find().pretty();

db.map_reduce.example1.drop();

db.orders.aggregate(
   [
      { $match: { ord_date: { $gte: new Date("2020-03-01") } } },
      { $unwind : "$items"},
   ]
)

// Aggregation Alternative
db.orders.aggregate([
  { $match: { ord_date: { $gte: new Date("2020-03-01") } } },
  { $unwind: "$items" },
  {
    $group: {
      _id: "$items.sku",
      qty: { $sum: "$items.qty" },
      orders_ids: { $addToSet: "$_id" },
    },
  },
  {
    $project: {
      value: {
        count: { $size: "$orders_ids" },
        qty: "$qty",
        avg: { $divide: ["$qty", { $size: "$orders_ids" }] },
      },
    },
  },
  {
    $merge: {
      into: "agg_alternative_3",
      on: "_id",
      whenMatched: "replace",
      whenNotMatched: "insert",
    },
  },
]);

// *****************Assignment 11*******************

db.classes.insert({
  class: "Philosophy 101",
  startDate: new Date(2016, 1, 10),
  students: [
    { fName: "Dale", lName: "Cooper", age: 42 },
    { fName: "Lucy", lName: "Moran", age: 35 },
    { fName: "Tommy", lName: "Hill", age: 44 },
  ],
  cost: 1600,
  professor: "Paul Slugman",
  topics: "Socrates,Plato,Aristotle,Francis Bacon",
  book: {
    isbn: "1133612105",
    title: "Philosophy : A Text With Readings",
    price: 165.42,
  },
});
db.classes.insert({
  class: "College Algebra",
  startDate: new Date(2016, 1, 11),
  students: [
    { fName: "Dale", lName: "Cooper", age: 42 },
    { fName: "Laura", lName: "Palmer", age: 22 },
    { fName: "Donna", lName: "Hayward", age: 21 },
    { fName: "Shelly", lName: "Johnson", age: 24 },
  ],
  cost: 1500,
  professor: "Rhonda Smith",
  topics: "Rational Expressions,Linear Equations,Quadratic Equations",
  book: {
    isbn: "0321671791",
    title: "College Algebra",
    price: 179.4,
  },
});
db.classes.insert({
  class: "Astronomy 101",
  startDate: new Date(2016, 1, 11),
  students: [
    { fName: "Bobby", lName: "Briggs", age: 21 },
    { fName: "Laura", lName: "Palmer", age: 22 },
    { fName: "Audrey", lName: "Horne", age: 20 },
  ],
  cost: 1650,
  professor: "Paul Slugman",
  topics: "Sun,Mercury,Venus,Earth,Moon,Mars",
  book: {
    isbn: "0321815351",
    title: "Astronomy: Beginning Guide to Univ",
    price: 129.45,
  },
});
db.classes.insert({
  class: "Geology 101",
  startDate: new Date(2016, 1, 12),
  students: [
    { fName: "Andy", lName: "Brennan", age: 36 },
    { fName: "Laura", lName: "Palmer", age: 22 },
    { fName: "Audrey", lName: "Horne", age: 20 },
  ],
  cost: 1450,
  professor: "Alice Jones",
  topics: "Earth,Moon,Elements,Minerals",
  book: {
    isbn: "0321814061",
    title: "Earth : An Introduction to Physical Geology",
    price: 130.65,
  },
});
db.classes.insert({
  class: "Biology 101",
  startDate: new Date(2016, 1, 11),
  students: [
    { fName: "Andy", lName: "Brennan", age: 36 },
    { fName: "James", lName: "Hurley", age: 25 },
    { fName: "Harry", lName: "Truman", age: 41 },
  ],
  cost: 1550,
  professor: "Alice Jones",
  topics: "Earth,Cell,Energy,Genetics,DNA",
  book: {
    isbn: "0547219474",
    title: "Holt McDougal Biology",
    price: 104.3,
  },
});
db.classes.insert({
  class: "Chemistry 101",
  startDate: new Date(2016, 1, 13),
  students: [
    { fName: "Bobby", lName: "Briggs", age: 21 },
    { fName: "Donna", lName: "Hayward", age: 21 },
    { fName: "Audrey", lName: "Horne", age: 20 },
    { fName: "James", lName: "Hurley", age: 25 },
  ],
  cost: 1600,
  professor: "Alice Jones",
  topics: "Matter,Energy,Atom,Periodic Table",
  book: {
    isbn: "0547219474",
    title: "Chemistry : Matter and Change",
    price: 104.3,
  },
});

// 1. How many classes does “Alice Jones” teach

var mapFunction1 = function () {
   emit(this.class, 1); 
};

var reduceFunction1 = function (keyClass, count) {
   return Array.sum(count);
};

db.classes.mapReduce(
  mapFunction1, reduceFunction1, { query: { professor: "Alice Jones" }, out: "countOfClasses" }
)

// Find the cost to attend each of the professor’s classes

var mapFunction2 = function () {
  emit(this.professor, { count: 1, cost: this.cost });
};

var reduceFunction2 = function (keyProfessor, valuesObj) {
  reducedObj = { count: 0, cost: 0 };
  for (var idx = 0; idx < valuesObj.length; idx++){
    reducedObj.count += valuesObj[idx].count;
    reducedObj.cost += valuesObj[idx].cost;
  }
  return reducedObj;
};

db.classes.mapReduce(
  mapFunction2, reduceFunction2,
  { out : "priceOfEachProfessor"}
)

db.priceOfEachProfessor.find();
