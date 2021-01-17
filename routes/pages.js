const express = require('express'),
  router = express.Router();

router.get('/list', function(req, res) {
  // pagesid needs to start at 0, be fully sequential, and be ordered so we can address it by array index value in HTML
  let sql = `SELECT * FROM pages ORDER BY pagesid`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "/pages/list successful"
    })
  })
});

module.exports = router;
