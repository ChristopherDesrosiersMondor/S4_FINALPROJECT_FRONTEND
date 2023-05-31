import { communityUrl } from '$lib/config';


/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    let community = null;
    const url = communityUrl + 'communities/get/' + params.communityName;
    const response = await fetch(url);
    community = await response.json();
    
    return {
        community
    };

}