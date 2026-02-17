// SVG Circle configuration
const circle = document.querySelector('.progress-ring__circle');
const radius = circle.r.baseVal.value;
const circumference = radius * 2 * Math.PI;

circle.style.strokeDasharray = `${circumference} ${circumference}`;
circle.style.strokeDashoffset = circumference;

function setProgress(percent) {
    const offset = circumference - (percent / 100) * circumference;
    circle.style.strokeDashoffset = offset;
}

// Application State
const state = {
    timeLeft: 25 * 60,
    isActive: false,
    mode: 'pomodoro', // 'pomodoro', 'shortBreak', 'longBreak'
    timerId: null,
    totalTime: 25 * 60,
    pomodorosCompleted: 0,
    settings: {
        pomodoro: 25,
        shortBreak: 5,
        longBreak: 15
    }
};

// DOM Elements
const timeDisplay = document.getElementById('time');
const startBtn = document.getElementById('start-pause');
const resetBtn = document.getElementById('reset');
const modeBtns = document.querySelectorAll('.mode-btn');
const modeLabel = document.getElementById('mode-label');
const sessionCount = document.getElementById('session-count');
const alarmSound = document.getElementById('alarm-sound');
const body = document.body;

// Settings DOM
const settingsBtn = document.getElementById('settings-btn');
const settingsModal = document.getElementById('settings-modal');
const closeModal = document.querySelector('.close-modal');
const saveSettingsBtn = document.getElementById('save-settings');
const inputs = {
    pomodoro: document.getElementById('pomodoro-time'),
    shortBreak: document.getElementById('short-break-time'),
    longBreak: document.getElementById('long-break-time')
};

// Theme Toggle
const themeToggle = document.getElementById('theme-toggle');

// Initialization
function init() {
    loadSettings();
    updateDisplay();
    setupEventListeners();
}

function loadSettings() {
    const saved = localStorage.getItem('pomodoroSettings');
    if (saved) {
        state.settings = JSON.parse(saved);
        inputs.pomodoro.value = state.settings.pomodoro;
        inputs.shortBreak.value = state.settings.shortBreak;
        inputs.longBreak.value = state.settings.longBreak;
    }
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        body.classList.replace('light-mode', 'dark-mode');
    }

    // Set initial time based on default mode
    state.totalTime = state.settings.pomodoro * 60;
    state.timeLeft = state.totalTime;
}

function setupEventListeners() {
    startBtn.addEventListener('click', toggleTimer);
    resetBtn.addEventListener('click', resetTimer);

    modeBtns.forEach(btn => {
        btn.addEventListener('click', () => switchMode(btn.dataset.mode));
    });

    themeToggle.addEventListener('click', () => {
        if (body.classList.contains('light-mode')) {
            body.classList.replace('light-mode', 'dark-mode');
            localStorage.setItem('theme', 'dark');
        } else {
            body.classList.replace('dark-mode', 'light-mode');
            localStorage.setItem('theme', 'light');
        }
    });

    settingsBtn.addEventListener('click', () => {
        settingsModal.classList.remove('hidden');
    });

    closeModal.addEventListener('click', () => {
        settingsModal.classList.add('hidden');
    });

    saveSettingsBtn.addEventListener('click', saveSettings);

    // Close modal on outside click
    settingsModal.addEventListener('click', (e) => {
        if (e.target === settingsModal) {
            settingsModal.classList.add('hidden');
        }
    });

    // Time Input Listeners
    timeDisplay.addEventListener('focus', () => {
        pauseTimer();
        timeDisplay.select();
    });

    timeDisplay.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            timeDisplay.blur(); // Triggers change/blur logic locally if we had change listener, but let's do it on blur to be safe or explicit here
        }
    });

    timeDisplay.addEventListener('change', handleTimeInput);
}

function handleTimeInput() {
    let value = timeDisplay.value.trim();
    let minutes, seconds = 0;

    if (value.includes(':')) {
        const parts = value.split(':');
        minutes = parseInt(parts[0]) || 0;
        seconds = parseInt(parts[1]) || 0;
    } else {
        minutes = parseInt(value) || 0;
    }

    // Clamp values
    minutes = Math.min(Math.max(minutes, 0), 180); // Max 3 hours
    seconds = Math.min(Math.max(seconds, 0), 59);

    if (minutes === 0 && seconds === 0) minutes = 1; // Minimum 1 min maybe? Or just allowed to be 0 for done. Let's make min 1 second? Or default to 25 if bad input.

    // Calculate new total time - BUT treating this as "Adjusting current timer"
    // If we change the time, do we update the "Settings" for this mode?
    // User said "directly enter the time there". 
    // Usually this means a one-off custom time.
    state.totalTime = (minutes * 60) + seconds;
    state.timeLeft = state.totalTime;

    updateDisplay();
    setProgress(0); // Reset ring to full for new time
}

