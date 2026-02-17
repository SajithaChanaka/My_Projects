const API_BASE_URL = 'https://jsonplaceholder.typicode.com'

async function handleResponse(response) {
  if (!response.ok) {
    const error = new Error('Request failed')
    error.status = response.status
    throw error
  }
  return response.json()
}

export async function fetchPosts() {
  const response = await fetch(`${API_BASE_URL}/posts`)
  return handleResponse(response)
}

export async function fetchPostById(id) {
  const response = await fetch(`${API_BASE_URL}/posts/${id}`)
  return handleResponse(response)
}

