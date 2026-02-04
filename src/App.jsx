import { useState } from 'react'
import './App.css'

function App() {
  const [yesClicked, setYesClicked] = useState(false)

  const handleYesClick = () => {
    setYesClicked(true)
  }

  const handleNoHover = (e) => {
    const button = e.currentTarget
    const buttonRect = button.getBoundingClientRect()
    
    // Calculate random position within the viewport
    const maxX = window.innerWidth - buttonRect.width - 20
    const maxY = window.innerHeight - buttonRect.height - 20
    
    const randomX = Math.max(10, Math.random() * maxX)
    const randomY = Math.max(10, Math.random() * maxY)
    
    // Set position using fixed positioning for random placement
    button.style.position = 'fixed'
    button.style.left = `${randomX}px`
    button.style.top = `${randomY}px`
    button.style.transform = 'none'
  }

  return (
    <div className="app-container">
      {/* Floating decorative hearts */}
      <div className="floating-hearts">
        <span className="floating-heart">💖</span>
        <span className="floating-heart">💕</span>
        <span className="floating-heart">💗</span>
        <span className="floating-heart">💝</span>
        <span className="floating-heart">💞</span>
        <span className="floating-heart">💓</span>
        <span className="floating-heart">💜</span>
        <span className="floating-heart">💛</span>
      </div>
      
      {/* Sparkles */}
      <div className="sparkles">
        <span className="sparkle">✨</span>
        <span className="sparkle">⭐</span>
        <span className="sparkle">✨</span>
        <span className="sparkle">⭐</span>
        <span className="sparkle">✨</span>
        <span className="sparkle">⭐</span>
      </div>

      {yesClicked ? (
        <div className="success-message">
          <h1 className="success-text">🎉 Yay! You made the right choice! 💕</h1>
          <p className="success-subtext">I'm so happy! 💖✨</p>
          <div className="hearts">
            <span className="heart">💖</span>
            <span className="heart">💕</span>
            <span className="heart">💗</span>
            <span className="heart">💝</span>
            <span className="heart">💞</span>
            <span className="heart">💓</span>
            <span className="heart">💜</span>
          </div>
        </div>
      ) : (
        <div className="proposal-container">
          <div className="question-wrapper">
            <h1 className="question">Will you be my Valentine? 💕</h1>
            <p className="subtitle">Please say yes! 🥺💖</p>
          </div>
          <div className="buttons-container">
            <button 
              className="yes-button" 
              onClick={handleYesClick}
            >
              <span className="button-text">Yes! 💖</span>
              <span className="button-sparkle">✨</span>
            </button>
            <button 
              className="no-button" 
              onMouseEnter={handleNoHover}
              onMouseMove={handleNoHover}
              style={{ cursor: 'not-allowed' }}
            >
              No 😢
            </button>
          </div>
        </div>
      )}
    </div>
  )
}

export default App