// Timer Logic
function toggleTimer() {
    if (state.isActive) {
        pauseTimer();
    } else {
        startTimer();
    }
}

function startTimer() {
    state.isActive = true;
    startBtn.textContent = 'Pause';
    startBtn.classList.add('active');

    state.timerId = setInterval(() => {
        state.timeLeft--;
        updateDisplay();

        if (state.timeLeft <= 0) {
            completeTimer();
        }
    }, 1000);
}

function pauseTimer() {
    state.isActive = false;
    startBtn.textContent = 'Start';
    startBtn.classList.remove('active');
    clearInterval(state.timerId);
}

function resetTimer() {
    pauseTimer();
    state.timeLeft = state.totalTime;
    updateDisplay();
    setProgress(0); // Full circle
}

function completeTimer() {
    pauseTimer();
    alarmSound.play();

    if (state.mode === 'pomodoro') {
        state.pomodorosCompleted++;
        sessionCount.textContent = state.pomodorosCompleted;

        // Auto-switch logic
        if (state.pomodorosCompleted % 4 === 0) {
            switchMode('longBreak');
        } else {
            switchMode('shortBreak');
        }
    } else {
        switchMode('pomodoro');
    }

    // Optional: Auto-start next timer? User request said "Auto-switch between work and break modes", 
    // usually implies ready to start or auto-start. Let's start it for seamless flow as "Auto-switch" usually implies state change.
    // However, forced auto-start can be annoying. Let's just switch the mode and let user start.
    // Actually, "Auto-switch" means the mode changes automatically. I did that.
    startTimer(); // Let's auto-start for true flow, or at least prompt? 
    // Re-reading: "Auto-switch between work and break modes". 
    // Let's safe bet: Switch mode, but wait for user to click start, UNLESS it's a productivity app which usually requires a break to start automatically?
    // Let's standard behavior: Ring ends -> Sound -> Mode Switches -> Timer waits.
    // Actually, to make it "productivity" focused, let's keep it waiting.
    // Wait, if I pauseTimer() above, I need to undo that if I want to auto-continue.
    // Let's stick to: Finish -> Sound -> Switch to correct next mode -> Reset timer for that mode -> User presses start.
    // BUT! I called startTimer() lines above. Let's remove it for better UX. 
    pauseTimer(); // Ensure it stays paused.
}

function switchMode(newMode) {
    state.mode = newMode;

    // Update visuals
    modeBtns.forEach(btn => {
        btn.classList.remove('active');
        if (btn.dataset.mode === newMode) btn.classList.add('active');
    });

    body.classList.remove('break-mode');
    if (newMode === 'shortBreak' || newMode === 'longBreak') {
        body.classList.add('break-mode');
        modeLabel.textContent = newMode === 'shortBreak' ? 'SHORT BREAK' : 'LONG BREAK';
    } else {
        modeLabel.textContent = 'WORK';
    }

    // Set times
    state.totalTime = state.settings[newMode] * 60;
    state.timeLeft = state.totalTime;

    // Reset timer state
    pauseTimer();
    updateDisplay();
}

function updateDisplay() {
    const minutes = Math.floor(state.timeLeft / 60);
    const seconds = state.timeLeft % 60;
    const timeString = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

    // Check if element is focused to avoid overwriting user while typing?
    if (document.activeElement !== timeDisplay) {
        timeDisplay.value = timeString;
    }

    document.title = `${timeString} - Pomodoro`;

    // Update Progress Ring
    // We want the ring to decrease as time goes by.
    // percent completed = (total - left) / total * 100
    // But we want it to empty out.
    // percent remaining = left / total * 100
    // full = 100%
    const percent = (state.timeLeft / state.totalTime) * 100;
    // We need to invert it for the stroke-dashoffset logic usually?
    // strokeDashoffset = circumference - (percent / 100) * circumference
    // If percent is 100 (full), offset is 0.
    // If percent is 0 (empty), offset is circumference.
    setProgress(percent);
}

function saveSettings() {
    const newPomodoro = parseInt(inputs.pomodoro.value);
    const newShort = parseInt(inputs.shortBreak.value);
    const newLong = parseInt(inputs.longBreak.value);

    if (newPomodoro > 0 && newShort > 0 && newLong > 0) {
        state.settings.pomodoro = newPomodoro;
        state.settings.shortBreak = newShort;
        state.settings.longBreak = newLong;

        localStorage.setItem('pomodoroSettings', JSON.stringify(state.settings));

        // If timer is not running, update current view
        if (!state.isActive) {
            state.totalTime = state.settings[state.mode] * 60;
            state.timeLeft = state.totalTime;
            updateDisplay();
        }

        settingsModal.classList.add('hidden');
    }
}

// Reset stroke on load
circle.style.strokeDashoffset = 0;

init();
