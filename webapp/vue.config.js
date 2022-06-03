module.exports = {
    configureWebpack: {
        resolve: {
            fallback: {
                timers: require.resolve("timers-browserify"),
            },
        },
    },
    pluginOptions: {
        i18n: {
            locale: "en",
            fallbackLocale: "en",
            localeDir: "locales",
            enableInSFC: true,
        },
    },
};
