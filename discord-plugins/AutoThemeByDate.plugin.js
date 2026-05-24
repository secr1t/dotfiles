/**
 * @name AutoThemeByDate
 * @description Автоматически меняет тему Discord по дате (читает локальные CSS напрямую)
 * @author Secrit
 * @version 1.0.4
 */

const fs = require("fs");
const path = require("path");

module.exports = class AutoThemeByDate {
    constructor() {
        this.interval = null;
        this.themeDir = "/home/secr1t/.config/BetterDiscord/themes";
        this.currentTheme = null;
    }

    start() {
        BdApi.UI.showToast("🎨 AutoThemeByDate запущен", {type: "info"});
        this.applyTheme();
        this.interval = setInterval(() => this.applyTheme(), 5000);
    }

    stop() {
        clearInterval(this.interval);
        const style = document.querySelector("#auto-theme-style");
        if (style) style.remove();
        BdApi.UI.showToast("🛑 AutoThemeByDate остановлен", {type: "info"});
    }

    getThemeByDate() {
        const now = new Date();
        const month = now.getMonth() + 1;
        const day = now.getDate();

        if (month === 10) return "halloween.theme.css";
        if (month === 12 && day >= 15) return "christmas.theme.css";
        return "catpuccin-mocha.theme.css";
    }

    applyTheme() {
        const themeFile = this.getThemeByDate();
        if (this.currentTheme === themeFile) return;

        this.currentTheme = themeFile;
        const themePath = path.join(this.themeDir, themeFile);

        if (!fs.existsSync(themePath)) {
            console.error(`[AutoThemeByDate] ⚠️ Файл не найден: ${themePath}`);
            BdApi.UI.showToast(`⚠️ Файл не найден: ${themeFile}`, {type: "error"});
            return;
        }

        const css = fs.readFileSync(themePath, "utf8");

        // Удаляем старую тему
        const oldStyle = document.querySelector("#auto-theme-style");
        if (oldStyle) oldStyle.remove();

        // Вставляем новую
        const style = document.createElement("style");
        style.id = "auto-theme-style";
        style.textContent = css;
        document.head.appendChild(style);

        console.log(`[AutoThemeByDate] ✅ Применена тема: ${themeFile}`);
        BdApi.UI.showToast(`✅ Применена тема: ${themeFile}`, {type: "success"});
    }
};
