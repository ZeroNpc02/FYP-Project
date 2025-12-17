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
    SELECT id, name, price, image_url, product_url, liquid_cooling, dimension, heatpipes, tdp
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

app.get('/api/admin/analysis', authenticateAdmin, (req, res) => {
  const tables = {
    cpu: { column: 'cpus_id', table: 'cpus' },
    gpu: { column: 'gpus_id', table: 'gpus' },
    motherboard: { column: 'motherboards_id', table: 'motherboards' },
    ram: { column: 'rams_id', table: 'rams' },
    cpucooler: { column: 'cpucoolers_id', table: 'cpucoolers' },
    storage: { column: 'storages_id', table: 'storages' },
    case_component: { column: 'cases_id', table: 'cases' },
    psu: { column: 'psus_id', table: 'psus' }
  };

  const analysis = {};
  let processed = 0;
  const totalComponents = Object.keys(tables).length;

  for (const [component, config] of Object.entries(tables)) {
    const sql = `
      SELECT b.${config.column} AS id, p.name, COUNT(*) AS total
      FROM builds b
      LEFT JOIN ${config.table} p ON b.${config.column} = p.id
      GROUP BY b.${config.column}, p.name
      ORDER BY total DESC
      LIMIT 1
    `;

    db.query(sql, (err, results) => {
      processed++;

      if (err) {
        console.error(`[ANALYSIS] Error fetching ${component}:`, err);
        analysis[component] = { id: null, name: 'N/A', total: 0 };
      } else {
        analysis[component] = results[0] || { id: null, name: 'N/A', total: 0 };
      }

      if (processed === totalComponents) {
        res.json(analysis);
      }
    });
  }
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

// =============================================
// COMPLETED BUILDS FEATURE - API ENDPOINTS
// =============================================

// Helper function to calculate total build price
async function calculateBuildPrice(buildId) {
  return new Promise((resolve, reject) => {
    const sql = `
      SELECT
        COALESCE(c.price, 0) AS cpu_price,
        COALESCE(g.price, 0) AS gpu_price,
        COALESCE(m.price, 0) AS motherboard_price,
        COALESCE(r.price, 0) AS ram_price,
        COALESCE(cc.price, 0) AS cpucooler_price,
        COALESCE(s.price, 0) AS storage_price,
        COALESCE(cs.price, 0) AS case_price,
        COALESCE(p.price, 0) AS psu_price
      FROM builds b
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
        reject(err);
        return;
      }
      if (!results.length) {
        resolve(0);
        return;
      }
      
      const row = results[0];
      const totalPrice =
        parseFloat(row.cpu_price || 0) +
        parseFloat(row.gpu_price || 0) +
        parseFloat(row.motherboard_price || 0) +
        parseFloat(row.ram_price || 0) +
        parseFloat(row.cpucooler_price || 0) +
        parseFloat(row.storage_price || 0) +
        parseFloat(row.case_price || 0) +
        parseFloat(row.psu_price || 0);
      
      resolve(totalPrice);
    });
  });
}

// GET /api/completed-builds - Get all public completed builds
app.get('/api/completed-builds', (req, res) => {
  console.log('[COMPLETED-BUILDS] GET /api/completed-builds - Fetching all public completed builds');
  
  const sql = `
    SELECT
      cb.completed_id AS id,
      cb.completed_id,
      cb.title,
      cb.description,
      cb.created_at,
      u.Username AS username,
      u.id AS user_id,
      b.builds_id,
      b.builds_name,
      COALESCE(c.price, 0) + COALESCE(g.price, 0) + COALESCE(m.price, 0) +
      COALESCE(r.price, 0) + COALESCE(cc.price, 0) + COALESCE(s.price, 0) +
      COALESCE(cs.price, 0) + COALESCE(p.price, 0) AS total_price,
      COALESCE(AVG(br.rating), 0) AS average_rating,
      COUNT(DISTINCT br.rating_id) AS rating_count,
      COUNT(DISTINCT bc.comment_id) AS comment_count
    FROM completed_builds cb
    LEFT JOIN users u ON cb.user_id = u.id
    LEFT JOIN builds b ON cb.builds_id = b.builds_id
    LEFT JOIN cpus c ON b.cpus_id = c.id
    LEFT JOIN gpus g ON b.gpus_id = g.id
    LEFT JOIN motherboards m ON b.motherboards_id = m.id
    LEFT JOIN rams r ON b.rams_id = r.id
    LEFT JOIN cpucoolers cc ON b.cpucoolers_id = cc.id
    LEFT JOIN storages s ON b.storages_id = s.id
    LEFT JOIN cases cs ON b.cases_id = cs.id
    LEFT JOIN psus p ON b.psus_id = p.id
    LEFT JOIN build_ratings br ON cb.completed_id = br.completed_build_id
    LEFT JOIN build_comments bc ON cb.completed_id = bc.completed_build_id
    WHERE cb.is_public = 1
    GROUP BY cb.completed_id
    ORDER BY cb.created_at DESC
  `;

  db.query(sql, (err, results) => {
    if (err) {
      console.error('[COMPLETED-BUILDS] ❌ Database error fetching completed builds:', err);
      console.error('[COMPLETED-BUILDS] Error stack:', err.stack);
      return res.status(500).json({ message: 'Database error' });
    }
    console.log(`[COMPLETED-BUILDS] ✅ Successfully fetched ${results.length} completed builds`);
    if (results.length > 0) {
      console.log('[COMPLETED-BUILDS] Sample build IDs:', results.slice(0, 3).map(b => ({ id: b.id, completed_id: b.completed_id, title: b.title })));
    }
    res.json(results);
  });
});

// GET /api/completed-builds/:id - Get specific completed build with full details
app.get('/api/completed-builds/:id', (req, res) => {
  const completedId = req.params.id;
  
  console.log('[COMPLETED-BUILDS] GET /api/completed-builds/:id');
  console.log('[COMPLETED-BUILDS] Requested ID:', completedId);
  console.log('[COMPLETED-BUILDS] ID type:', typeof completedId);
  
  // Validate the ID parameter
  if (!completedId || completedId === 'undefined' || completedId === 'null') {
    console.error('[COMPLETED-BUILDS] ❌ Invalid ID parameter:', completedId);
    return res.status(400).json({ message: 'Invalid build ID. The ID parameter is missing or invalid.' });
  }
  
  const sql = `
    SELECT
      cb.completed_id,
      cb.title,
      cb.description,
      cb.is_public,
      cb.created_at,
      u.Username AS username,
      u.id AS user_id,
      b.builds_id,
      b.builds_name,
      c.id AS cpu_id, c.name AS cpu_name, c.price AS cpu_price, c.image_url AS cpu_image,
      g.id AS gpu_id, g.name AS gpu_name, g.price AS gpu_price, g.image_url AS gpu_image,
      m.id AS motherboard_id, m.name AS motherboard_name, m.price AS motherboard_price, m.image_url AS motherboard_image,
      r.id AS ram_id, r.name AS ram_name, r.price AS ram_price, r.image_url AS ram_image,
      cc.id AS cpucooler_id, cc.name AS cpucooler_name, cc.price AS cpucooler_price, cc.image_url AS cpucooler_image,
      s.id AS storage_id, s.name AS storage_name, s.price AS storage_price, s.image_url AS storage_image,
      cs.id AS case_id, cs.name AS case_name, cs.price AS case_price, cs.image_url AS case_image,
      p.id AS psu_id, p.name AS psu_name, p.price AS psu_price, p.image_url AS psu_image,
      COALESCE(AVG(br.rating), 0) AS average_rating,
      COUNT(DISTINCT br.rating_id) AS rating_count
    FROM completed_builds cb
    LEFT JOIN users u ON cb.user_id = u.id
    LEFT JOIN builds b ON cb.builds_id = b.builds_id
    LEFT JOIN cpus c ON b.cpus_id = c.id
    LEFT JOIN gpus g ON b.gpus_id = g.id
    LEFT JOIN motherboards m ON b.motherboards_id = m.id
    LEFT JOIN rams r ON b.rams_id = r.id
    LEFT JOIN cpucoolers cc ON b.cpucoolers_id = cc.id
    LEFT JOIN storages s ON b.storages_id = s.id
    LEFT JOIN cases cs ON b.cases_id = cs.id
    LEFT JOIN psus p ON b.psus_id = p.id
    LEFT JOIN build_ratings br ON cb.completed_id = br.completed_build_id
    WHERE cb.completed_id = ?
    GROUP BY cb.completed_id
  `;

  console.log('[COMPLETED-BUILDS] Executing query for completed_id:', completedId);
  
  db.query(sql, [completedId], (err, results) => {
    if (err) {
      console.error('[COMPLETED-BUILDS] ❌ Database error fetching build details:', err);
      console.error('[COMPLETED-BUILDS] Error code:', err.code);
      console.error('[COMPLETED-BUILDS] Error stack:', err.stack);
      return res.status(500).json({ message: 'Database error' });
    }
    
    console.log('[COMPLETED-BUILDS] Query results count:', results.length);
    
    if (!results.length) {
      console.warn('[COMPLETED-BUILDS] ⚠️ Build not found for ID:', completedId);
      return res.status(404).json({ message: 'Completed build not found' });
    }

    const row = results[0];
    console.log('[COMPLETED-BUILDS] ✅ Found build:', {
      completed_id: row.completed_id,
      title: row.title,
      username: row.username,
      builds_id: row.builds_id
    });
    
    const build = {
      id: row.completed_id, // Add 'id' alias for frontend compatibility
      completed_id: row.completed_id,
      title: row.title,
      description: row.description,
      is_public: row.is_public,
      created_at: row.created_at,
      username: row.username,
      user_id: row.user_id,
      builds_id: row.builds_id,
      builds_name: row.builds_name,
      average_rating: parseFloat(row.average_rating).toFixed(1),
      rating_count: row.rating_count,
      total_price:
        parseFloat(row.cpu_price || 0) +
        parseFloat(row.gpu_price || 0) +
        parseFloat(row.motherboard_price || 0) +
        parseFloat(row.ram_price || 0) +
        parseFloat(row.cpucooler_price || 0) +
        parseFloat(row.storage_price || 0) +
        parseFloat(row.case_price || 0) +
        parseFloat(row.psu_price || 0),
      cpu: row.cpu_id ? { id: row.cpu_id, name: row.cpu_name, price: row.cpu_price, image_url: row.cpu_image } : null,
      gpu: row.gpu_id ? { id: row.gpu_id, name: row.gpu_name, price: row.gpu_price, image_url: row.gpu_image } : null,
      motherboard: row.motherboard_id ? { id: row.motherboard_id, name: row.motherboard_name, price: row.motherboard_price, image_url: row.motherboard_image } : null,
      ram: row.ram_id ? { id: row.ram_id, name: row.ram_name, price: row.ram_price, image_url: row.ram_image } : null,
      cpucooler: row.cpucooler_id ? { id: row.cpucooler_id, name: row.cpucooler_name, price: row.cpucooler_price, image_url: row.cpucooler_image } : null,
      storage: row.storage_id ? { id: row.storage_id, name: row.storage_name, price: row.storage_price, image_url: row.storage_image } : null,
      case_component: row.case_id ? { id: row.case_id, name: row.case_name, price: row.case_price, image_url: row.case_image } : null,
      psu: row.psu_id ? { id: row.psu_id, name: row.psu_name, price: row.psu_price, image_url: row.psu_image } : null
    };

    console.log('[COMPLETED-BUILDS] ✅ Sending build response with total_price:', build.total_price);
    res.json(build);
  });
});

// POST /api/completed-builds - Submit a saved build as completed (protected)
app.post('/api/completed-builds', authenticateToken, (req, res) => {
  const { builds_id, title, description } = req.body;
  const user_id = req.user.id;

  if (!builds_id || !title) {
    return res.status(400).json({ message: 'Build ID and title are required' });
  }

  // First verify the build belongs to the user
  db.query('SELECT builds_id, Users_id FROM builds WHERE builds_id = ?', [builds_id], (err, results) => {
    if (err) {
      console.error('Error verifying build ownership:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Build not found' });
    }
    if (results[0].Users_id !== user_id) {
      return res.status(403).json({ message: 'You can only submit your own builds' });
    }

    // Check if this build has already been submitted as completed
    db.query('SELECT completed_id FROM completed_builds WHERE builds_id = ?', [builds_id], (err, existing) => {
      if (err) {
        console.error('Error checking existing completed build:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      if (existing.length) {
        return res.status(400).json({ message: 'This build has already been submitted as completed' });
      }

      // Insert into completed_builds
      const insertSql = `
        INSERT INTO completed_builds (user_id, builds_id, title, description, is_public)
        VALUES (?, ?, ?, ?, 1)
      `;
      
      db.query(insertSql, [user_id, builds_id, title, description || null], (err, result) => {
        if (err) {
          console.error('Error creating completed build:', err);
          return res.status(500).json({ message: 'Database error' });
        }
        res.status(201).json({
          message: 'Build submitted as completed successfully!',
          completed_id: result.insertId
        });
      });
    });
  });
});

// GET /api/user/saved-builds - Get user's saved builds for selection (not yet submitted)
app.get('/api/user/saved-builds', authenticateToken, (req, res) => {
  const userId = req.user.id;

  const sql = `
    SELECT
      b.builds_id,
      b.builds_name,
      COALESCE(c.price, 0) + COALESCE(g.price, 0) + COALESCE(m.price, 0) +
      COALESCE(r.price, 0) + COALESCE(cc.price, 0) + COALESCE(s.price, 0) +
      COALESCE(cs.price, 0) + COALESCE(p.price, 0) AS total_price,
      c.name AS cpu_name,
      g.name AS gpu_name
    FROM builds b
    LEFT JOIN cpus c ON b.cpus_id = c.id
    LEFT JOIN gpus g ON b.gpus_id = g.id
    LEFT JOIN motherboards m ON b.motherboards_id = m.id
    LEFT JOIN rams r ON b.rams_id = r.id
    LEFT JOIN cpucoolers cc ON b.cpucoolers_id = cc.id
    LEFT JOIN storages s ON b.storages_id = s.id
    LEFT JOIN cases cs ON b.cases_id = cs.id
    LEFT JOIN psus p ON b.psus_id = p.id
    LEFT JOIN completed_builds cb ON b.builds_id = cb.builds_id
    WHERE b.Users_id = ? AND cb.completed_id IS NULL
    ORDER BY b.builds_id DESC
  `;

  db.query(sql, [userId], (err, results) => {
    if (err) {
      console.error('Error fetching user saved builds:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    res.json(results);
  });
});

// DELETE /api/completed-builds/:id - Delete a completed build (protected)
app.delete('/api/completed-builds/:id', authenticateToken, (req, res) => {
  const completedId = req.params.id;
  const userId = req.user.id;

  // Verify ownership
  db.query('SELECT user_id FROM completed_builds WHERE completed_id = ?', [completedId], (err, results) => {
    if (err) {
      console.error('Error verifying ownership:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Completed build not found' });
    }
    if (results[0].user_id !== userId) {
      return res.status(403).json({ message: 'You can only delete your own completed builds' });
    }

    db.query('DELETE FROM completed_builds WHERE completed_id = ?', [completedId], (err) => {
      if (err) {
        console.error('Error deleting completed build:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      res.json({ message: 'Completed build deleted successfully' });
    });
  });
});

// =============================================
// COMMENTS ENDPOINTS
// =============================================

// GET /api/completed-builds/:id/comments - Get comments for a build
app.get('/api/completed-builds/:id/comments', (req, res) => {
  const completedId = req.params.id;

  console.log('[COMPLETED-BUILDS] GET /api/completed-builds/:id/comments');
  console.log('[COMPLETED-BUILDS] Fetching comments for build ID:', completedId);

  const sql = `
    SELECT
      bc.comment_id AS id,
      bc.comment_id,
      bc.content,
      bc.parent_comment_id,
      bc.created_at,
      bc.updated_at,
      u.id AS user_id,
      u.Username AS username
    FROM build_comments bc
    LEFT JOIN users u ON bc.user_id = u.id
    WHERE bc.completed_build_id = ?
    ORDER BY bc.created_at ASC
  `;

  db.query(sql, [completedId], (err, results) => {
    if (err) {
      console.error('[COMPLETED-BUILDS] ❌ Error fetching comments:', err);
      console.error('[COMPLETED-BUILDS] Error stack:', err.stack);
      return res.status(500).json({ message: 'Database error' });
    }
    console.log(`[COMPLETED-BUILDS] ✅ Fetched ${results.length} comments for build ${completedId}`);
    res.json(results);
  });
});

// POST /api/completed-builds/:id/comments - Add comment (protected)
app.post('/api/completed-builds/:id/comments', authenticateToken, (req, res) => {
  const completedId = req.params.id;
  const userId = req.user.id;
  const { content, parent_comment_id } = req.body;

  if (!content || !content.trim()) {
    return res.status(400).json({ message: 'Comment content is required' });
  }

  // Verify the completed build exists
  db.query('SELECT completed_id FROM completed_builds WHERE completed_id = ?', [completedId], (err, results) => {
    if (err) {
      console.error('Error verifying completed build:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Completed build not found' });
    }

    const insertSql = `
      INSERT INTO build_comments (completed_build_id, user_id, parent_comment_id, content)
      VALUES (?, ?, ?, ?)
    `;

    db.query(insertSql, [completedId, userId, parent_comment_id || null, content.trim()], (err, result) => {
      if (err) {
        console.error('Error creating comment:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      res.status(201).json({
        message: 'Comment added successfully',
        comment_id: result.insertId
      });
    });
  });
});

// DELETE /api/comments/:commentId - Delete comment (protected)
app.delete('/api/comments/:commentId', authenticateToken, (req, res) => {
  const commentId = req.params.commentId;
  const userId = req.user.id;

  // Verify ownership
  db.query('SELECT user_id FROM build_comments WHERE comment_id = ?', [commentId], (err, results) => {
    if (err) {
      console.error('Error verifying comment ownership:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Comment not found' });
    }
    if (results[0].user_id !== userId) {
      return res.status(403).json({ message: 'You can only delete your own comments' });
    }

    db.query('DELETE FROM build_comments WHERE comment_id = ?', [commentId], (err) => {
      if (err) {
        console.error('Error deleting comment:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      res.json({ message: 'Comment deleted successfully' });
    });
  });
});

// =============================================
// RATINGS ENDPOINTS
// =============================================

// POST /api/completed-builds/:id/rating - Add/update rating (protected)
app.post('/api/completed-builds/:id/rating', authenticateToken, (req, res) => {
  const completedId = req.params.id;
  const userId = req.user.id;
  const { rating } = req.body;

  console.log('[COMPLETED-BUILDS] POST /api/completed-builds/:id/rating');
  console.log('[COMPLETED-BUILDS] Build ID:', completedId, 'User ID:', userId, 'Rating:', rating);

  if (!rating || rating < 1 || rating > 5) {
    console.warn('[COMPLETED-BUILDS] ⚠️ Invalid rating value:', rating);
    return res.status(400).json({ message: 'Rating must be between 1 and 5' });
  }

  // Verify the completed build exists
  db.query('SELECT completed_id, user_id FROM completed_builds WHERE completed_id = ?', [completedId], (err, results) => {
    if (err) {
      console.error('[COMPLETED-BUILDS] ❌ Error verifying completed build:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.status(404).json({ message: 'Completed build not found' });
    }
    
    // Prevent users from rating their own builds
    if (results[0].user_id === userId) {
      return res.status(400).json({ message: 'You cannot rate your own build' });
    }

    // Use UPSERT - INSERT ... ON DUPLICATE KEY UPDATE
    const upsertSql = `
      INSERT INTO build_ratings (completed_build_id, user_id, rating)
      VALUES (?, ?, ?)
      ON DUPLICATE KEY UPDATE rating = ?, updated_at = CURRENT_TIMESTAMP
    `;

    db.query(upsertSql, [completedId, userId, rating, rating], (err, result) => {
      if (err) {
        console.error('Error saving rating:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      res.json({
        message: result.affectedRows === 1 ? 'Rating added successfully' : 'Rating updated successfully',
        rating: rating
      });
    });
  });
});

// GET /api/completed-builds/:id/rating - Get user's rating for a build (protected)
app.get('/api/completed-builds/:id/rating', authenticateToken, (req, res) => {
  const completedId = req.params.id;
  const userId = req.user.id;

  const sql = `
    SELECT rating, created_at, updated_at
    FROM build_ratings
    WHERE completed_build_id = ? AND user_id = ?
  `;

  db.query(sql, [completedId, userId], (err, results) => {
    if (err) {
      console.error('Error fetching user rating:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    if (!results.length) {
      return res.json({ rating: null });
    }
    res.json(results[0]);
  });
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


app.get('/api/profile', verifyToken, (req, res) => {
  res.json({ message: `Welcome, ${req.user.email}!`, userId: req.user.id });
});

const PORT = 3001;
app.listen(PORT, () => console.log(` Server running at http://localhost:${PORT}`));
