import { create } from 'zustand'

export enum AuthStatus {
    authenticated = "authenticated",
    unauthenticated = "unauthenticated"
}

interface AuthState {
    authStatus: AuthStatus
    login: () => void
    logout: () => void
}

function loginService() {
    const platfromAPI = "http://10.0.0.14:8080/v1"
    const loginEndpoint = platfromAPI + "/auth/login"

    fetch(loginEndpoint, {method: "POST"})
        .then(async(res) => {
            console.log(await res.json())
        })
        .catch(err => {
            console.error(err)
        })
}

export const useAuthStore = create<AuthState>()((set) => ({
    authStatus: AuthStatus.unauthenticated,
    // TODO: actually add auth
    login: () => {
        loginService()
        set((state) => ({
            authStatus: AuthStatus.authenticated
        }))
    },
    logout: () => set((state) => ({authStatus: AuthStatus.unauthenticated}))
}))