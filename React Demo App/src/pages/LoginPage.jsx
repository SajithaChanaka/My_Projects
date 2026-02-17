import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext.jsx'

const VALID_PHONE_NUMBER = '+254712345678'

function LoginPage() {
  const [phoneNumber, setPhoneNumber] = useState('')
  const [error, setError] = useState('')
  const navigate = useNavigate()
  const { login } = useAuth()

  const handleSubmit = (event) => {
    event.preventDefault()

    if (!phoneNumber.trim()) {
      setError('Phone number is required')
      return
    }

    if (!phoneNumber.startsWith('+254')) {
      setError('Phone number must start with country code +254')
      return
    }

    if (phoneNumber !== VALID_PHONE_NUMBER) {
      setError('Invalid phone number')
      return
    }

    setError('')
    login(phoneNumber)
    navigate('/', { replace: true })
  }

  const handleChange = (event) => {
    setPhoneNumber(event.target.value)
    if (error) {
      setError('')
    }
  }

  return (
    <div className="page page-centered">
      <div className="card">
        <h1 className="page-title">Login</h1>
        <p className="page-subtitle">Enter your phone number to continue</p>
        <form className="form" onSubmit={handleSubmit} noValidate>
          <label className="form-label" htmlFor="phone">
            Phone number
          </label>
          <input
            id="phone"
            name="phone"
            type="tel"
            className="input"
            placeholder="+254712345678"
            value={phoneNumber}
            onChange={handleChange}
            autoComplete="tel"
          />
          {error && <div className="form-error">{error}</div>}
          <button type="submit" className="button button-primary">
            Login
          </button>
        </form>
        <p className="helper-text">Use +254712345678 as the demo phone number</p>
      </div>
    </div>
  )
}

export default LoginPage
