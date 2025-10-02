-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create posts table
CREATE TABLE IF NOT EXISTS posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert 3 test users
INSERT INTO users (name, email) VALUES
    ('Alice Dupont', 'alice@example.com'),
    ('Bob Martin', 'bob@example.com'),
    ('Claire Bernard', 'claire@example.com');

-- Insert 10 test posts
INSERT INTO posts (title, content, user_id) VALUES
    ('Introduction à Docker', 'Docker est une plateforme de conteneurisation qui permet de déployer des applications de manière portable.', 1),
    ('Les bases de PostgreSQL', 'PostgreSQL est un système de gestion de base de données relationnelle open source très puissant.', 1),
    ('Ruby on Rails en 2024', 'Rails continue d''évoluer avec de nouvelles fonctionnalités pour le développement web moderne.', 2),
    ('Next.js et React', 'Next.js est un framework React qui facilite la création d''applications web performantes.', 2),
    ('Architecture microservices', 'Les microservices permettent de diviser une application en services indépendants.', 3),
    ('CI/CD avec GitHub Actions', 'L''intégration et le déploiement continus améliorent la qualité du code.', 1),
    ('Sécurité des applications web', 'La sécurité doit être une priorité dans le développement web.', 3),
    ('Tests automatisés', 'Les tests garantissent la stabilité et la fiabilité de votre application.', 2),
    ('Performance et optimisation', 'L''optimisation des performances est essentielle pour une bonne expérience utilisateur.', 3),
    ('Déploiement en production', 'Le déploiement en production nécessite une planification et des tests rigoureux.', 1);
