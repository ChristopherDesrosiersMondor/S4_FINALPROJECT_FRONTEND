import { communityUrl } from '$lib/config.js';
/** @type {import('./$types').PageLoad} */
export async function load() {
    try {
        const response = await fetch(communityUrl + 'communities/view/all');
        const communities = await response.json();
        return {
            communities
        };
    } catch (e) {
        return null
    }

}