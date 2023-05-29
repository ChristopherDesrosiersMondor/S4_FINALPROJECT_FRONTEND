import { postUrl } from '$lib/config.js';
/** @type {import('./$types').PageLoad} */
export async function load() {
    try {
        const response = await fetch(postUrl + 'posts/view/all');
        const posts = await response.json();
        return {
            posts
        };
    } catch (e) {
        return null
    }

}