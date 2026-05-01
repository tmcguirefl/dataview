'use strict';

const API = '';          // same-origin; JHS serves both static files and /api/*
const TOKEN_KEY = 'ms_token';
const USER_KEY  = 'ms_user';

// ── API helpers ──────────────────────────────────────────────────────────────

async function apiPost(path, body) {
  const tok = localStorage.getItem(TOKEN_KEY);
  const headers = { 'Content-Type': 'application/json' };
  if (tok) headers['Authorization'] = 'Bearer ' + tok;
  const res = await fetch(API + path, {
    method: 'POST',
    headers,
    body: JSON.stringify(body),
  });
  return res.json();
}

async function apiGet(path) {
  const tok = localStorage.getItem(TOKEN_KEY);
  const headers = {};
  if (tok) headers['Authorization'] = 'Bearer ' + tok;
  const res = await fetch(API + path, { headers });
  return res.json();
}

// ── Auth state ────────────────────────────────────────────────────────────────

function getSession() {
  const tok  = localStorage.getItem(TOKEN_KEY);
  const user = localStorage.getItem(USER_KEY);
  if (tok && user) return { token: tok, username: user };
  return null;
}

function saveSession(token, username) {
  localStorage.setItem(TOKEN_KEY, token);
  localStorage.setItem(USER_KEY, username);
}

function clearSession() {
  localStorage.removeItem(TOKEN_KEY);
  localStorage.removeItem(USER_KEY);
}

// ── UI helpers ────────────────────────────────────────────────────────────────

const authPanel  = document.getElementById('auth-panel');
const dashboard  = document.getElementById('dashboard');
const authTitle  = document.getElementById('auth-title');
const authBtn    = document.getElementById('auth-btn');
const authError  = document.getElementById('auth-error');
const toggleMsg  = document.getElementById('toggle-msg');
const toggleLink = document.getElementById('toggle-link');
const dashUser   = document.getElementById('dash-user');
const logoutBtn  = document.getElementById('logout-btn');
const unameInput = document.getElementById('username');
const passInput  = document.getElementById('password');

let mode = 'login'; // 'login' | 'register'

function showError(msg) {
  authError.textContent = msg;
  authError.classList.remove('hidden');
}

function clearError() {
  authError.classList.add('hidden');
  authError.textContent = '';
}

function showDashboard(username) {
  authPanel.style.display = 'none';
  dashboard.style.display = 'block';
  dashUser.textContent = 'Signed in as ' + username;
}

function showAuth() {
  dashboard.style.display = 'none';
  authPanel.style.display = 'block';
  clearError();
  unameInput.value = '';
  passInput.value  = '';
}

// ── Toggle login / register ───────────────────────────────────────────────────

toggleLink.addEventListener('click', () => {
  mode = (mode === 'login') ? 'register' : 'login';
  if (mode === 'register') {
    authTitle.textContent = 'Create account';
    authBtn.textContent   = 'Register';
    toggleMsg.textContent = 'Already have an account?';
    toggleLink.textContent = 'Sign in';
  } else {
    authTitle.textContent  = 'Sign in';
    authBtn.textContent    = 'Sign in';
    toggleMsg.textContent  = "Don't have an account?";
    toggleLink.textContent = 'Register';
  }
  clearError();
});

// ── Submit login / register ───────────────────────────────────────────────────

authBtn.addEventListener('click', async () => {
  clearError();
  const username = unameInput.value.trim();
  const password = passInput.value;
  if (!username || !password) { showError('Username and password required.'); return; }

  const endpoint = (mode === 'register') ? '/api?r=register' : '/api?r=login';
  let data;
  try {
    data = await apiPost(endpoint, { username, password });
  } catch (e) {
    showError('Could not reach the server. Is ModelScope-J running?');
    return;
  }

  if (data.token) {
    saveSession(data.token, data.username || username);
    showDashboard(data.username || username);
  } else {
    showError(data.message || 'Authentication failed.');
  }
});

// Allow Enter key to submit
[unameInput, passInput].forEach(el =>
  el.addEventListener('keydown', e => { if (e.key === 'Enter') authBtn.click(); })
);

// ── Sign out ──────────────────────────────────────────────────────────────────

logoutBtn.addEventListener('click', () => {
  clearSession();
  showAuth();
});

// ── Init — check for existing session ────────────────────────────────────────

(async () => {
  const session = getSession();
  if (session) {
    // Verify token is still valid against the server
    try {
      const health = await apiGet('/api/health');
      if (health.status === 'ok') {
        showDashboard(session.username);
        return;
      }
    } catch (_) {}
    clearSession();
  }
  showAuth();
})();
