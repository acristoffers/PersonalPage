<template>
    <div id="projects">
        <ul id="project-list">
            <li v-for="project in projects" :key="project.key">
                <router-link
                    :to="{ name: 'projects', params: { project: project.key } }"
                >
                    <img :src="project.icon" />
                    <br />
                    {{ project.name }}
                </router-link>
            </li>
        </ul>
        <div
            class="project"
            :class="shouldShow(project.key)"
            v-for="project in projects"
            :key="project.name"
        >
            <div class="desc">
                <a :href="project.url" target="_blank">
                    <img :src="project.icon" />
                    <h1 class="project-name">{{ project.name }}</h1>
                </a>
                <br />
                <br />
                <div class="desc-text">{{ project.desc }}</div>
            </div>
            <div class="screenshots" v-if="project.ss">
                <div
                    class="screenshot"
                    v-for="screenshot in project.ss"
                    :key="screenshot.key"
                >
                    <img
                        :src="screenshot.lowres"
                        @click="setImage(screenshot.hires)"
                    />
                    <div class="desc-text">{{ screenshot.desc }}</div>
                </div>
            </div>
        </div>
        <ImageView />
    </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import _ from "lodash";
import ImageView from "../components/ImageView.vue";

@Component({ components: { ImageView } })
export default class Projects extends Vue {
    public get currentProject() {
        return this.$route.params.project || "lachesis";
    }

    public shouldShow(project: string): string[] {
        if (project === this.currentProject) {
            return [];
        } else {
            return ["hidden"];
        }
    }

    public get projects() {
        return {
            lachesis: {
                key: "lachesis",
                name: "Lachesis",
                icon: require("@/assets/lachesis.svg"),
                desc: this.$t("lachesis_desc"),
                url: "https://github.com/acristoffers/lachesis",
                ss: _.map([1, 2, 3, 4], (i) => {
                    return {
                        key: i,
                        lowres: require(`@/assets/screenshots/Lachesis${i}.jpg`),
                        hires: require(`@/assets/screenshots/Lachesis${i}.png`),
                        desc: this.$t(`lachesis${i}_desc`),
                    };
                }),
            },
            moirai: {
                key: "moirai",
                name: "moirai",
                icon: require("../assets/python.svg"),
                desc: this.$t("moirai_desc"),
                url: "https://github.com/acristoffers/moirai",
            },
            ahio: {
                key: "ahio",
                name: "AHIO",
                icon: require("../assets/python.svg"),
                desc: this.$t("ahio_desc"),
                url: "https://github.com/acristoffers/ahio",
            },
            void: {
                key: "void",
                name: "Void",
                icon: require("../assets/void.svg"),
                desc: this.$t("void_desc"),
                url: "https://github.com/acristoffers/void",
                ss: _.map([1, 2, 3, 4], (i) => {
                    return {
                        key: i,
                        lowres: require(`@/assets/screenshots/Void${i}.jpg`),
                        hires: require(`@/assets/screenshots/Void${i}.png`),
                        desc: this.$t(`void${i}_desc`),
                    };
                }),
            },
            tests_database: {
                key: "tests-database",
                name: "Tests Database",
                icon: require("../assets/tests-database.png"),
                desc: this.$t("tests_database_desc"),
                url: "https://github.com/acristoffers/testsdatabase",
                ss: _.map([1, 2, 3], (i) => {
                    return {
                        key: i,
                        lowres: require(`@/assets/screenshots/TestsDatabase${i}.png`),
                        hires: require(`@/assets/screenshots/TestsDatabase${i}.png`),
                        desc: this.$t(`tb_ss${i}_desc`),
                    };
                }),
            },
            tracker: {
                key: "tracker",
                name: "Tracker",
                icon: require("../assets/tracker.svg"),
                desc: this.$t("tracker_desc"),
                url: "https://github.com/acristoffers/tracker",
                ss: _.map([1, 2, 3], (i) => {
                    return {
                        key: i,
                        lowres: require(`@/assets/screenshots/Tracker${i}.png`),
                        hires: require(`@/assets/screenshots/Tracker${i}.png`),
                    };
                }),
            },
            cef: {
                key: "cef",
                name: "CEF3 Simple Sample",
                icon: require("../assets/cef_logo.png"),
                desc: this.$t("cefss_desc"),
                url: "https://github.com/acristoffers/CEF3SimpleSample",
            },
            sigaa: {
                key: "sigaa:notas",
                name: "SIGAA:Notas",
                icon: require("../assets/sigaa_logo.svg"),
                desc: this.$t("sigaa_desc"),
                url: "https://github.com/acristoffers/SIGAAGrades",
                ss: _.map([1, 2, 3, 4], (i) => {
                    return {
                        key: i,
                        lowres: require(`@/assets/screenshots/SIGAA_Notas${i}.png`),
                        hires: require(`@/assets/screenshots/SIGAA_Notas${i}.png`),
                        desc: this.$t(`sigaa_notas${i}_desc`),
                    };
                }),
            },
        };
    }

    public setImage(image: string) {
        this.$store.dispatch("setImage", image);
    }

    public isActiveRoute(project: string): boolean {
        return this.shouldShow(project).length === 0;
    }

    protected keyUp(event: KeyboardEvent) {
        const projects = _.values(this.projects).map((v) => v.key);
        const active = projects.findIndex(this.isActiveRoute);

        switch (event.key) {
            case "h": {
                const n = projects.length;
                const index = (((active - 1) % n) + n) % n;
                this.$router.push(`/projects/${projects[index]}`);
                break;
            }
            case "l": {
                const n = projects.length;
                const index = (((active + 1) % n) + n) % n;
                this.$router.push(`/projects/${projects[index]}`);
                break;
            }
        }
    }

    protected mounted() {
        window.addEventListener("keyup", this.keyUp);
    }

    protected beforeDestroy() {
        window.removeEventListener("keyup", this.keyUp);
    }
}
</script>

<style scoped lang="scss">
#projects {
    text-align: center;

    @media only screen and (max-device-width: 900px) {
        #project-list {
            display: none;
        }

        .project {
            .desc-text {
                text-align: justify;
            }

            .desc {
                margin-bottom: 1rem;
                img {
                    width: 86px;
                }
            }

            .screenshots {
                .screenshot {
                    margin-bottom: 1rem;

                    img {
                        width: 100%;
                    }
                }
            }
        }
    }

    @media only screen and (min-device-width: 900px) {
        #project-list {
            display: inline-flex;
            list-style-type: none;
            width: 70%;
            justify-content: space-around;
            margin-bottom: 5rem;

            li {
                cursor: pointer;
                text-align: center;
            }

            img {
                width: auto;
                height: 48px;
            }
        }

        .hidden {
            display: none !important;
        }

        .project {
            display: inline-flex;
            flex-direction: row;
            text-align: justify;
            width: 70%;

            .desc {
                font-size: 14pt;

                img {
                    width: auto;
                    height: 48px;
                    vertical-align: middle;
                }

                .project-name {
                    display: inline-block;
                    vertical-align: middle;
                    margin-left: 1rem;
                    text-align: left;
                }
            }

            .screenshots {
                flex: 1;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                min-width: 60%;

                .screenshot {
                    width: 40%;
                    margin-bottom: 1rem;

                    img {
                        width: 100%;
                        height: auto;
                        cursor: pointer;
                    }
                }
            }
        }
    }
}
</style>
