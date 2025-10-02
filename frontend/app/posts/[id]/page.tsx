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

async function getPost(id: string): Promise<Post | null> {
  const apiUrl = process.env.NEXT_PUBLIC_API_URL || 'http://backend:3000';

  try {
    const res = await fetch(`${apiUrl}/api/posts/${id}`, {
      cache: 'no-store',
    });

    if (!res.ok) {
      return null;
    }

    return res.json();
  } catch (error) {
    console.error('Error fetching post:', error);
    return null;
  }
}

export default async function PostPage({ params }: { params: { id: string } }) {
  const post = await getPost(params.id);

  if (!post) {
    return (
      <div style={{ textAlign: 'center', padding: '40px' }}>
        <h2>Article non trouvé</h2>
        <p>L'article demandé n'existe pas ou n'a pas pu être chargé.</p>
        <a
          href="/"
          style={{
            display: 'inline-block',
            marginTop: '20px',
            padding: '10px 20px',
            backgroundColor: '#333',
            color: 'white',
            textDecoration: 'none',
            borderRadius: '4px',
          }}
        >
          Retour à la liste
        </a>
      </div>
    );
  }

  return (
    <div>
      <a
        href="/"
        style={{
          display: 'inline-block',
          marginBottom: '20px',
          color: '#666',
          textDecoration: 'none',
        }}
      >
        ← Retour à la liste
      </a>
      <article
        style={{
          backgroundColor: 'white',
          padding: '40px',
          borderRadius: '8px',
          boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
        }}
      >
        <h1 style={{ color: '#333', marginTop: 0 }}>{post.title}</h1>
        {post.user && (
          <div style={{ color: '#999', fontSize: '14px', marginBottom: '20px' }}>
            Par {post.user.name} ({post.user.email})
          </div>
        )}
        <div style={{ color: '#666', lineHeight: '1.6' }}>
          {post.content}
        </div>
        <div style={{ marginTop: '30px', paddingTop: '20px', borderTop: '1px solid #eee', color: '#999', fontSize: '12px' }}>
          Publié le {new Date(post.created_at).toLocaleDateString('fr-FR', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
          })}
        </div>
      </article>
    </div>
  );
}
