/**
 * HardwareForge Security Layer
 * Basic JavaScript obfuscation and protection against casual inspection
 *
 * WARNING: This provides basic protection only. Determined users can still bypass.
 * For production, consider using proper build tools and minification.
 */

(function() {
    'use strict';

    // Anti-debugging measures
    const SecurityLayer = {

        // Disable right-click context menu
        disableContextMenu: function() {
            document.addEventListener('contextmenu', function(e) {
                e.preventDefault();
                return false;
            });
        },

        

        // Disable F12, Ctrl+Shift+I, Ctrl+Shift+J, Ctrl+U
        disableDevTools: function() {
            document.addEventListener('keydown', function(e) {
                // F12
                if (e.keyCode === 123) {
                    e.preventDefault();
                    return false;
                }
                // Ctrl+Shift+I (Chrome/Firefox DevTools)
                if (e.ctrlKey && e.shiftKey && e.keyCode === 73) {
                    e.preventDefault();
                    return false;
                }
                // Ctrl+Shift+J (Chrome Console)
                if (e.ctrlKey && e.shiftKey && e.keyCode === 74) {
                    e.preventDefault();
                    return false;
                }
                // Ctrl+U (View Source)
                if (e.ctrlKey && e.keyCode === 85) {
                    e.preventDefault();
                    return false;
                }
                // Ctrl+Shift+C (Chrome Element Inspector)
                if (e.ctrlKey && e.shiftKey && e.keyCode === 67) {
                    e.preventDefault();
                    return false;
                }
            });
        },

        // Detect and handle devtools opening
        detectDevTools: function() {
            let devtools = {
                open: false,
                orientation: null
            };

            const threshold = 160;

            setInterval(() => {
                if (window.outerHeight - window.innerHeight > threshold ||
                    window.outerWidth - window.innerWidth > threshold) {
                    if (!devtools.open) {
                        devtools.open = true;
                        this.handleDevToolsOpened();
                    }
                } else {
                    devtools.open = false;
                }
            }, 500);
        },

        // Action when devtools detected
        handleDevToolsOpened: function() {
            // You can choose to redirect, show message, or close page
            // document.body.innerHTML = '<h1>Developer tools detected. Please close them to continue.</h1>';

            // Option 1: Redirect to warning page
            // window.location.href = '/warning.html';

            // Option 2: Clear content and show message
            document.body.innerHTML = `
                <div style="display: flex; justify-content: center; align-items: center; height: 100vh; background: #1a1a1a; color: white; font-family: Arial, sans-serif;">
                    <div style="text-align: center;">
                        <h1>🛡️ Security Alert</h1>
                        <p>Developer tools detected. Please close them to continue using HardwareForge.</p>
                        <button onclick="location.reload()" style="padding: 10px 20px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
                            Reload Page
                        </button>
                    </div>
                </div>
            `;
        },

        // Console deception
        protectConsole: function() {
            // Override console methods to prevent debugging
            const originalConsole = {
                log: console.log,
                warn: console.warn,
                error: console.error,
                info: console.info,
                debug: console.debug
            };

            // Disable console methods
            console.log = function() {
                return false;
            };
            console.warn = function() {
                return false;
            };
            console.error = function() {
                return false;
            };
            console.info = function() {
                return false;
            };
            console.debug = function() {
                return false;
            };

            // Add fake debugger trap
            if (typeof debugger !== 'undefined') {
                setInterval(() => {
                    debugger;
                }, 100);
            }
        },

        // Disable text selection
        disableTextSelection: function() {
            document.addEventListener('selectstart', function(e) {
                e.preventDefault();
                return false;
            });

            document.addEventListener('dragstart', function(e) {
                e.preventDefault();
                return false;
            });

            // CSS style injection
            const style = document.createElement('style');
            style.innerHTML = `
                * {
                    -webkit-user-select: none !important;
                    -moz-user-select: none !important;
                    -ms-user-select: none !important;
                    user-select: none !important;
                    -webkit-touch-callout: none !important;
                    -webkit-tap-highlight-color: rgba(0,0,0,0) !important;
                }

                input, textarea {
                    -webkit-user-select: text !important;
                    -moz-user-select: text !important;
                    -ms-user-select: text !important;
                    user-select: text !important;
                }
            `;
            document.head.appendChild(style);
        },

        // Disable copy/paste
        disableCopyPaste: function() {
            document.addEventListener('copy', function(e) {
                e.preventDefault();
                return false;
            });

            document.addEventListener('paste', function(e) {
                e.preventDefault();
                return false;
            });

            document.addEventListener('cut', function(e) {
                e.preventDefault();
                return false;
            });
        },

        // Disable print
        disablePrint: function() {
            window.addEventListener('beforeprint', function(e) {
                e.preventDefault();
                return false;
            });

            // Override print function
            window.print = function() {
                alert('Printing is disabled for security reasons.');
                return false;
            };
        },

        // Add fake watermark overlay
        addWatermark: function() {
            const watermark = document.createElement('div');
            watermark.innerHTML = 'HardwareForge © 2025 - Protected Content';
            watermark.style.cssText = `
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) rotate(-45deg);
                font-size: 72px;
                color: rgba(0,0,0,0.1);
                pointer-events: none;
                z-index: 9999;
                font-weight: bold;
                white-space: nowrap;
                font-family: Arial, sans-serif;
            `;
            document.body.appendChild(watermark);
        },

        // Encrypt sensitive data (basic XOR encryption)
        encryptData: function(data, key = 'HardwareForge2025') {
            let encrypted = '';
            for (let i = 0; i < data.length; i++) {
                encrypted += String.fromCharCode(data.charCodeAt(i) ^ key.charCodeAt(i % key.length));
            }
            return btoa(encrypted); // Base64 encode
        },

        decryptData: function(encryptedData, key = 'HardwareForge2025') {
            try {
                const data = atob(encryptedData); // Base64 decode
                let decrypted = '';
                for (let i = 0; i < data.length; i++) {
                    decrypted += String.fromCharCode(data.charCodeAt(i) ^ key.charCodeAt(i % key.length));
                }
                return decrypted;
            } catch (e) {
                return '';
            }
        },

        // Store sensitive data securely
        secureStorage: {
            set: function(key, value) {
                const encrypted = SecurityLayer.encryptData(JSON.stringify(value));
                localStorage.setItem('hf_' + key, encrypted);
            },
            get: function(key) {
                const encrypted = localStorage.getItem('hf_' + key);
                if (!encrypted) return null;
                try {
                    return JSON.parse(SecurityLayer.decryptData(encrypted));
                } catch (e) {
                    return null;
                }
            },
            remove: function(key) {
                localStorage.removeItem('hf_' + key);
            }
        },

        // Initialize all security measures
        init: function() {
            // Basic measures (uncomment these if you want them active)
            this.disableContextMenu();
            this.disableDevTools();
            this.detectDevTools();

            // Advanced measures (use with caution - can affect UX)
            // this.disableTextSelection();
            // this.disableCopyPaste();
            // this.disablePrint();
            // this.addWatermark();

            // Console protection (development mode only)
            if (window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
                this.protectConsole();
            }
        }
    };

    // Auto-initialize security layer
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            SecurityLayer.init();
        });
    } else {
        SecurityLayer.init();
    }
    Object.freeze(SecurityLayer);

    // Global access for advanced users
    window.HFSecurity = SecurityLayer;

})();

// Encrypted API endpoints (basic protection)
const HF_API = {
    encrypt: function(endpoint) {
        // Simple endpoint obfuscation
        const mappings = {
            '/api/cpus': 'api/v1/hw/cpu/list',
            '/api/gpus': 'api/v1/hw/gpu/list',
            '/api/motherboards': 'api/v1/hw/mobo/list',
            '/api/builds': 'api/v1/builds/community',
            '/api/save-build': 'api/v1/builds/create',
            '/api/login': 'api/v1/auth/signin',
            '/api/register': 'api/v1/auth/signup',
            
        };
        return mappings[endpoint] || endpoint;
    }
};

Object.freeze(HF_API);

// Self-destruct function if page is copied
window.addEventListener('blur', function() {
    // Optional: Clear sensitive data when user switches tabs
    if (document.visibilityState === 'hidden') {
        // Clear any sensitive localStorage data
        // SecurityLayer.secureStorage.remove('sensitive_token');
    }
});