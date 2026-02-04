import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  base: '/private-temp/',
  server: {
    port: 3000,
  },
})
