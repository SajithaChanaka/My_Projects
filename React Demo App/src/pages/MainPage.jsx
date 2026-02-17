import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { fetchPosts } from '../services/api.js'
import { useAuth } from '../context/AuthContext.jsx'

function MainPage() {
  const [posts, setPosts] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')
  const navigate = useNavigate()
  const { phoneNumber, logout } = useAuth()

  useEffect(() => {
    let cancelled = false

    fetchPosts()
      .then((data) => {
        if (!cancelled) {
          setPosts(data)
        }
      })
      .catch(() => {
        if (!cancelled) {
          setError('Failed to load posts. Please try again.')
        }
      })
      .finally(() => {
        if (!cancelled) {
          setLoading(false)
        }
      })

    return () => {
      cancelled = true
    }
  }, [])

  const filteredPosts = useMemo(() => {
    const term = search.trim().toLowerCase()
    if (!term) {
      return posts
    }
    return posts.filter((post) => post.title.toLowerCase().includes(term))
  }, [posts, search])

  const handleSearchChange = (event) => {
    setSearch(event.target.value)
  }

  const handleLogout = () => {
    logout()
    navigate('/login', { replace: true })
  }

  const handleOpenPost = (post) => {
    navigate(`/posts/${post.id}`, { state: { post } })
  }

  return (
    <div className="page">
      <header className="page-header">
        <div>
          <h1 className="page-title">Posts</h1>
          <p className="page-subtitle">Data loaded from JSONPlaceholder</p>
        </div>
        <div className="header-right">
          {phoneNumber && <span className="pill">Signed in as {phoneNumber}</span>}
          <button type="button" className="button button-secondary" onClick={handleLogout}>
            Logout
          </button>
        </div>
      </header>

      <section className="section">
        <label className="form-label" htmlFor="search">
          Search posts
        </label>
        <input
          id="search"
          type="search"
          className="input"
          placeholder="Type to filter by title..."
          value={search}
          onChange={handleSearchChange}
        />
      </section>

      {loading && (
        <div className="status status-info">
          <span>Loading posts...</span>
        </div>
      )}

      {error && (
        <div className="status status-error">
          <span>{error}</span>
        </div>
      )}

      {!loading && !error && (
        <section className="list">
          {filteredPosts.length === 0 ? (
            <div className="status">
              <span>No posts match your search.</span>
            </div>
          ) : (
            filteredPosts.map((post) => (
              <article
                key={post.id}
                className="list-item"
                onClick={() => handleOpenPost(post)}
              >
                <h2 className="list-item-title">{post.title}</h2>
                <p className="list-item-body">{post.body}</p>
              </article>
            ))
          )}
        </section>
      )}
    </div>
  )
}

export default MainPage
