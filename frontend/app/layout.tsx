import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Docker Multi-Service Stack',
  description: 'Rails API + Next.js + PostgreSQL + Nginx',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr">
      <body style={{ fontFamily: 'sans-serif', margin: 0, padding: '20px', backgroundColor: '#f5f5f5' }}>
        <header style={{ backgroundColor: '#333', color: 'white', padding: '20px', marginBottom: '20px', borderRadius: '8px' }}>
          <h1>Docker Multi-Service Stack</h1>
          <p>Rails API + Next.js + PostgreSQL + Nginx</p>
        </header>
        <main>{children}</main>
      </body>
    </html>
  );
}
