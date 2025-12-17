const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const app = express();
const password = "Admin123";

app.use(cors());
app.use(express.json());

const JWT_SECRET = 'f3rt1l1z3rf0rpl4nt';

app.use(express.static(path.join(__dirname, '../frontend')));
app.use('/public', express.static(path.join(__dirname, '../frontend/public')));
app.use('/images', express.static(path.join(__dirname, './images')));
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/home.html'));
});

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'hardwareforge'
});

db.connect(err => {
  if (err) {
    console.error(' Database connection failed:', err);
  } else {
    console.log(' Connected to MySQL database');
  }
});

// get builds data
app.get('/api/builds', (req, res) => {
  const sql = 'SELECT * FROM builds ORDER BY builds_id DESC';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching builds:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// ✅ Get only builds for logged-in user
app.get('/api/my-builds', authenticateToken, (req, res) => {
  const userId = req.user.id;

  const sql = `
    SELECT 
      b.builds_id,
      b.builds_name,
      b.created_at,
      c.id AS cpu_id, c.name AS cpu_name, c.price AS cpu_price, c.image_url AS cpu_image,
      g.id AS gpu_id, g.name AS gpu_name, g.price AS gpu_price, g.image_url AS gpu_image,
      m.id AS motherboard_id, m.name AS motherboard_name, m.price AS motherboard_price, m.image_url AS motherboard_image,
      r.id AS ram_id, r.name AS ram_name, r.price AS ram_price, r.image_url AS ram_image,
      cc.id AS cpucooler_id, cc.name AS cpucooler_name, cc.price AS cpucooler_price, cc.image_url AS cpucooler_image,
      s.id AS storage_id, s.name AS storage_name, s.price AS storage_price, s.image_url AS storage_image,
      cs.id AS case_id, cs.name AS case_name, cs.price AS case_price, cs.image_url AS case_image,
      p.id AS psu_id, p.name AS psu_name, p.price AS psu_price, p.image_url AS psu_image
    FROM builds b
    LEFT JOIN cpus c ON b.cpus_id = c.id
    LEFT JOIN gpus g ON b.gpus_id = g.id
    LEFT JOIN motherboards m ON b.motherboards_id = m.id
    LEFT JOIN rams r ON b.rams_id = r.id
    LEFT JOIN cpucoolers cc ON b.cpucoolers_id = cc.id
    LEFT JOIN storages s ON b.storages_id = s.id
    LEFT JOIN cases cs ON b.cases_id = cs.id
    LEFT JOIN psus p ON b.psus_id = p.id
    WHERE b.Users_id = ?
    ORDER BY b.builds_id DESC
  `;

  db.query(sql, [userId], (err, results) => {
    if (err) {
      console.error('❌ MySQL Error:', err);
      return res.status(500).json({ message: 'Database error' });
    }

    const builds = results.map(row => ({
      builds_id: row.builds_id,
      build_name: row.builds_name,
      cpu: row.cpu_id ? { id: row.cpu_id, name: row.cpu_name, price: row.cpu_price, image_url: row.cpu_image } : null,
      gpu: row.gpu_id ? { id: row.gpu_id, name: row.gpu_name, price: row.gpu_price, image_url: row.gpu_image } : null,
      motherboard: row.motherboard_id ? { id: row.motherboard_id, name: row.motherboard_name, price: row.motherboard_price, image_url: row.motherboard_image } : null,
      ram: row.ram_id ? { id: row.ram_id, name: row.ram_name, price: row.ram_price, image_url: row.ram_image } : null,
      cpucooler: row.cpucooler_id ? { id: row.cpucooler_id, name: row.cpucooler_name, price: row.cpucooler_price, image_url: row.cpucooler_image } : null,
      storage: row.storage_id ? { id: row.storage_id, name: row.storage_name, price: row.storage_price, image_url: row.storage_image } : null,
      case: row.case_id ? { id: row.case_id, name: row.case_name, price: row.case_price, image_url: row.case_image } : null,
      psu: row.psu_id ? { id: row.psu_id, name: row.psu_name, price: row.psu_price, image_url: row.psu_image } : null
    }));

    res.json(builds);
  });
});


// get gpu data
app.get('/api/gpus', (req, res) => {
  const query = 'SELECT id, name, brand, price, image_url, product_url, dimension, color, core_clock, memory_size, memory_type, power_connectors, wattage, card_bus, gpu_category, gpu_subcategory FROM gpus';
  db.query(query, (err, results) => {
    if (err) {
      console.error(' Error fetching GPUs:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get cpu data
app.get('/api/cpus', (req, res) => {
  const query = `
    SELECT id, name, brand, price, image_url, product_url, cores, threads, base_clock, boost_clock, socket, dimension, wattage, cpu_category
    FROM cpus
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching CPUs:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get motherboard data
app.get('/api/motherboards', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, CPU, chipset, memory, LAN, wireless_connection, 
           expansion_slot, storage_interface, form_factor, wattage 
    FROM motherboards
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching motherboards:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get ram data
app.get('/api/rams', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, memory_speed, memory_size, memory_type, color, wattage 
    FROM rams
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching RAMs:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get psu data
app.get('/api/psus', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, EPS_connector, SATA_connector, Dimensions, Modular, 
           PSU_compatibility, PCIe_connector, form_factor, power, efficiency, warranty, weight 
    FROM psus
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching PSUs:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get cases data
app.get('/api/cases', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, product_url, dimensions, form_factor, materials, mainboard_support, front_panel, 
    side_panel, expansion_slot, ssd_slot, hdd_slot, gpu_length, cpuCooler_height, psu_length, weight
    FROM cases
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching Cases:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

// get cpu cooler data
app.get('/api/cpucoolers', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, product_url, liquid_cooling, dimension, heatpipes, wattage
    FROM cpucoolers
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching CPU Coolers:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});

app.get('/api/storages', (req, res) => {
  const query = `
    SELECT id, name, price, image_url, product_url, interface, form_factor, readwrite, power, capacity, storage_type, nand, warranty
    FROM storages
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching Storages:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
});


app.get('/api/build/:buildId', (req, res) => {
  const buildId = req.params.buildId;

  const sql = `
    SELECT 
      b.builds_id,
      b.builds_name,
      b.builds_description,
      u.Username AS user_name,
      c.id AS cpu_id, c.name AS cpu_name, c.price AS cpu_price,
      g.id AS gpu_id, g.name AS gpu_name, g.price AS gpu_price,
      m.id AS motherboard_id, m.name AS motherboard_name, m.price AS motherboard_price,
      r.id AS ram_id, r.name AS ram_name, r.price AS ram_price,
      cc.id AS cooler_id, cc.name AS cooler_name, cc.price AS cooler_price,
      s.id AS storage_id, s.name AS storage_name, s.price AS storage_price,
      cs.id AS case_id, cs.name AS case_name, cs.price AS case_price,
      p.id AS psu_id, p.name AS psu_name, p.price AS psu_price,
      b.total_price
    FROM builds b
    LEFT JOIN users u ON b.Users_id = u.id
    LEFT JOIN cpus c ON b.cpus_id = c.id
    LEFT JOIN gpus g ON b.gpus_id = g.id
    LEFT JOIN motherboards m ON b.motherboards_id = m.id
    LEFT JOIN rams r ON b.rams_id = r.id
    LEFT JOIN cpucoolers cc ON b.cpucoolers_id = cc.id
    LEFT JOIN storages s ON b.storages_id = s.id
    LEFT JOIN cases cs ON b.cases_id = cs.id
    LEFT JOIN psus p ON b.psus_id = p.id
    WHERE b.builds_id = ?
  `;

  db.query(sql, [buildId], (err, results) => {
    if (err) {
      console.error('Error fetching build:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Build not found' });
    }
    res.json(results[0]);
  });
});

app.post("/api/threads", authenticateToken, (req, res) => {
  const { title, content } = req.body;
  const user_id = req.user.id; // ✅ get from JWT

  if (!title || !content) return res.status(400).json({ error: 'Title and content required' });

  const sql = "INSERT INTO threads (user_id, title, content) VALUES (?, ?, ?)";
  db.query(sql, [user_id, title, content], (err, result) => {
    if (err) {
      console.error("Error creating thread:", err);
      return res.status(500).json({ message: "Error creating thread" });
    }
    res.json({ message: "Thread created successfully", id: result.insertId });
  });
});

// Get all threads
app.get("/api/threads", (req, res) => {
  const sql = `
    SELECT t.id, t.title, t.content, t.user_id, t.created_at, u.Username
    FROM threads t
    LEFT JOIN users u ON t.user_id = u.id
    ORDER BY t.created_at DESC
  `;
  db.query(sql, (err, results) => {
    if (err) {
      console.error("Error fetching threads:", err);
      return res.status(500).json({ message: "Error fetching threads" });
    }
    res.json(results);
  });
});

app.get("/api/thread/:threadId", (req, res) => {
  const threadId = req.params.threadId;
  const sql = `
    SELECT t.id, t.title, t.content, t.user_id, t.created_at, u.Username
    FROM threads t
    LEFT JOIN users u ON t.user_id = u.id
    WHERE t.id = ?
  `;
  db.query(sql, [threadId], (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    if (!results.length) return res.status(404).json({ message: 'Thread not found' });
    res.json(results[0]);
  });
});


app.get("/api/replies/:threadId", (req, res) => {
  const { threadId } = req.params;
  const sql = `
    SELECT r.id, r.thread_id, r.user_id, r.content, r.created_at, u.Username
    FROM replies r
    LEFT JOIN users u ON r.user_id = u.id
    WHERE r.thread_id = ?
    ORDER BY r.created_at ASC
  `;
  db.query(sql, [threadId], (err, results) => {
    if (err) {
      console.error("Error fetching replies:", err);
      return res.status(500).json({ message: "Error fetching replies" });
    }
    res.json(results);
  });
});

app.post("/api/replies", authenticateToken, (req, res) => {
  const { thread_id, content } = req.body;
  const user_id = req.user.id; // get user ID from token

  if (!thread_id || !content) {
    return res.status(400).json({ message: "Missing fields" });
  }

  const sql = "INSERT INTO replies (thread_id, user_id, content) VALUES (?, ?, ?)";
  db.query(sql, [thread_id, user_id, content], (err) => {
    if (err) {
      console.error("Error adding reply:", err);
      return res.status(500).json({ message: "Error adding reply" });
    }
    res.json({ message: "Reply added successfully" });
  });
});


const saltRounds = 10;

bcrypt.hash(password, saltRounds, (err, hash) => {
    if(err) throw err;
    console.log("Hashed password:", hash);
});

// register account
app.post('/register', async (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password)
    return res.status(400).json({ message: 'Missing fields' });

  try {
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const query = 'INSERT INTO users (Username, Email_Address, password_hash) VALUES (?, ?, ?)';
    db.query(query, [username, email, hashedPassword], err => {
      if (err) {
        console.error(' MySQL Error:', err);
        return res.status(500).json({ message: 'Database error', error: err.message });
      }
      res.status(201).json({ message: 'User registered successfully' });
    });
  } catch (err) {
    console.error(' Hashing error:', err);
    res.status(500).json({ message: 'Internal server error' });
  }
});

// login account
app.post('/login', async (req, res) => {
  const { email, password } = req.body;

  db.query('SELECT * FROM users WHERE Email_Address = ?', [email], async (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    if (results.length === 0)
      return res.status(401).json({ message: 'Invalid email or password' });

    const user = results[0];
    const match = await bcrypt.compare(password, user.password_hash);
    if (!match)
      return res.status(401).json({ message: 'Invalid email or password' });

    // ✅ Ensure role is returned
    const role = user.role || 'user'; // fallback to 'user' if null

    // Generate JWT token
    const token = jwt.sign(
      { id: user.id, email: user.Email_Address, role: role },
      JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.json({
      message: 'Login successful',
      token,
      user: {
        name: user.Username,
        email: user.Email_Address,
        role: user.role || 'user'  // make sure role is never undefined
      }
    });
  });
});


// token for users to access certain page without logging in
function verifyToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token)
    return res.status(401).json({ message: 'Access denied. No token provided.' });

  jwt.verify(token, JWT_SECRET, (err, decoded) => {
    if (err)
      return res.status(403).json({ message: 'Invalid or expired token.' });
    req.user = decoded;
    next();
  });
}
// Middleware: Verify JWT
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'Access token required' });

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.status(403).json({ message: 'Invalid token' });
    req.user = user;
    next();
  });
}

