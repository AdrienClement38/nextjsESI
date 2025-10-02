interface User {
  id: number;
  name: string;
  email: string;
}

interface Post {
  id: number;
  title: string;
  content: string;
  user_id: number;
  user?: User;
  created_at: string;
}

async function getPosts(): Promise<Post[]> {
  const apiUrl = process.env.NEXT_PUBLIC_API_URL || 'http://backend:3000';

  try {
    const res = await fetch(`${apiUrl}/api/posts`, {
      cache: 'no-store',
    });

    if (!res.ok) {
      throw new Error('Failed to fetch posts');
    }

    return res.json();
  } catch (error) {
    console.error('Error fetching posts:', error);
    return [];
  }
}

export default async function Home() {
  const posts = await getPosts();

  if (posts.length === 0) {
    return (
      <div style={{ textAlign: 'center', padding: '40px' }}>
        <h2>Erreur de connexion à l'API</h2>
        <p>Impossible de récupérer les articles. Vérifiez que le backend est disponible.</p>
      </div>
    );
  }

  return (
    <div>
      <h2 style={{ color: '#333' }}>Liste des articles</h2>
      <div style={{ display: 'grid', gap: '20px', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))' }}>
        {posts.map((post) => (
          <a
            key={post.id}
            href={`/posts/${post.id}`}
            style={{
              textDecoration: 'none',
              backgroundColor: 'white',
              padding: '20px',
              borderRadius: '8px',
              boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
              transition: 'transform 0.2s',
            }}
          >
            <h3 style={{ color: '#333', marginTop: 0 }}>{post.title}</h3>
            <p style={{ color: '#666', fontSize: '14px' }}>
              {post.content.substring(0, 100)}...
            </p>
            {post.user && (
              <p style={{ color: '#999', fontSize: '12px', marginBottom: 0 }}>
                Par {post.user.name}
              </p>
            )}
          </a>
        ))}
      </div>
    </div>
  );
}
