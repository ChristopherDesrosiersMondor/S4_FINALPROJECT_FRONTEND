import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()


/** @type {import('./$types').PageLoad} */
export async function load({ params }) {
    let community;
    async function getCommunityById() {
        community = await prisma.community.findFirst({
            where: { community_name: params.communityName },
          })
        console.log(community)
    }
    
    try {
        getCommunityById();
        return community;
    } catch (e) {
        return null;
    }

}