function authenticateAdmin(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'Access token required' });

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.status(403).json({ message: 'Invalid token' });

    // Check role from DB
    db.query('SELECT role FROM users WHERE id = ?', [user.id], (err, results) => {
      if (err) return res.status(500).json({ message: 'Database error' });
      if (!results.length || results[0].role !== 'admin') {
        return res.status(403).json({ message: 'Admin access required' });
      }
      req.user = user;
      next();
    });
  });
}

// Get all users
app.get('/api/admin/users', authenticateAdmin, (req, res) => {
  db.query('SELECT id, Username, Email_Address, role FROM users', (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json(results);
  });
});

// Update user role
app.put('/api/admin/users/:id', authenticateAdmin, (req, res) => {
  const { role } = req.body;
  const userId = req.params.id;
  db.query('UPDATE users SET role=? WHERE id=?', [role, userId], (err) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json({ message: 'User updated successfully' });
  });
});

// Delete user
app.delete('/api/admin/users/:id', authenticateAdmin, (req, res) => {
  const userId = req.params.id;
  db.query('DELETE FROM users WHERE id=?', [userId], (err) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json({ message: 'User deleted successfully' });
  });
});

// Delete a thread
app.delete('/api/admin/threads/:id', authenticateAdmin, (req, res) => {
  const threadId = req.params.id;
  db.query('DELETE FROM threads WHERE id=?', [threadId], (err) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json({ message: 'Thread deleted successfully' });
  });
});

