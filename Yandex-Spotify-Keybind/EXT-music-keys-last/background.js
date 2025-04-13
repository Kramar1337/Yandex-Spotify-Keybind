let yandexTabs = new Set();
let spotifyTabs = new Set();

const updateTabs = async () => {
  const [yandex, spotify] = await Promise.all([
    chrome.tabs.query({ url: '*://music.yandex.ru/*' }),
    chrome.tabs.query({ url: '*://open.spotify.com/*' })
  ]);
  
  yandexTabs = new Set(yandex.map(tab => tab.id));
  spotifyTabs = new Set(spotify.map(tab => tab.id));
};

const sendCommand = async (tabId, command) => {
  try {
    await chrome.tabs.sendMessage(tabId, { action: command });
    return true;
  } catch (e) {
    console.log(`Tab ${tabId} not responding, retrying...`);
    return false;
  }
};

chrome.commands.onCommand.addListener(async (command) => {
  await updateTabs();
  
  // Сначала пробуем активную вкладку
  const [activeTab] = await chrome.tabs.query({ active: true, currentWindow: true });
  if (activeTab) {
    if (yandexTabs.has(activeTab.id)) {
      if (await sendCommand(activeTab.id, command === 'play' ? 'play-pause' : command)) return;
    }
    if (spotifyTabs.has(activeTab.id)) {
      if (await sendCommand(activeTab.id, command)) return;
    }
  }
  
  // Затем все остальные вкладки
  for (const tabId of [...yandexTabs, ...spotifyTabs]) {
    if (await sendCommand(tabId, command)) return;
  }
  
  console.log('No active music tabs found');
});

// Фоновое обновление
chrome.tabs.onUpdated.addListener(updateTabs);
chrome.tabs.onRemoved.addListener(updateTabs);
setInterval(updateTabs, 15000);