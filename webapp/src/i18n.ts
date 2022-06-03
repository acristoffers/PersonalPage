import Vue from "vue";
import VueI18n from "vue-i18n";
import messages from "@/locales/en.json";

Vue.use(VueI18n);

const i18n = new VueI18n({
    locale: process.env.VUE_APP_I18N_LOCALE || "en",
    fallbackLocale: process.env.VUE_APP_I18N_FALLBACK_LOCALE || "en",
    messages: { en: messages },
});

const loadedLanguages = ["en"];

function setI18nLanguage(lang: string): string {
    i18n.locale = lang;
    document.querySelector("html")!.setAttribute("lang", lang);
    window.localStorage.setItem("lang", lang);
    return lang;
}

export async function loadLanguageAsync(lang: string): Promise<string> {
    if (i18n.locale !== lang) {
        if (!loadedLanguages.includes(lang)) {
            const msgs = await import(
                /* webpackChunkName: "lang-[request]" */ `@/locales/${lang}.json`
            );
            i18n.setLocaleMessage(lang, msgs);
            loadedLanguages.push(lang);
            return setI18nLanguage(lang);
        }

        return Promise.resolve(setI18nLanguage(lang));
    }

    return Promise.resolve(lang);
}

export default i18n;
