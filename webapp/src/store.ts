import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

interface IState {
    image: string;
}

export default new Vuex.Store({
    state: {
        image: '',
    },
    mutations: {
        setImage(state: IState, image: string) {
            state.image = image;
        },
    },
    actions: {
        setImage({ commit }, image: string) {
            commit('setImage', image);
        },
        clrImage({ commit }) {
            commit('setImage', '');
        },
    },
});
