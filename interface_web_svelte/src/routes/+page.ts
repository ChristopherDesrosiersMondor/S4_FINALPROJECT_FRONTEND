import { postUrl } from '$lib/config.js';
/** @type {import('./$types').PageLoad} */
export async function load({ params }) {
    const response = await fetch(postUrl + 'posts/view/all');
	const posts = await response.json();
    return {
        posts
    };
}