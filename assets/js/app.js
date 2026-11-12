/* OCI Foundations Study — shared app behavior
   ไม่ใช้ framework, ไม่ fetch ไฟล์, ทำงานบน file:// ได้ */
'use strict';

(function () {
  /* ---------- storage with fallback ---------- */
  var memoryStore = {};
  var storageOK = (function () {
    try {
      var k = '__oci_test__';
      window.localStorage.setItem(k, '1');
      window.localStorage.removeItem(k);
      return true;
    } catch (e) { return false; }
  })();

  function storeGet(key) {
    try {
      if (storageOK) return window.localStorage.getItem(key);
      return Object.prototype.hasOwnProperty.call(memoryStore, key) ? memoryStore[key] : null;
    } catch (e) { return null; }
  }
  function storeSet(key, value) {
    try {
      if (storageOK) window.localStorage.setItem(key, value);
      else memoryStore[key] = value;
      return true;
    } catch (e) { memoryStore[key] = value; return false; }
  }

  var PROGRESS_KEY = 'oci-study-progress-v1';
  var THEME_KEY = 'oci-study-theme';

  function defaultProgress() {
    return { objectives: {}, bookmarks: [], examHistory: [], flashcardBoxes: {}, quizStats: {} };
  }
  function getProgress() {
    var raw = storeGet(PROGRESS_KEY);
    if (!raw) return defaultProgress();
    try {
      var p = JSON.parse(raw);
      return Object.assign(defaultProgress(), p);
    } catch (e) { return defaultProgress(); }
  }
  function saveProgress(p) { storeSet(PROGRESS_KEY, JSON.stringify(p)); }

  var OCIStudy = {
    storageAvailable: storageOK,
    getProgress: getProgress,
    markObjective: function (id, done) {
      var p = getProgress();
      if (done) p.objectives[id] = true; else delete p.objectives[id];
      saveProgress(p);
      refreshProgressUI();
    },
    isObjectiveDone: function (id) { return !!getProgress().objectives[id]; },
    toggleBookmark: function (id) {
      var p = getProgress();
      var i = p.bookmarks.indexOf(id);
      if (i >= 0) p.bookmarks.splice(i, 1); else p.bookmarks.push(id);
      saveProgress(p);
      return p.bookmarks.indexOf(id) >= 0;
    },
    getBookmarks: function () { return getProgress().bookmarks.slice(); },
    recordExam: function (entry) {
      var p = getProgress();
      p.examHistory.push(entry);
      if (p.examHistory.length > 50) p.examHistory = p.examHistory.slice(-50);
      saveProgress(p);
    },
    getExamHistory: function () { return getProgress().examHistory.slice(); },
    getFlashcardBox: function (id) {
      var b = getProgress().flashcardBoxes[id];
      return typeof b === 'number' ? b : 1;
    },
    setFlashcardBox: function (id, box) {
      var p = getProgress();
      p.flashcardBoxes[id] = box;
      saveProgress(p);
    },
    recordQuizResult: function (domain, correct, total) {
      var p = getProgress();
      var d = p.quizStats[domain] || { correct: 0, total: 0 };
      d.correct += correct; d.total += total;
      p.quizStats[domain] = d;
      saveProgress(p);
    },
    getQuizStats: function () { return getProgress().quizStats; },
    exportProgress: function () {
      return JSON.stringify(getProgress(), null, 2);
    },
    importProgress: function (json) {
      var p = JSON.parse(json);
      if (typeof p !== 'object' || !p) throw new Error('ไฟล์ไม่ถูกต้อง');
      saveProgress(Object.assign(defaultProgress(), p));
      refreshProgressUI();
    },
    resetProgress: function () {
      saveProgress(defaultProgress());
      refreshProgressUI();
    }
  };
  window.OCIStudy = OCIStudy;

  /* ---------- toast ---------- */
  function toast(msg) {
    var el = document.getElementById('toast');
    if (!el) {
      el = document.createElement('div');
      el.id = 'toast';
      el.setAttribute('role', 'status');
      el.style.cssText = 'position:fixed;bottom:1.25rem;left:50%;transform:translateX(-50%);' +
        'background:var(--ink);color:var(--bg);padding:.45rem 1rem;border-radius:6px;' +
        'font-size:.85rem;z-index:70;box-shadow:var(--shadow)';
      document.body.appendChild(el);
    }
    el.textContent = msg;
    el.style.opacity = '1';
    window.clearTimeout(el._t);
    el._t = window.setTimeout(function () { el.style.opacity = '0'; }, 2600);
  }
  window.ociToast = toast;

  /* ---------- theme ---------- */
  function applyTheme(theme) {
    if (theme === 'dark' || theme === 'light') document.documentElement.setAttribute('data-theme', theme);
    else document.documentElement.removeAttribute('data-theme');
  }
  applyTheme(storeGet(THEME_KEY) || '');

  document.addEventListener('click', function (e) {
    var btn = e.target.closest('[data-theme-toggle]');
    if (!btn) return;
    var current = document.documentElement.getAttribute('data-theme');
    var next;
    if (current === 'dark') next = 'light';
    else if (current === 'light') next = '';
    else next = 'dark';
    if (next) storeSet(THEME_KEY, next); else { try { window.localStorage.removeItem(THEME_KEY); } catch (e2) { storeSet(THEME_KEY, ''); } }
    applyTheme(next);
  });

  /* ---------- drawer (mobile) ---------- */
  var backdrop = document.querySelector('.drawer-backdrop');
  document.addEventListener('click', function (e) {
    if (e.target.closest('[data-drawer-toggle]')) {
      document.body.classList.toggle('drawer-open');
      return;
    }
    if (e.target === backdrop || e.target.closest('.sidebar a')) {
      document.body.classList.remove('drawer-open');
    }
  });
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') document.body.classList.remove('drawer-open');
  });

  /* ---------- scrollspy ---------- */
  var tocLinks = Array.prototype.slice.call(document.querySelectorAll('.sidebar a[href^="#"]'));
  if (tocLinks.length && 'IntersectionObserver' in window) {
    var map = {};
    tocLinks.forEach(function (a) {
      var id = decodeURIComponent(a.getAttribute('href').slice(1));
      var target = document.getElementById(id);
      if (target) map[id] = a;
    });
    var current = null;
    var setActive = function (id) {
      if (current === id) return;
      current = id;
      tocLinks.forEach(function (a) { a.classList.remove('active'); });
      if (map[id]) map[id].classList.add('active');
    };
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) setActive(entry.target.id);
      });
    }, { rootMargin: '-20% 0px -65% 0px', threshold: 0 });
    Object.keys(map).forEach(function (id) { observer.observe(document.getElementById(id)); });
  }

  /* ---------- objective checkboxes & progress bars ---------- */
  function refreshProgressUI() {
    var p = getProgress();
    var boxes = document.querySelectorAll('[data-objective-id]');
    boxes.forEach(function (box) {
      box.checked = !!p.objectives[box.getAttribute('data-objective-id')];
    });
    document.querySelectorAll('[data-progress-for]').forEach(function (bar) {
      var domain = bar.getAttribute('data-progress-for');
      var owned = Object.keys(p.objectives).filter(function (k) { return k.indexOf(domain + '.') === 0; });
      var total = parseInt(bar.getAttribute('data-total') || '2', 10);
      var pct = total ? Math.min(100, Math.round((owned.length / total) * 100)) : 0;
      bar.style.width = pct + '%';
      var label = bar.closest('[data-progress-block]');
      if (label) {
        var out = label.querySelector('[data-progress-label]');
        if (out) out.textContent = owned.length + '/' + total + ' objectives';
      }
    });
    var all = document.querySelectorAll('[data-progress-total]');
    all.forEach(function (el) {
      var keys = Object.keys(p.objectives);
      el.textContent = keys.length;
    });
    /* sidebar dots */
    document.querySelectorAll('.sidebar a[data-objective-link]').forEach(function (a) {
      if (p.objectives[a.getAttribute('data-objective-link')]) a.classList.add('done');
      else a.classList.remove('done');
    });
  }

  document.addEventListener('change', function (e) {
    var box = e.target.closest('[data-objective-id]');
    if (!box) return;
    OCIStudy.markObjective(box.getAttribute('data-objective-id'), box.checked);
    toast(box.checked ? 'บันทึกว่าอ่านจบหัวข้อนี้แล้ว' : 'ยกเลิกการติ๊กจบ');
  });

  /* export / import / reset */
  document.addEventListener('click', function (e) {
    if (e.target.closest('#export-progress')) {
      var blob = new Blob([OCIStudy.exportProgress()], { type: 'application/json' });
      var aEl = document.createElement('a');
      aEl.href = URL.createObjectURL(blob);
      aEl.download = 'oci-study-progress.json';
      aEl.click();
      URL.revokeObjectURL(aEl.href);
      return;
    }
    if (e.target.closest('#import-progress-trigger')) {
      var input = document.getElementById('import-progress-file');
      if (input) input.click();
      return;
    }
    if (e.target.closest('#reset-progress')) {
      if (window.confirm('ล้างความคืบหน้า ประวัติสอบ และกล่อง flashcard ทั้งหมด?')) {
        OCIStudy.resetProgress();
        toast('ล้างข้อมูลแล้ว');
      }
    }
  });
  document.addEventListener('change', function (e) {
    if (e.target.id !== 'import-progress-file') return;
    var file = e.target.files && e.target.files[0];
    if (!file) return;
    var reader = new FileReader();
    reader.onload = function () {
      try {
        OCIStudy.importProgress(String(reader.result));
        toast('นำเข้าความคืบหน้าแล้ว');
      } catch (err) {
        toast('นำเข้าไม่สำเร็จ: ' + err.message);
      }
    };
    reader.readAsText(file);
  });

  /* ---------- check yourself toggles ---------- */
  document.addEventListener('click', function (e) {
    var q = e.target.closest('.check-q');
    if (!q) return;
    var item = q.closest('.check-item');
    item.classList.toggle('open');
    var expanded = item.classList.contains('open');
    q.setAttribute('aria-expanded', expanded ? 'true' : 'false');
    var hint = q.querySelector('.check-toggle-hint');
    if (hint) hint.textContent = expanded ? 'ซ่อนเฉลย' : 'ดูเฉลย';
  });

  /* ---------- site search ---------- */
  var overlay = document.getElementById('search-overlay');
  if (overlay) {
    var input = overlay.querySelector('input[type="search"]');
    var results = overlay.querySelector('.search-results');
    var index = Array.isArray(window.SEARCH_INDEX) ? window.SEARCH_INDEX : [];
    var selected = -1;

    var render = function (items, query) {
      results.innerHTML = '';
      selected = -1;
      if (!items.length) {
        var empty = document.createElement('div');
        empty.style.cssText = 'padding:.75rem 1rem;color:var(--muted);font-size:.9rem';
        empty.textContent = query ? 'ไม่พบผลลัพธ์สำหรับ "' + query + '"' : 'พิมพ์เพื่อค้นหาทั้งเว็บ…';
        results.appendChild(empty);
        return;
      }
      items.slice(0, 30).forEach(function (item) {
        var a = document.createElement('a');
        a.href = item.url;
        a.innerHTML = '<span></span><small></small>';
        a.querySelector('span').textContent = item.title;
        a.querySelector('small').textContent = (item.section || '') + (item.excerpt ? ' — ' + item.excerpt : '');
        results.appendChild(a);
      });
    };

    var search = function (query) {
      var q = query.trim().toLowerCase();
      if (!q) { render([], ''); return; }
      var scored = [];
      for (var i = 0; i < index.length; i++) {
        var it = index[i];
        var hay = ((it.title || '') + ' ' + (it.tags || '') + ' ' + (it.excerpt || '')).toLowerCase();
        var score = 0;
        var idx = hay.indexOf(q);
        if (idx >= 0) score = 10 - Math.min(idx, 9);
        else {
          var words = q.split(/\s+/);
          var hit = words.filter(function (w) { return hay.indexOf(w) >= 0; }).length;
          if (hit) score = hit;
        }
        if (score > 0) scored.push({ item: it, score: score });
      }
      scored.sort(function (a, b) { return b.score - a.score; });
      render(scored.map(function (s) { return s.item; }), query);
    };

    var open = function () {
      overlay.classList.add('open');
      input.value = '';
      render([], '');
      window.setTimeout(function () { input.focus(); }, 30);
    };
    var close = function () { overlay.classList.remove('open'); };

    document.addEventListener('click', function (e) {
      if (e.target.closest('[data-search-open]')) { e.preventDefault(); open(); }
      if (e.target === overlay) close();
    });
    document.addEventListener('keydown', function (e) {
      var tag = (e.target.tagName || '').toLowerCase();
      var typing = tag === 'input' || tag === 'textarea' || e.target.isContentEditable;
      if (e.key === '/' && !typing) { e.preventDefault(); open(); return; }
      if (!overlay.classList.contains('open')) return;
      if (e.key === 'Escape') { close(); return; }
      var links = Array.prototype.slice.call(results.querySelectorAll('a'));
      if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
        e.preventDefault();
        selected = e.key === 'ArrowDown'
          ? Math.min(links.length - 1, selected + 1)
          : Math.max(0, selected - 1);
        links.forEach(function (l, i) { l.classList.toggle('active', i === selected); });
        if (links[selected]) links[selected].scrollIntoView({ block: 'nearest' });
      } else if (e.key === 'Enter' && selected >= 0 && links[selected]) {
        window.location.href = links[selected].getAttribute('href');
      }
    });
    input.addEventListener('input', function () { search(input.value); });
  }

  /* ---------- init ---------- */
  refreshProgressUI();
})();
