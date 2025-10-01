CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       created_at TIMESTAMP DEFAULT NOW(),
                       updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content TEXT,
                       user_id INT REFERENCES users(id),
                       created_at TIMESTAMP DEFAULT NOW(),
                       updated_at TIMESTAMP DEFAULT NOW()
);

-- 3 users
INSERT INTO users (name, email) VALUES
                                    ('Alice', 'alice@example.com'),
                                    ('Bob', 'bob@example.com'),
                                    ('Charlie', 'charlie@example.com');

-- 10 posts
INSERT INTO posts (title, content, user_id) VALUES
                                                ('Post 1', 'Contenu du post 1', 1),
                                                ('Post 2', 'Contenu du post 2', 1),
                                                ('Post 3', 'Contenu du post 3', 2),
                                                ('Post 4', 'Contenu du post 4', 2),
                                                ('Post 5', 'Contenu du post 5', 2),
                                                ('Post 6', 'Contenu du post 6', 3),
                                                ('Post 7', 'Contenu du post 7', 3),
                                                ('Post 8', 'Contenu du post 8', 3),
                                                ('Post 9', 'Contenu du post 9', 1),
                                                ('Post 10', 'Contenu du post 10', 2);
