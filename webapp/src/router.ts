import Vue from "vue";
import Router from "vue-router";
import About from "./views/About.vue";

Vue.use(Router);

export default new Router({
    mode: "history",
    base: process.env.BASE_URL,
    routes: [
        {
            path: "",
            name: "root",
            redirect: "/about",
        },
        {
            path: "/about",
            name: "about",
            component: About,
        },
        {
            path: "/projects/:project?",
            name: "projects",
            component: () =>
                import(
                    /* webpackChunkName: "projects" */ "./views/Projects.vue"
                ),
        },
        {
            path: "/publications",
            name: "publications",
            component: () =>
                import(
                    /* webpackChunkName: "publications" */ "./views/Publications.vue"
                ),
        },
        {
            path: "/experience",
            name: "experience",
            component: () =>
                import(
                    /* webpackChunkName: "experience" */ "./views/Experiences.vue"
                ),
        },
    ],
});
