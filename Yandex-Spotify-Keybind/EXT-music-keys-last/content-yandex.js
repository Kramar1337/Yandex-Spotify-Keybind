// Находим активный плеер (главный или мини-плеер)
const getActivePlayer = () => {
  // 1. Ищем главный плеер
  const mainPlayer = document.querySelector('.player-controls, .BaseSonataControlsDesktop_root__E6wjA');
  
  // 2. Ищем мини-плеер в текущем элементе
  const activeElement = document.activeElement;
  const miniPlayer = activeElement.closest('.track, .track__container');
  
  return miniPlayer || mainPlayer;
};

// Нажимаем кнопку в контексте нужного плеера
const clickPlayerButton = (player, action) => {
  if (!player) return false;
  
  const buttons = {
    play: player.querySelector('button[aria-label*="Play"], button[aria-label*="Воспроизведение"], svg use[href*="play"]'),
    pause: player.querySelector('button[aria-label*="Pause"], button[aria-label*="Пауза"], svg use[href*="pause"]'),
    next: player.querySelector('button[aria-label*="Next"], button[aria-label*="Следующая"], svg use[href*="next"]'),
    prev: player.querySelector('button[aria-label*="Previous"], button[aria-label*="Предыдущая"], svg use[href*="previous"]')
  };
  
  const btn = action === 'play-pause' 
    ? (buttons.pause || buttons.play)
    : buttons[action];
  
  if (btn) {
    btn.closest('button')?.click();
    return true;
  }
  
  return false;
};

// Обработчик команд
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  const player = getActivePlayer();
  let result = false;
  
  switch (request.action) {
    case 'play-pause':
      result = clickPlayerButton(player, 'play-pause');
      break;
    case 'next':
      result = clickPlayerButton(player, 'next');
      break;
    case 'prev':
      result = clickPlayerButton(player, 'prev');
      break;
  }
  
  sendResponse({success: result});
  return true;
});