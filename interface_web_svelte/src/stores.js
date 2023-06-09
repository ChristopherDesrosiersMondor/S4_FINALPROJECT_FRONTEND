import { writable } from "svelte/store";

export const login_modal_shown = writable(false);
export const create_account_modal_shown = writable(false);
export const create_account_next_modal_shown = writable(false);
export const loggedIn = writable(false);
export const isVisible = writable(true);
export const create_community_modal_shown = writable(false);


export const userPseudo = writable('');

export const postBody = writable('');
export const postTitle = writable('');
export const postSource = writable('');
export const userId = writable('');
export const comId = writable(0);