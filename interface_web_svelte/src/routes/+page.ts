/** @type {import('./$types').PageLoad} */
export async function load({ params }) {
    const response = await fetch('http://localhost:8083/posts/view/all');
	const posts = await response.json();
    return {
        posts
    };
}