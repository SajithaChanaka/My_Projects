import { useEffect, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { fetchPostById } from '../services/api.js'

function DetailPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const params = useParams()

  const initialPost = location.state && location.state.post ? location.state.post : null
  const hasInitialPost = Boolean(initialPost)

  const [post, setPost] = useState(initialPost)
  const [loading, setLoading] = useState(!hasInitialPost && Boolean(params.id))
  const [error, setError] = useState('')

  useEffect(() => {
    if (post) {
      return
    }

    const id = params.id
    if (!id) {
      return
    }

    let cancelled = false

    fetchPostById(id)
      .then((data) => {
        if (!cancelled) {
          setPost(data)
        }
      })
      .catch(() => {
        if (!cancelled) {
          setError('Failed to load post. Please try again.')
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
  }, [params.id, post])

  const handleBack = () => {
    navigate('/', { replace: false })
  }

  if (!params.id) {
    return (
      <div className="page page-centered">
        <div className="status status-error">
          <span>Missing post id.</span>
        </div>
        <button type="button" className="button button-secondary" onClick={handleBack}>
          Back to posts
        </button>
      </div>
    )
  }

  if (loading) {
    return (
      <div className="page page-centered">
        <div className="status status-info">
          <span>Loading post...</span>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="page page-centered">
        <div className="status status-error">
          <span>{error}</span>
        </div>
        <button type="button" className="button button-secondary" onClick={handleBack}>
          Back to posts
        </button>
      </div>
    )
  }

  if (!post) {
    return (
      <div className="page page-centered">
        <div className="status">
          <span>No post found.</span>
        </div>
        <button type="button" className="button button-secondary" onClick={handleBack}>
          Back to posts
        </button>
      </div>
    )
  }

  return (
    <div className="page">
      <header className="page-header">
        <div>
          <h1 className="page-title">Post details</h1>
          <p className="page-subtitle">Post #{post.id}</p>
        </div>
        <button type="button" className="button button-secondary" onClick={handleBack}>
          Back to posts
        </button>
      </header>

      <article className="card">
        <h2 className="list-item-title">{post.title}</h2>
        <p className="list-item-body">{post.body}</p>
      </article>
    </div>
  )
}

export default DetailPage
