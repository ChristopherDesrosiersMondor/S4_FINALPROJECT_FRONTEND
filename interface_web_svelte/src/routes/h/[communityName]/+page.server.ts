import { PrismaClient, type community } from '@prisma/client'
const prisma = new PrismaClient()


/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    async function getCommunityById() {
        const a_community:community = await prisma.community.findFirst({
            where: { community_name: params.communityName },
          }, )
        return a_community;
    }
    
    try {
        const community = getCommunityById();
        return community;
    } catch (e) {
        return null as unknown;
    }

}