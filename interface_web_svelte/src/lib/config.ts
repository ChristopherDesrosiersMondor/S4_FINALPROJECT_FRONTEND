// You can access exported variables with $lib
import { dev } from '$app/environment'

export const title = 'Hublot'
export const description = 'A port in the storm'
export const url = dev ? 'http://localhost:5173/' : ''


export const accountUrl = 'http://localhost:8082/'
export const communityUrl = 'http://localhost:8081/'
export const postUrl = 'http://localhost:8083/'