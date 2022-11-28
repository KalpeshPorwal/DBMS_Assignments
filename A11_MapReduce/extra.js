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


// find the count of ordered items and average quantity

var mapFunc = function () {
    for (var index = 0; index < this.items.length; index++) {
        var key = this.items[index].sku;
        var value = { count: 1, qty: this.items[index].qty };
    }
    emit(key, value);
};

var reduceFunc = function (keysku, countobjval) {
    var reducedObject = { count: 0, qty: 0 };
    for (var idx = 0; idx < countobjval.length; idx++){
        reducedObject.count += countobjval[idx].count;
        reducedObject.qty += countobjval[idx].qty;
    }
    // reducedObject.avg = reducedObject.qty / reducedObject.count;
    return reducedObject;
};

var finalizeFunc = function (keysku, reduceobj) {
    reduceobj.avg = reduceobj.qty / reduceobj.count;

    return reduceobj;
}

db.orders.mapReduce(
    mapFunc,
    reduceFunc,
    {
        out: "result",
        query: { ord_date: { $gte: new Date("2020-03-01") } },
        finalize: finalizeFunc
    }
);

db.result.find().pretty();
db.orders.find().pretty();

// Return the Total Price Per Customer

var mapFunc = function () {
    emit(this.cust_id, this.price);
};

var reduceFunc = function (keyid, valprice) {
    return Array.sum(valprice);
};

db.orders.mapReduce(
    mapFunc,
    reduceFunc,
    {
        out: "totalPrice"
    }
);


db.cakeSales.insertMany([
  {
    _id: 0,
    type: "chocolate",
    orderDate: new Date("2020-05-18T14:10:30Z"),
    state: "CA",
    price: 13,
    quantity: 120,
  },
  {
    _id: 1,
    type: "chocolate",
    orderDate: new Date("2021-03-20T11:30:05Z"),
    state: "WA",
    price: 14,
    quantity: 140,
  },
  {
    _id: 2,
    type: "vanilla",
    orderDate: new Date("2021-01-11T06:31:15Z"),
    state: "CA",
    price: 12,
    quantity: 145,
  },
  {
    _id: 3,
    type: "vanilla",
    orderDate: new Date("2020-02-08T13:13:23Z"),
    state: "WA",
    price: 13,
    quantity: 104,
  },
  {
    _id: 4,
    type: "strawberry",
    orderDate: new Date("2019-05-18T16:09:01Z"),
    state: "CA",
    price: 41,
    quantity: 162,
  },
  {
    _id: 5,
    type: "strawberry",
    orderDate: new Date("2019-01-08T06:12:03Z"),
    state: "WA",
    price: 43,
    quantity: 134,
  },
]);

db.cakeSales.aggregate([
  {
    $setWindowFields: {
      partitionBy: "$state",
      sortBy: { orderDate: 1 },
      output: {
        averageQuantityForState: {
          $avg: "$quantity",
          window: {
            documents: ["unbounded", "current"],
          },
        },
      },
    },
  },
]);


db.runCommand({
  count: "orders",
  query: { ord_dt: { $gt: new Date("01/01/2012") } },
});

