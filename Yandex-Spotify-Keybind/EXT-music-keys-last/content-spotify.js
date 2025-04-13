const spotifyControls = {
  play: 'button[data-testid="control-button-playpause"]',
  pause: 'button[data-testid="control-button-playpause"]',
  next: 'button[data-testid="control-button-skip-forward"]',
  prev: 'button[data-testid="control-button-skip-back"]'
};

const clickSpotifyButton = (action) => {
  const selector = spotifyControls[action];
  if (!selector) return false;
  
  const btn = document.querySelector(selector);
  if (btn) {
    btn.click();
    return true;
  }
  return false;
};

chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  let result = false;
  
  switch (request.action) {
    case 'play-pause':
      result = clickSpotifyButton('play');
      break;
    case 'next':
      result = clickSpotifyButton('next');
      break;
    case 'prev':
      result = clickSpotifyButton('prev');
      break;
  }
  
  sendResponse({ success: result });
  return true;
});