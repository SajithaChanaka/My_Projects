import { describe, expect, it } from 'vitest'
import { fireEvent, render, screen } from '@testing-library/react'
import { MemoryRouter } from 'react-router-dom'
import { AuthProvider } from '../context/AuthContext.jsx'
import LoginPage from './LoginPage.jsx'

function renderWithProviders() {
  return render(
    <AuthProvider>
      <MemoryRouter initialEntries={['/login']}>
        <LoginPage />
      </MemoryRouter>
    </AuthProvider>,
  )
}

describe('LoginPage', () => {
  it('validates required phone number and country code', () => {
    renderWithProviders()

    const input = screen.getByLabelText(/phone number/i)
    const button = screen.getByRole('button', { name: /login/i })

    fireEvent.click(button)
    expect(screen.getByText(/phone number is required/i)).toBeInTheDocument()

    fireEvent.change(input, { target: { value: '0712345678' } })
    fireEvent.click(button)
    expect(
      screen.getByText(/phone number must start with country code/i),
    ).toBeInTheDocument()
  })
})
