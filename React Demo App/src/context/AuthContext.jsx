import { createContext, useContext, useEffect, useState } from 'react'

const AuthContext = createContext(null)

const AUTH_STORAGE_KEY = 'auth'

function readStoredAuth() {
  if (typeof window === 'undefined') {
    return { isAuthenticated: false, phoneNumber: '' }
  }

  try {
    const stored = window.localStorage.getItem(AUTH_STORAGE_KEY)
    if (!stored) {
      return { isAuthenticated: false, phoneNumber: '' }
    }
    const parsed = JSON.parse(stored)
    if (
      typeof parsed === 'object' &&
      parsed !== null &&
      typeof parsed.isAuthenticated === 'boolean'
    ) {
      return {
        isAuthenticated: parsed.isAuthenticated,
        phoneNumber: typeof parsed.phoneNumber === 'string' ? parsed.phoneNumber : '',
      }
    }
    return { isAuthenticated: false, phoneNumber: '' }
  } catch {
    return { isAuthenticated: false, phoneNumber: '' }
  }
}

export function AuthProvider({ children }) {
  const [state, setState] = useState(() => readStoredAuth())

  useEffect(() => {
    try {
      window.localStorage.setItem(AUTH_STORAGE_KEY, JSON.stringify(state))
    } catch (error) {
      console.error(error)
    }
  }, [state])

  const login = (phoneNumber) => {
    setState({
      isAuthenticated: true,
      phoneNumber,
    })
  }

  const logout = () => {
    setState({
      isAuthenticated: false,
      phoneNumber: '',
    })
  }

  const value = {
    isAuthenticated: state.isAuthenticated,
    phoneNumber: state.phoneNumber,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return ctx
}

