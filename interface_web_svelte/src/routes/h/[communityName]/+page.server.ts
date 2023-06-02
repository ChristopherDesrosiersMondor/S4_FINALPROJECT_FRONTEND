import { communityUrl, postUrl } from '$lib/config';


/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    let community: { id: any; } = null;
    const url = communityUrl + 'communities/get/' + params.communityName;
    const response = await fetch(url);
    community = await response.json();

    let posts = null;
    const postsUrl = postUrl + 'posts/view/all';
    const response2 = await fetch(postsUrl);
    posts = await response2.json()
    console.log(posts)
    const returnPosts: { id: any; }[] = []

    posts.forEach((post: {
        postIdCom: any; id: any; 
}) => {
        if (post.postIdCom == community.id) {
            returnPosts.push(post)
        }
    });
    
    return {
        community,
        returnPosts
    };

}