// Delete a product
app.delete('/api/admin/products/:table/:id', authenticateAdmin, (req, res) => {
  const { table, id } = req.params;

  // Whitelist tables for safety
  const allowedTables = ['cpus','gpus','motherboards','rams','psus','cases','cpucoolers','storages'];
  if (!allowedTables.includes(table)) return res.status(400).json({ message: 'Invalid product type' });

  db.query(`DELETE FROM ?? WHERE id=?`, [table, id], (err) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json({ message: 'Product deleted successfully' });
  });
});

// Update a product (example for CPU, you can extend)
app.put('/api/admin/products/:table/:id', authenticateAdmin, (req, res) => {
  const { table, id } = req.params;
  const updates = req.body;

  const allowedTables = ['cpus','gpus','motherboards','rams','psus','cases','cpucoolers','storages'];
  if (!allowedTables.includes(table)) return res.status(400).json({ message: 'Invalid product type' });

  db.query(`UPDATE ?? SET ? WHERE id=?`, [table, updates, id], (err) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    res.json({ message: 'Product updated successfully' });
  });
});



// save build
app.post('/api/save-build', authenticateToken, (req, res) => {
  const { build_name, cpus_id, gpus_id, motherboards_id, rams_id, cpucoolers_id, storages_id, cases_id, psus_id } = req.body;
  const user_id = req.user.id;

  if (!build_name) {
    return res.status(400).json({ message: 'Build name is required' });
  }

  const query = `
    INSERT INTO builds (
      builds_name, cpus_id, gpus_id, motherboards_id, rams_id,
      cpucoolers_id, storages_id, cases_id, psus_id, Users_id
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(query, [build_name, cpus_id, gpus_id, motherboards_id, rams_id, cpucoolers_id, storages_id, cases_id, psus_id, user_id],
    (err, result) => {
      if (err) {
        console.error('❌ MySQL Error:', err);
        return res.status(500).json({ message: 'Database error', error: err.message });
      }
      res.json({ message: 'Build saved successfully!', build_id: result.insertId });
    }
  );
});

app.post("/api/submit-build", async (req, res) => {
  const { buildId, title, description, is_public } = req.body;

  // 1. Get the saved build
  const [saved] = await db.query(
    "SELECT id, user_id FROM saved_builds WHERE id = ?",
    [buildId]
  );

  if (!saved) {
    return res.status(400).json({ message: "Saved build not found" });
  }

  // 2. Insert into completed builds table
  await db.query(
    `INSERT INTO completed_builds 
    (user_id, builds_id, title, description, is_public, created_at)
    VALUES (?, ?, ?, ?, ?, NOW())`,
    [
      saved.user_id,
      saved.id,
      title,
      description,
      is_public ?? 1
    ]
  );

  res.json({ message: "Completed build submitted successfully!" });
});


app.get('/api/profile', verifyToken, (req, res) => {
  res.json({ message: `Welcome, ${req.user.email}!`, userId: req.user.id });
});

app.get('/api/compare', (req, res) => {
  const { category, filter } = req.query;

  const allowedTables = {
    cpus: {
      table: 'cpus',
      filterColumn: 'cpu_category',
      fields: `
        id, name, brand, price,
        cores, threads, base_clock, boost_clock,
        socket, wattage
      `
    },

    gpus: {
      table: 'gpus',
      filterColumn: 'gpu_category',
      fields: `
        id, name, brand, price,
        core_clock, memory_size, memory_type,
        card_bus, power_connectors, wattage
      `
    },

    ram: {
      table: 'rams',
      fields: `
        id, name, price,
        memory_speed, memory_size, memory_type
      `
    },

    motherboards: {
      table: 'motherboards',
      fields: `
        id, name, price,
        cpu_socket, chipset,
        memory_type, LAN, 
        wireless_connection, 
        form_factor, expansion_slot,
        storage_interface
      `
    },
    storage: {
      table: 'storages',
      fields: `
        id, name, price, interface,
        form_factor, readwrite,
        capacity, storage_type, nand
      `
    },

    psu: {
      table: 'psus',
      fields: `
        id, name, price, EPS_connector,
        SATA_connector, Dimensions, Modular,
        color, PSU_compatibility, form_factor,
        PCIe_connector, power, efficiency
      `
    },

    cpuCooler: {
      table: 'cpucoolers',
      fields: `
        id, name, price, liquid_cooling,
        dimension, color, height_mm, heatpipes,
        tdp
      `
    }
  };

  if (!allowedTables[category]) {
    return res.status(400).json({ message: 'Invalid comparison category' });
  }

  const config = allowedTables[category];

  let sql = `SELECT ${config.fields} FROM ${config.table}`;
  let params = [];

  if (filter && config.filterColumn) {
    sql += ` WHERE ${config.filterColumn} = ?`;
    params.push(filter);
  }

  db.query(sql, params, (err, results) => {
    if (err) {
      console.error('❌ Comparison query error:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    res.json(results);
  });
});

const PORT = 3001;
app.listen(PORT, () => console.log(` Server running at http://localhost:${PORT}`));